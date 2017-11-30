<?php
/**
 * @OrgRepo
 * Repository pattern
 */
class Counter_repository extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @private
     * Fungsi get max id nya counter
     * CONS: Expensive SQL calls
     */
    public function get_max_counter_id()
    {
        $maxid = 0;
        $row = $this->db->query('select max(id) as maxid from hrms_counter')->row();
        if ($row) {
            $maxid = $row->maxid;
        }
        return $maxid;
    }

    /**
    * @private
    * Fungsi get counter
    * CONS: Expensive SQL calls
    */
    public function get_counter()
    {
        try {
            $maxid = $this->get_max_counter_id();
        
            $this->db->select('org_start_num,org_counter_id,job_start_num,job_counter_id,emp_start_num,emp_counter_id');
            $this->db->from('hrms_counter');
            $this->db->where('id', $maxid);
            $query = $this->db->get();
            $result = $query->row();
        
            if (count($result) == 0) {
                throw new Exception('Error @OrgRepo: Counter not set by admin!');
            }

            return $result;
        } catch (Exception $e) {
            throw $e;
        }
    }

    /**
     * @Public
     * Fungsi untuk menambah organization counter
     */
    public function org_counter_increment()
    {
        try {
            $counter = $this->get_counter();
            $counter_job = $counter->job_counter_id;
            $counter_job++;
    
            $data_counter = array(
                'job_counter_id'=>$counter_job
            );
    
            $maxid = $this->get_max_counter_id();
            $this->db->where('id', $maxid);
            $this->db->update('hrms_counter', $data_counter);
        } catch (Exception $e) {
            throw $e;
        }
    }

    /**
     * @Public
     * Fungsi untuk menambah counter pekerjaan
     */
    public function job_counter_increment()
    {
        try {
            $counter = $this->get_counter();
            $counter_org = $counter->emp_counter_id;
            $counter_org++;
    
            $data_counter = array(
                'org_counter_id'=>$counter_org
            );
    
            $maxid = $this->get_max_counter_id();
            $this->db->where('id', $maxid);
            $this->db->update('hrms_counter', $data_counter);
        } catch (Exception $e) {
            throw $e;
        }
    }

    /**
     * @Public
     * Fungsi untuk menambah employee counter
     */
    public function employee_counter_increment()
    {
        try {
            $counter = $this->get_counter();
            $counter_emp = $counter->emp_counter_id;
            $counter_emp++;
    
            $data_counter = array(
                'emp_counter_id'=>$counter_emp
            );
    
            $maxid = $this->get_max_counter_id();
            $this->db->where('id', $maxid);
            $this->db->update('hrms_counter', $data_counter);
        } catch (Exception $e) {
            throw $e;
        }
    }
}
