<?php
require_once(APPPATH . 'libraries/REST_Controller.php');
require_once(APPPATH . 'models/entities/Job_entity.php');

class Jobs extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('repos/Job_repository', 'job_repository');
    }
    
    /**
     * Search pekerjaan
     */
    public function index_get()
    {
        $filter = $this->get('filter');
        $result = $this->job_repository->get_all_job($filter);
        $this->response($result, parent::HTTP_OK);
    }

     /**
     * Search pekerjaan berdasarkan id
     */
    public function byid_get()
    {
        $jobnum = $this->get('id');
        $result = $this->job_repository->get_byid_job($jobnum);
        $this->response($result, parent::HTTP_OK);
    }

    /**
     * Search pekerjaan berdasarkan nomor org
     */
    public function byorgnum_get()
    {
        $jobnum = $this->get('orgnum');
        $result = $this->job_repository->get_byorgnum_job($jobnum);
        $this->response($result, parent::HTTP_OK);
    }

    /**
     * Create pekerjaan
     */
    public function index_post()
    {
        try {
            $entity = new Job_entity(
                array(
                    'job_id' => $this->post('job_id'),
                    'job_name' => $this->post('job_name'),
                    'job_description' => $this->post('job_description'),
                    'job_code' => $this->post('job_code'),
                    'org_num' => $this->post('org_num')
                )
            );
            
            $result = $this->job_repository->add_job($entity);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Update pekerjaan
     */
    public function index_put()
    {
        try {
            $entity = new Job_entity(
                array(
                    'job_num' => $this->put('job_num'),
                    'job_id' => $this->put('job_id'),
                    'job_name' => $this->put('job_name'),
                    'job_description' => $this->put('job_description'),
                    'job_code' => $this->put('job_code'),
                    'org_num' => $this->put('organization')
                )
            );
            
            $result = $this->job_repository->update_job($entity);
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
            $jobnum = $this->post('job_num');
            $orgnum = $this->post('org_num');

            $result = $this->job_repository->delete_job($jobnum, $orgnum);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
