<?php
require(APPPATH . 'models/repos/RepoConstants.php');
/**
 * @OrgRepo
 * Repository pattern
 */
class Organization_repository extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('legacy/organization', 'legacy_organization');
    }

    /*
    * Function untuk menampilkan seluruh organization
    */
    public function get_all_org($filter, $keyword)
    {
        $this->db->select('*');
        $this->db->from('hrms_organization');
        $this->db->where('org_num !=', '8');
        if ($filter!=null && $filter!='0') {
            $this->db->like(strtolower($filter), strtolower($keyword));
        }
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * Fungsi untuk meng-update counter
     */
    private function counter_assignment()
    {
        $this->db->select('org_start_num,org_counter_id,job_start_num,job_counter_id');
        $this->db->from('hrms_counter');
        $query_counter = $this->db->get();
        $row_counter = $query_counter->row();
        if (count($row_counter) == 0) {
            throw new Exception('Error @OrgRepo: Counter not set by admin!');
        }

        $counter_job = $row_counter->job_counter_id;
        $counter_org = $row_counter->org_counter_id;
        $counter_job++;
        $counter_org++;

        $data_counter = array(
            'org_counter_id'=>$counter_org,
            'job_counter_id'=>$counter_job
        );

        $this->db->where('id', '1');
        $this->db->update('hrms_counter', $data_counter);
    }
    
    /*
    * Proses menambah entry organisasi kedalam database
    */
    public function add_organization($entity)
    {
        try {
            if (get_class($entity) != 'Organization_entity') {
                throw new Exception("Error @OrgRepo: Invalid entity type!");
            }
            
            $data = array(
                'org_name'=>$entity->org_name,
                'org_code'=>$entity->org_code,
                'org_address'=>$entity->org_address,
                'org_email'=>$entity->org_email,
                'org_work_telp'=>$entity->org_work_telp,
                'org_fax'=>$entity->org_fax,
                'org_postal_code'=>$entity->org_postal_code,
                'org_parent' => $entity->org_parent
            );
            
            $this->db->trans_begin();

            $this->counter_assignment();

            $q = $this->db->insert('hrms_organization', $data);
            if ($q == 0) {
                throw new Exception('Error @OrgRepo: No rows affected!');
            }
            
            if ($this->db->trans_status() === false) {
                $this->db->trans_rollback();
                return false;
            }

            $this->db->trans_commit();
            return true;
        } catch (Exception $e) {
            throw $e;
        }
    }
    
    public function get_detail_org($id)
    {
        $this->db->select('A.org_num,A.org_code,A.org_name,A.org_address,A.org_work_telp,A.org_fax,A.org_postal_code,A.org_id,A.org_email,A.org_sub,A.hr_job_num,A.kepala_job_num,B.job_num,B.job_id,B.job_name,B.job_description,B.job_code');
        $this->db->from('hrms_organization as A');
        $this->db->join('hrms_job as B', 'A.fiatur_job_num=B.job_num');
        $this->db->where('A.org_num', $id);
        
        return $this->db->get();
    }
}
