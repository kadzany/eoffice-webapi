<?php
require(APPPATH . 'models/entities/DBEntity.php');

/**
 * Class untuk entitas job/pekerjaan
 */
class Jobs_entity extends DBEntity
{
    public function __construct($parameters = array())
    {
        parent::__construct($parameters);
    }
}
