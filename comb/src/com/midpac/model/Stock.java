package com.midpac.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "stock")
public class Stock  implements Serializable {
    private int id;
    private Integer gcount;
    private Good good;

    @OneToOne
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


    public Stock(Good good,Integer gcount) {
        this.good = good;
        this.gcount = gcount;
    }

    public Stock(int id) {
        this.id = id;
    }

    public Stock() {
    }

    @Basic
    @Column(name = "gcount")
    public Integer getGcount() {
        return gcount;
    }

    public void setGcount(Integer gcount) {
        this.gcount = gcount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Stock stock = (Stock) o;
        return id == stock.id ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, gcount);
    }
}
