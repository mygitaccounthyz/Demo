package com.midpac.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "orders")
public class Orders  implements Serializable {
    private int id;

    private Timestamp time;
    private Double money;
    private Integer state;
    private int gcount;
    private Good good;
    private Userdetail userdetail;
    private User user;

    public Orders(Good good,int gcount,User user,Userdetail userdetail) {
        this.good = good;
        this.gcount = gcount;
        this.money = gcount*good.getPrice();
        this.user = user;
        this.userdetail = userdetail;
        this.state=0;
        this.time=new Timestamp(new Date().getTime());
    }

    public Orders(int id) {
        this.id = id;
    }

    public Orders() {
    }

    @ManyToOne
    @JoinColumn(name = "uid")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne
    @JoinColumn(name = "udid")
    public Userdetail getUserdetail() {
        return userdetail;
    }

    public void setUserdetail(Userdetail userdetail) {
        this.userdetail = userdetail;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "gid")
    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
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
    @Column(name = "money")
    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    @Basic
    @Column(name = "state")
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Basic
    @Column(name = "gcount")
    public int getGcount() {
        return gcount;
    }

    public void setGcount(int gcount) {
        this.gcount = gcount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Orders orders = (Orders) o;
        return id == orders.id ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, time, money, state, gcount);
    }
}
