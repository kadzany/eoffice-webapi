<?php
require(APPPATH . 'libraries/REST_Controller.php');

class Organizations extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('repos/organization_repository', 'organization_repository');
    }

    /**
     * Search organizations
     */
    public function index_get()
    {
        $filter = $this->get('filter');
        $keyword = $this->get('keyword');
        $result = $this->organization_repository->get_all_org($filter, $keyword);
        $this->response($result);
    }

    /**
     * Add organization
     */
    public function index_post()
    {

    }
}
