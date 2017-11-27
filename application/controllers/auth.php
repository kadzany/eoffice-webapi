<?php
require(APPPATH . 'libraries/REST_Controller.php');

class Auth extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('legacy/login_model');
    }

    public function index_get()
    {
        $data = array('returned: '. $this->get('id'));
        $this->response($data);
    }

    public function index_post()
    {
        $result = $this->login_model->validate2($this->post('username'), $this->post('password'));
        $this->response($result, parent::HTTP_OK);
    }
}
