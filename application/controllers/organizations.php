<?php
require(APPPATH . 'libraries/REST_Controller.php');

class Organizations extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('repos/organization_repository', 'organization_repository');
    }

    public function index_get()
    {
        $result = $this->organization_repository->get_all_org();
        $this->response($result);
    }

    public function index_post()
    {
    }
}
