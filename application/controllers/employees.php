<?php
require(APPPATH . 'libraries/REST_Controller.php');

class Employees extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('repos/employee_repository', 'employee_repository');
    }

    public function index_get()
    {
        $result = '';
        $uname = $this->get('uname');
        if ($uname) {
            $result = $this->employee_repository->get_detail_emp($uname);
        } else {
            $result = $this->employee_repository->get_all_emp();
        }        
        $this->response($result);
    }

    public function index_post()
    {
        $data = array('returned: '. $this->get('id'));
        $this->response($data);
    }
}
