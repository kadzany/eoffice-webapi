<?php
require(APPPATH . 'libraries/REST_Controller.php');

class Employee extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('legacy/employee');
    }

    public function index_get()
    {
        $data = array('returned: '. $this->get('id'));
        $this->response($data);
    }

    public function index_post()
    {
      $data = array('returned: '. $this->get('id'));
      $this->response($data);
    }
}
