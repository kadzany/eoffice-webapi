<?php
if (! defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Login_model extends CI_Model
{
    public function index()
    {
    }
    
    /*
     * Untuk mem-validasi login user
     */
    public function validate()
    {
        $this->db->where('emp_username', $this->input->post('username'));
        $this->db->where('emp_password', md5($this->input->post('password')));
        $query = $this->db->get('hrms_employee');

        if ($query->num_rows() == 1) {
            $row = $query->row();
            
            if ($row->status==1 && $this->cek_pemeriksa_tetap($row->emp_id) == false) {
                return "Ok_tetap";
            } else {
                if ($row->status==1) {
                    return "Ok";
                } else {
                    return "No";
                }
            }
        } else {
            return "Tidak_ada";
        }
    }

    /*
     * Untuk cek pemeriksa tetap
     */
    public function cek_pemeriksa_tetap($empnum)
    {
        $this->db->select("emp_num");
        $this->db->from("flow_sppd");
        $this->db->where("emp_num", $empnum);
        $this->db->where('fitur_id', '4');
        $q = $this->db->get();
        
        $this->db->select("A.org_id, B.fiatur_job_num");
        $this->db->from("hrms_employees as A");
        $this->db->join('hrms_organization as B', 'B.fiatur_job_num=A.emp_job');
        $this->db->where("A.emp_num", $empnum);
        $q2 = $this->db->get();
        
        if ($q->num_rows()>=1 || $q2->num_rows()>=1) {
            return false;
        } else {
            return true;
        }
    }
}
