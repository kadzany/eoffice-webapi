<?php
require(APPPATH . 'models/repos/RepoConstants.php');
/**
 * Repository pattern
 */
class Employee_repository extends CI_Model
{
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
    public function get_all_emp()
    {
        $this->db->select('A.emp_id,A.emp_num,A.emp_firstname,A.emp_password,A.emp_username,A.emp_lastname,A.emp_dob,A.emp_email,A.emp_street,B.job_name,C.org_name');
        $this->db->from('hrms_employees as A');
        $this->db->where('A.emp_firstname not like', 'admin');
        $this->db->where('A.emp_id <>', 9999);
        $this->db->where('A.emp_id <>', 0000000);
        $this->db->where('A.emp_id <>', 9998);
        $this->db->join('hrms_job as B', 'A.emp_job=B.job_num');
        $this->db->join('hrms_organization as C', 'B.org_num=C.org_num');
        if ($this->input->post('keyword') != null && $this->input->post('filter') != null) {
            $this->db->like(strtolower($this->input->post('filter')), strtolower($this->input->post('keyword')));
        }

        $this->db->order_by('A.emp_num', 'ASC');
        $q = $this->db->get();

        return $q->result();
    }
}
