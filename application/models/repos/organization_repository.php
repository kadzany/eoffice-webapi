<?php
/**
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
}
