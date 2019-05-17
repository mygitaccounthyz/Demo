package com.example.ssm_springbootx.model;

import java.io.Serializable;

public abstract class User implements Serializable {

    abstract public int getId();

    abstract public String getName();

    abstract public String getPass();

}
