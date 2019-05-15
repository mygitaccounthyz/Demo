package com.example.ssm_springbootx.model;

import java.io.Serializable;

public abstract class User implements Serializable {

    abstract public int getId();

    abstract public void setId(int id);

    abstract public String getName();

    abstract public void setName(String Name);

    abstract public String getPass();

    abstract public void setPass(String Pass);
}
