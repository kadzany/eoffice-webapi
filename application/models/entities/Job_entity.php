<?php
require_once(APPPATH . 'models/entities/DBEntity.php');

/**
 * Class untuk entitas job/pekerjaan
 */
class Job_entity extends DBEntity
{
    public function __construct($parameters = array())
    {
        parent::__construct($parameters);
    }
}
