<?php
require(APPPATH . 'models/repos/RepoConstants.php');
/**
 * @JobRepo
 * Repository pattern
 */
class Job_repository extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('repos/Counter_repository');
    }

    /**
     * @Private
     * Fungsi untuk mengecek job code
     */
    private function is_job_code_existed($job_code)
    {
        $this->db->select('1');
        $this->db->from('hrms_job');
        $this->db->where('job_code', $job_code);

        $q = $this->db->get();
        $row = $q->row();
        return count($row) > 0;
    }

    /**
     * @Private
     * Fungsi untuk mengecek job 
     */
    private function is_job_existed($job_num)
    {
        $this->db->select('1');
        $this->db->from('hrms_job');
        $this->db->where('job_num', $job_num);

        $q = $this->db->get();
        $row = $q->row();
        return count($row) > 0;
    }

    /**
     * @Private
     * Fungsi untuk meng-update counter
     */
    private function counter_assignment()
    {
        try {
            $this->Counter_repository->job_counter_increment();
        } catch (Exception $e) {
            throw $e;
        }
    }
    
    /**
     * Function untuk menampilkan seluruh job, based on job number
     */
    public function get_all_job($orgnum)
    {
        $this->db->select('A.job_num,A.job_id,A.job_name,A.job_description,B.org_name');
        $this->db->from('hrms_job as A');
        $this->db->join('hrms_organization as B', 'B.org_num=A.org_num');
        // $this->db->where('A.job_num !=', '30');
        // $this->db->where('A.job_num !=','45');
        if ($orgnum!=null && $orgnum!='0') {
            $this->db->where('A.org_num', $orgnum);
        }
        $query = $this->db->get();
        return $query->result();
    }

    /*
    * Prosedur untuk menambah entry pekerjaan kedalam database
    */
    public function add_job($entity)
    {
        try {
            if (get_class($entity) != 'Job_entity') {
                throw new Exception("Error @JobRepo: Invalid entity type!");
            }
            
            $data = array(
                'job_id' => $entity->job_id,
                'job_name' => $entity->job_name,
                'job_description' => $entity->job_description,
                'job_code' => $entity->job_code,
                'org_num' => $entity->organization
            );
            
            if ($this->is_job_code_existed($entity->job_code) == true) {
                throw new Exception("Error @JobRepo: Job code already existed!");
            }

            $this->db->trans_begin();

            $q = $this->db->insert('hrms_job', $data);
            $jobnum = $this->db->insert_id();

            if ($q == 0) {
                throw new Exception('Error @JobRepo: No rows affected!');
            }
            
            if ($this->db->trans_status() == false) {
                $this->db->trans_rollback();
                return null;
            }
            
            $this->counter_assignment();
            $this->db->trans_commit();
            return $jobnum;
        } catch (Exception $e) {
            throw $e;
        }
    }

    /*
    * Prosedur untuk mengubah entry pekerjaan di database
    */
    public function update_job($entity)
    {
        try {
            if (get_class($entity) != 'Job_entity') {
                throw new Exception("Error @JobRepo: Invalid entity type!");
            }
            
            $data = array(
                'job_num' => $entity->job_num,
                'job_id' => $entity->job_id,
                'job_name' => $entity->job_name,
                'job_description' => $entity->job_description,
                'job_code' => $entity->job_code,
                'org_num' => $entity->organization
            );

            if ($this->is_job_code_existed($entity->job_code) != true) {
                throw new Exception("Error @JobRepo: Cannot Update: Job code does not exists or already deleted!");
            }
            
            $this->db->trans_begin();

            $this->db->where('job_num', $data['job_num']);
            $this->db->update('hrms_job', $data);

            if ($this->db->trans_status() == false) {
                $this->db->trans_rollback();
                return false;
            }

            $this->db->trans_commit();
            return true;
        } catch (Exception $e) {
            throw $e;
        }
    }

    /*
    * Prosedur untuk menghapus entry pekerjaan di database
    */
    public function delete_job($jobnum)
    {
        try {
            if ($this->is_job_existed($jobnum) != true) {
                throw new Exception("Error @JobRepo: Cannot Delete: Job does not exists or already deleted!");
            }

            $this->db->trans_begin();
            
            $this->db->where('job_num', $jobnum);
            $q = $this->db->delete('hrms_job');
            
            if ($q == false) {
                $this->db->trans_rollback();
                return false;
            }

            $this->db->trans_commit();
            return true;
        } catch (Exception $e) {
            throw $e;
        }
    }
}
