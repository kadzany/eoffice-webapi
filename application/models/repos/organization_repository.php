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
        $this->load->model('repos/Counter_repository');
    }

    /**
     * @Private
     * Fungsi untuk mengecek organisasi code
     */
    private function is_org_code_existed($org_code)
    {
        $this->db->select('1');
        $this->db->from('hrms_organization');
        $this->db->where('org_code', $org_code);

        $q = $this->db->get();
        $row = $q->row();
        return count($row) > 0;
    }

    /**
     * @Private
     * Fungsi untuk mengecek organisasi 
     */
    private function is_org_existed($org_num)
    {
        $this->db->select('1');
        $this->db->from('hrms_organization');
        $this->db->where('org_num', $org_num);

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
            $this->Counter_repository->org_counter_increment();
        } catch (Exception $e) {
            throw $e;
        }
    }
    
    /**
     * Function untuk menampilkan seluruh organization
     */
    public function get_all_org($filter, $keyword)
    {
        $this->db->select('*');
        $this->db->from('hrms_organization');
        // $this->db->where('org_num !=', '8');
        if ($filter!=null && $filter!='0') {
            $this->db->like(strtolower($filter), strtolower($keyword));
        }
        $query = $this->db->get();
        return $query->result();
    }

    /*
    * Prosedur untuk menambah entry organisasi kedalam database
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
            
            if ($this->is_org_code_existed($entity->org_code) == true) {
                throw new Exception("Error @OrgRepo: Organization code already existed!");
            }

            $this->db->trans_begin();

            $q = $this->db->insert('hrms_organization', $data);
            $orgnum = $this->db->insert_id();

            if ($q == 0) {
                throw new Exception('Error @OrgRepo: No rows affected!');
            }
            
            if ($this->db->trans_status() == false) {
                $this->db->trans_rollback();
                return null;
            }

            $this->counter_assignment();
            $this->db->trans_commit();
            return $orgnum;
        } catch (Exception $e) {
            throw $e;
        }
    }

    /*
    * Prosedur untuk mengubah entry organisasi di database
    */
    public function update_organization($entity)
    {
        try {
            if (get_class($entity) != 'Organization_entity') {
                throw new Exception("Error @OrgRepo: Invalid entity type!");
            }
            
            $data = array(
                'org_num'=>$entity->org_num,
                'org_name'=>$entity->org_name,
                'org_code'=>$entity->org_code,
                'org_address'=>$entity->org_address,
                'org_email'=>$entity->org_email,
                'org_work_telp'=>$entity->org_work_telp,
                'org_fax'=>$entity->org_fax,
                'org_postal_code'=>$entity->org_postal_code,
                'org_parent' => $entity->org_parent
            );
            
            if ($this->is_org_code_existed($entity->org_code) != true) {
                throw new Exception("Error @OrgRepo: Cannot Update: Organization code does not exists or already deleted!");
            }

            $this->db->trans_begin();

            $this->db->where('org_num', $data['org_num']);
            $this->db->update('hrms_organization', $data);

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
    * Prosedur untuk menghapus entry organisasi di database
    */
    public function delete_organization($orgnum)
    {
        try {
            if ($this->is_org_existed($orgnum) != true) {
                throw new Exception("Error @OrgRepo: Cannot Delete: Organization does not exists or already deleted!");
            }

            $this->db->trans_begin();
            
            $this->db->where('org_num', $orgnum);
            $q = $this->db->delete('hrms_organization');
            
            if ($q == false) {
                $this->db->trans_rollback();
                return null;
            }
            $this->db->trans_commit();
            return true;
        } catch (Exception $e) {
            throw $e;
        }
    }
}
