<?php
require_once(APPPATH . 'models/repos/RepoConstants.php');
require_once(APPPATH . 'models/entities/Job_Org_entity.php');
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
        $this->load->model('repos/Job_Org_repository');
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
     * Fungsi untuk mengecek job id
     */
    private function is_job_id_existed($job_id)
    {
        $this->db->select('1');
        $this->db->from('hrms_job');
        $this->db->where('job_id', $job_id);

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
     * Function untuk menampilkan organization by number
     */
    public function get_byid_job($jobnum)
    {
        $this->db->select('A.*, B.org_num');
        $this->db->from('hrms_job A');
        $this->db->join('hrms_job_org B', 'A.job_num = B.job_num');
        $this->db->where('A.job_num', $jobnum);
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * Function untuk menampilkan seluruh job, based on job number
     */
    public function get_all_job($jobnum)
    {
        $this->db->select('A.job_num,A.job_id,A.job_name,A.job_description');
        $this->db->from('hrms_job as A');
        // $this->db->join('hrms_organization as B', 'B.org_num=A.org_num');
        // $this->db->where('A.job_num !=', '30');
        // $this->db->where('A.job_num !=','45');
        if ($jobnum!=null && $jobnum!='0') {
            $this->db->where('A.job_num', $jobnum);
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
                // 'org_num' =>
            );
            
            if ($this->is_job_code_existed($entity->job_code) == true) {
                throw new Exception("Error @JobRepo: Job code already existed!");
            }

            if ($this->is_job_id_existed($entity->job_id) == true) {
                throw new Exception("Error @JobRepo: Job id already existed!");
            }

            if ($entity->org_num == null || $entity->org_num == '' || $entity->org_num == '0') {
                throw new Exception("Error @JobRepo: Organization number cannot be zero, empty or null!");
            }

            $this->db->trans_begin();

            $q = $this->db->insert('hrms_job', $data);
            $jobnum = $this->db->insert_id();

            if ($q == 0) {
                throw new Exception('Error @JobRepo: No rows affected!');
            }
            
            // add the relationship to the organization num
            $jobOrgEntity = new Job_Org_entity(
                array(
                    'job_num' => $jobnum,
                    'org_num' => $entity->org_num
                )
            );

            $org = $this->Job_Org_repository->add_job_org($jobOrgEntity);
            
            if ($this->db->trans_status() == false || $org == null) {
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
                // 'org_num' => $entity->org_num
            );

            if ($this->is_job_code_existed($entity->job_code) != true) {
                throw new Exception("Error @JobRepo: Cannot Update: Job code does not exists or already deleted!");
            }
            
            $this->db->trans_begin();

            $this->db->where('job_num', $data['job_num']);
            $this->db->update('hrms_job', $data);

            // add the relationship to the organization num
            /*
            $jobOrgEntity = new Job_Org_entity(
                array(
                    'job_num' => $entity->job_num,
                    'org_num' => $entity->org_num
                )
            );

            $org = $this->Job_Org_repository->upd_job_org($jobOrgEntity);
            */

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
