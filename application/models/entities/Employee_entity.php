<?php
require(APPPATH . 'models/entities/DBEntity.php');

/**
 * Class untuk entitas organisasi
 */
class Employee_entity extends DBEntity
{
    public function __construct($parameters = array())
    {
        parent::__construct($parameters);
    }
}
