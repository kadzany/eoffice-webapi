<?php

class DbEntity
{
    public function __construct($parameters = array())
    {
        foreach ($parameters as $key => $value) {
            $this->$key = $value;
        }
    }
}
