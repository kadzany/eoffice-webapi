<?php
require_once(APPPATH . 'models/entities/DBEntity.php');

/**
 * Class untuk entitas relasi antara job dan organisasi
 */
class Job_Org_entity extends DBEntity
{
    public function __construct($parameters = array())
    {
        parent::__construct($parameters);
    }
}
