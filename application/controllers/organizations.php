<?php
require(APPPATH . 'libraries/REST_Controller.php');
require(APPPATH . 'models/entities/Organization_entity.php');

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
        $this->response($result, parent::HTTP_OK);
    }

    /**
     * Create organization
     */
    public function index_post()
    {
        try{
            $entity = new Organization_entity(
                array(
                    'org_name'=> $this->post('org_name'),
                    'org_code'=> $this->post('org_code'),
                    'org_address'=> $this->post('org_address'),
                    'org_email'=> $this->post('org_email'),
                    'org_work_telp'=> $this->post('org_work_telp'),
                    'org_fax'=> $this->post('org_fax'),
                    'org_postal_code'=> $this->post('org_postal_code'),
                    'org_parent' => $this->post('org_parent')
                )
            );
            
            $result = $this->organization_repository->add_organization($entity);
            // $this->response($result, parent::HTTP_OK);
        }
        catch(Exception $e){
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
        
    }

    /**
     * Update organization
     */
    public function index_put()
    {
    }
}
