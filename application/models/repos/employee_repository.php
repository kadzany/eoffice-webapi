<?php
require_once(APPPATH . 'models/repos/RepoConstants.php');
/**
 * @EmpRepo
 * Repository pattern
 */
class Employee_repository extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('legacy/organization', 'legacy_organization');
        $this->load->model('repos/Counter_repository');
    }

    /**
     * @Private
     * Fungsi untuk meng-update counter
     */
    private function counter_assignment()
    {
        try {
            $this->Counter_repository->employee_counter_increment();
        } catch (Exception $e) {
            throw $e;
        }
    }

    /**
     * @Private
     */
    private function is_emp_id_existed($emp_id){
        $this->db->select('1');
        $this->db->from('hrms_employees');
        $this->db->where('emp_id', $emp_id);

        $q = $this->db->get();
        $row = $q->row();
        return count($row) > 0;
    }

    /**
     * @Private
     */
    private function is_employee_existed($empnum){
        $this->db->select('1');
        $this->db->from('hrms_employees');
        $this->db->where('emp_num', $empnum);

        $q = $this->db->get();
        $row = $q->row();
        return count($row) > 0;
    }

    /**
     * function untuk memperoleh detail data dari employee
     * berdasarkan usernamenya
     */
    public function get_detail_emp($username)
    {
        $this->db->select('A.emp_num,A.emp_id as id_emp,A.emp_password,A.emp_username,A.emp_firstname,A.emp_lastname,A.job_code,A.emp_role');
        $this->db->from('hrms_employees as A');
        $this->db->where('A.emp_username', $username);
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * function untuk memperoleh list seluruh employee
     */
    public function get_all_emp($keyword, $filter)
    {
        //$this->db->select('A.emp_id,A.emp_num,A.emp_firstname,A.emp_password,A.emp_username,A.emp_lastname,A.emp_dob,A.emp_email,A.emp_street,B.job_name, \'\' as org_name, A.emp_gender');
        $this->db->select('A.*,B.job_name, \'\' as org_name');
        $this->db->from('hrms_employees as A');
        $this->db->where('A.emp_firstname not like', 'admin');
        // $this->db->where('A.emp_id <>', 9999);
        // $this->db->where('A.emp_id <>', 0000000);
        // $this->db->where('A.emp_id <>', 9998);
        $this->db->join('hrms_job as B', 'A.emp_job=B.job_num', 'left');
        // $this->db->join('hrms_organization as C', 'B.org_num=C.org_num');

        if ($keyword != null && $filter != null) {
            $this->db->like(strtolower($filter), strtolower($keyword));
        }

        $this->db->order_by('A.emp_num', 'ASC');
        $q = $this->db->get();

        return $q->result();
    }

    public function get_byid_emp($empnum)
    {
        //$this->db->select('A.emp_id,A.emp_num,A.emp_firstname,A.emp_password,A.emp_username,A.emp_lastname,A.emp_dob,A.emp_email,A.emp_street,B.job_name, \'\' as org_name, A.emp_gender');
        $this->db->select('A.*,B.job_name, \'\' as org_name');
        $this->db->from('hrms_employees as A');
        $this->db->where('A.emp_num', $empnum);
        $this->db->join('hrms_job as B', 'A.emp_job=B.job_num', 'left');
        // $this->db->join('hrms_organization as C', 'B.org_num=C.org_num');

        $this->db->order_by('A.emp_num', 'ASC');
        $q = $this->db->get();

        return $q->result();
    }

    /**
     * Function untuk menambah employee
     */
    public function add_employee($entity)
    {
        try{
            if (get_class($entity) != 'Employee_entity') {
                throw new Exception("Error @EmpRepo: Invalid entity type!");
            }

            $data = array(
                "emp_id" => $entity->emp_id,
                "emp_firstname" => $entity->emp_firstname,
                "emp_lastname" => $entity->emp_lastname,
                "emp_gender" => $entity->emp_gender,
                "emp_dob" => $entity->emp_dob,
                "emp_street" => $entity->emp_street,
                "emp_email" => $entity->emp_email,
                "emp_cutah" => $entity->emp_cutah,
                "emp_trip" => $entity->emp_trip,
                "emp_cubes" => $entity->emp_cubes,
                // "org_code" => $entity->org_code,
                // "org_id" => $entity->emp_org,
                "emp_job" => $entity->emp_job,
                "job_code" => $entity->job_code,
                // "org_code" => $entity->org_code,
                "emp_username" => $entity->emp_username,
                "emp_password" => md5($entity->emp_password)
            );
    
            if ($this->is_emp_id_existed($entity->emp_id) == true) {
                throw new Exception("Error @EmpRepo: Employee Id already existed!");
            }
            
            $this->db->trans_begin();

            $q = $this->db->insert('hrms_employees', $data);
            $empnum = $this->db->insert_id();

            if ($q == 0) {
                throw new Exception('Error @EmpRepo: No rows affected!');
            }

            if ($this->db->trans_status() == false) {
                $this->db->trans_rollback();
                return null;
            }
    
            $this->counter_assignment();
            $this->db->trans_commit();
            return $empnum;
        }
        catch(Exception $e){
            throw $e;
        }
    }

    /**
     * Function untuk mengubah employee
     */
    public function update_employee($entity)
    {
        try{
            if (get_class($entity) != 'Employee_entity') {
                throw new Exception("Error @EmpRepo: Invalid entity type!");
            }

            $data = array(
                "emp_num" => $entity->emp_num,
                "emp_id" => $entity->emp_id,
                "emp_firstname" => $entity->emp_firstname,
                "emp_lastname" => $entity->emp_lastname,
                "emp_gender" => $entity->gender,
                "emp_dob" => $entity->emp_dob,
                "emp_street" => $entity->emp_street,
                "emp_email" => $entity->emp_email,
                "emp_cutah" => "10",
                "emp_trip" => "10",
                "emp_cubes" => "10",
                "org_code" => $entity->org_code,
                "org_id" => $entity->emp_org,
                "emp_job" => $entity->emp_job,
                "job_code" => $entity->job_code,
                "org_code" => $entity->org_code,
                "emp_username" => $entity->emp_username,
                "emp_password" => md5($entity->emp_password)
            );

            if ($this->is_emp_id_existed($entity->emp_id) != true) {
                throw new Exception("Error @EmpRepo: Cannot Update: Employee Id does not exists or already deleted!");
            }
            
            $this->db->trans_begin();
            
            $this->db->where('emp_num', $data['emp_num']);
            $this->db->update('hrms_employees', $data);

            if ($q == 0) {
                throw new Exception('Error @EmpRepo: No rows affected!');
            }

            if ($this->db->trans_status() == false) {
                $this->db->trans_rollback();
                return null;
            }
    
            $this->db->trans_commit();
            return true;
        }catch(Exception $e){
            throw $e;
        }
    }

    /**
     * Function untuk menghapus employee
     */
    public function delete_employee($empnum)
    {
        try {
            if ($this->is_employee_existed($empnum) != true) {
                throw new Exception("Error @EmpRepo: Cannot Delete: Employee does not exists or already deleted!");
            }

            $this->db->trans_begin();
            
            $this->db->where('emp_num', $empnum);
            $q = $this->db->delete('hrms_employee');
            
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
