<?php
require(APPPATH . 'libraries/REST_Controller.php');
require(APPPATH . 'models/entities/Organization_entity.php');

class Organizations extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('repos/Organization_repository', 'organization_repository');
    }

    /**
     * Search organization by id
     */
    public function byid_get()
    {
        if(!$this->get('id')){
            $this->response($result, parent::HTTP_NOT_FOUND);
        }

        $id = $this->get('id');
        $result = $this->organization_repository->get_byid_org($id);
        $this->response($result, parent::HTTP_OK);
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
        try {
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
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Update organization
     */
    public function index_put()
    {
        try {
            $entity = new Organization_entity(
                array(
                    'org_num'=> $this->put('org_num'),
                    'org_name'=> $this->put('org_name'),
                    'org_code'=> $this->put('org_code'),
                    'org_address'=> $this->put('org_address'),
                    'org_email'=> $this->put('org_email'),
                    'org_work_telp'=> $this->put('org_work_telp'),
                    'org_fax'=> $this->put('org_fax'),
                    'org_postal_code'=> $this->put('org_postal_code'),
                    'org_parent' => $this->put('org_parent')
                )
            );
            
            $result = $this->organization_repository->update_organization($entity);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Delete organization
     */
    public function index_delete()
    {
        try {
            $orgnum = $this->delete('org_num');
            $result = $this->organization_repository->delete_organization($orgnum);
            $this->response($result, parent::HTTP_OK);
        } catch (Exception $e) {
            $this->response($e->getMessage(), parent::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
