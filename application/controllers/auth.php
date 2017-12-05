<?php
require_once(APPPATH . 'libraries/REST_Controller.php');

class Auth extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('repos/auth_repository');
    }

    public function index_get()
    {
        $data = array('returned: '. $this->get('id'));
        $this->response($data);
    }

    public function index_post()
    {
        $result = $this->auth_repository->validate($this->post('username'), $this->post('password'));
        $this->response($result, parent::HTTP_OK);
    }
}
