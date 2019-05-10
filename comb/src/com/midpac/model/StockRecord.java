package com.midpac.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "stockrecord")
public class StockRecord  implements Serializable {
    private int id;
    private Integer gcount;
    private Timestamp time;
    private Integer state;
    private Good good;




    @ManyToOne
//            (fetch = FetchType.EAGER)
    @JoinColumn(name = "gid")
    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public StockRecord() {
    }

    public StockRecord(int id) {
        this.id = id;
    }

    public StockRecord(Good good,Integer gcount) {
        this.gcount = gcount;
        this.good = good;
        this.time=new Timestamp(new Date().getTime());
        if (gcount>0)state=1;
        else state=-1;
    }

    @Basic
    @Column(name = "gcount")
    public Integer getGcount() {
        return gcount;
    }

    public void setGcount(Integer gcount) {
        this.gcount = gcount;
    }

    @Basic
    @Column(name = "time")
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Basic
    @Column(name = "state")
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StockRecord that = (StockRecord) o;
        return id == that.id ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, gcount, time, state);
    }
}
