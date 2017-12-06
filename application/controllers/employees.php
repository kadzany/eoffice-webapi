<?php
require_once(APPPATH . 'libraries/REST_Controller.php');
require_once(APPPATH . 'models/entities/Employee_entity.php');

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
        $filter = $this->get('filter');
        $keyword = $this->get('keyword');
        if ($uname) {
            $result = $this->employee_repository->get_detail_emp($uname);
        } else {
            $result = $this->employee_repository->get_all_emp($keyword, $filter);
        }
        $this->response($result, parent::HTTP_OK);
    }

    /**
    * Search pekerjaan berdasarkan id
    */
    public function byid_get()
    {
        $empnum = $this->get('id');
        $result = $this->employee_repository->get_byid_emp($empnum);
        $this->response($result, parent::HTTP_OK);
    }


    /**
     * Create employee
     */
    public function index_post()
    {
        try {
            $entity = new Employee_entity(
                array(
                    'emp_id' => $this->post('emp_id'),
                    'emp_firstname' => $this->post('emp_firstname'),
                    'emp_lastname' => $this->post('emp_lastname'),
                    'emp_gender' => $this->post('emp_gender'),
                    'emp_dob' => $this->post('emp_dob'),
                    'emp_street' => $this->post('emp_street'),
                    'emp_email' => $this->post('emp_email'),
                    'emp_cutah' => $this->post('emp_cutah'),
                    'emp_trip' =>$this->post('emp_trip'),
                    'emp_cubes' => $this->post('emp_email'),
                    // 'org_code' => $this->post('emp_cubes'),
                    // 'org_id' => $this->post('emp_org'),
                    'emp_job' => $this->post('emp_job'),
                    'job_code' => $this->post('job_code'),
                    // 'org_code' => $this->post('org_code'),
                    'emp_username' => $this->post('emp_username'),
                    'emp_password' => $this->post('emp_password')
                )
            );
            
            $result = $this->employee_repository->add_employee($entity);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
    * Update employee
    */
    public function index_put()
    {
        try {
            $entity = new Employee_entity(
                array(
                    'emp_num' => $this->put('emp_num'),
                    'emp_id' => $this->put('emp_id'),
                    'emp_firstname' => $this->put('emp_firstname'),
                    'emp_lastname' => $this->put('emp_lastname'),
                    'emp_gender' => $this->put('emp_gender'),
                    'emp_dob' => $this->put('emp_dob'),
                    'emp_street' => $this->put('emp_street'),
                    'emp_email' => $this->put('emp_email'),
                    'emp_cutah' => $this->put('emp_cutah'),
                    'emp_trip' =>$this->put('emp_trip'),
                    'emp_cubes' => $this->put('emp_email'),
                    'org_code' => $this->put('emp_cubes'),
                    'org_id' => $this->put('emp_org'),
                    'emp_job' => $this->put('emp_job'),
                    'job_code' => $this->put('job_code'),
                    'org_code' => $this->put('org_code'),
                    'emp_username' => $this->put('emp_username'),
                    'emp_password' => $this->put('emp_password')
                )
            );
            
            $result = $this->employee_repository->update_employee($entity);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Delete pekerjaan
     */
    public function delete_post()
    {
        try {
            $empnum = $this->post('emp_num');
            $result = $this->employee_repository->delete_employee($empnum);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
