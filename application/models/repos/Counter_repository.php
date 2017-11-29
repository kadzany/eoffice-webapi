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
     * @Private
     * Fungsi untuk menambah organization counter
     */
    public function org_counter_increment()
    {
        try {
            $this->db->select('org_start_num,org_counter_id,job_start_num,job_counter_id');
            $this->db->from('hrms_counter');
            $query_counter = $this->db->get();
            $row_counter = $query_counter->row();
            if (count($row_counter) == 0) {
                throw new Exception('Error @OrgRepo: Counter not set by admin!');
            }
    
            $counter_org = $row_counter->org_counter_id;
            $counter_org++;
    
            $data_counter = array(
                'org_counter_id'=>$counter_org
            );
    
            $this->db->where('id', '1');
            $this->db->update('hrms_counter', $data_counter);
        } catch (Exception $e) {
            throw $e;
        }
    }
}
