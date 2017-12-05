<?php
require_once(APPPATH . 'models/repos/RepoConstants.php');
/**
 * @JobOrgRepo
 * Repository pattern
 */
class Job_Org_repository extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    private function is_combi_existed($orgnum, $jobnum)
    {
        $this->db->select('1');
        $this->db->from('hrms_job_org');
        $this->db->where('org_num', $orgnum);
        $this->db->where('job_num', $jobnum);

        $q = $this->db->get();
        $row = $q->row();
        return count($row) > 0;
    }

    /*
    * Prosedur untuk menambah entry organisasi kedalam database
    */
    public function add_job_org($entity)
    {
        try {
            if (get_class($entity) != 'Job_Org_entity') {
                throw new Exception("Error @JobOrgRepo: Invalid entity type!");
            }
            
            $data = array(
                'org_num'=>$entity->org_num,
                'job_num'=>$entity->job_num
            );
            
            if ($this->is_combi_existed($entity->org_num, $entity->job_num) == true) {
                throw new Exception("Error @JobOrgRepo: Relationship of job ". $entity->job_num ." and organization ". $entity->org_num  ."already existed!");
            }

            $this->db->trans_begin();

            $q = $this->db->insert('hrms_job_org', $data);
            $jobOrgNum = $this->db->insert_id();

            if ($q == 0) {
                throw new Exception('Error @JobOrgRepo: No rows affected!');
            }
            
            if ($this->db->trans_status() == false) {
                $this->db->trans_rollback();
                return null;
            }

            $this->db->trans_commit();
            return $jobOrgNum;
        } catch (Exception $e) {
            throw $e;
        }
    }
}
