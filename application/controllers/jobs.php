<?php
require(APPPATH . 'libraries/REST_Controller.php');
require(APPPATH . 'models/entities/Jobs_entity.php');

class Organizations extends REST_Controller
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
        $result = $this->job_repository->get_all_org($filter);
        $this->response($result, parent::HTTP_OK);
    }

    /**
     * Create organization
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
                    'org_num' => $this->post('organization')
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
                    'job_num' => $this->post('job_num'),
                    'job_id' => $this->post('job_id'),
                    'job_name' => $this->post('job_name'),
                    'job_description' => $this->post('job_description'),
                    'job_code' => $this->post('job_code'),
                    'org_num' => $this->post('organization')
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
    public function index_delete()
    {
        try {
            $orgnum = $this->delete('job_num');
            $result = $this->job_repository->delete_job($orgnum);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}