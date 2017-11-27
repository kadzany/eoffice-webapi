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
    public function get_all_org()
    {
        $query = $this->legacy_organization->get_all_org();
        return $query->result();
    }
}
