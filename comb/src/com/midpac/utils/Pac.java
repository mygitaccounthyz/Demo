package com.midpac.utils;

import java.io.Serializable;

public class Pac implements Serializable {

    private String gname;
    private Integer gid;

    public Pac() {
    }

    public Pac(String name, Integer gid) {
        this.gname = name;
        this.gid = gid;
    }

    public String getGName() {
        return gname;
    }

    public void setGName(String gName) {
        this.gname = gName;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }
}
