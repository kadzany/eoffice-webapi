<?php
/**
 * Repository pattern
 */
class Auth_repository extends CI_Model
{
    /*
    * Untuk mem-validasi login user
    * @baru
    */
    public function validate($username, $password)
    {
        $this->db->where('emp_username', $username);
        $this->db->where('emp_password', md5($password));
        $query = $this->db->get('hrms_employees');

        if ($query->num_rows() == 1) {
            $row = $query->row();
            
            if ($row->status==1 && $this->cek_pemeriksa_tetap($row->emp_id) == true) {
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
    * @new
    */
    public function cek_pemeriksa_tetap($empnum)
    {
        $this->db->select("emp_num");
        $this->db->from("flow_sppd");
        $this->db->where("emp_num", $empnum);
        $this->db->where('fitur_id', '4');
        $q = $this->db->get();
        
        $this->db->select("B.is_fiatur");
        $this->db->from("hrms_employees as A");
        $this->db->join('hrms_job as B', 'B.job_num=A.emp_job');
        $this->db->where("A.emp_num", $empnum);
        $q2 = $this->db->get();
        
        if ($q->num_rows()>=1 || $q2->num_rows()>=1) {
            return true;
        } else {
            return false;
        }
    }
}
