package com.midpac.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "userdetail")
public class Userdetail  implements Serializable {
    private int did;
    private String receiver;
    private String phone;
    private String address;
    private User user;
    private Set<Orders> orders;

    public Userdetail() {
    }

    public Userdetail(int did) {
        this.did = did;
    }

    public Userdetail(String receiver, String phone, String address, User user) {
        this.receiver = receiver;
        this.phone = phone;
        this.address = address;
        this.user = user;
    }

    public Userdetail(int did, String receiver, String phone, String address, User user) {
        this.did = did;
        this.receiver = receiver;
        this.phone = phone;
        this.address = address;
        this.user = user;
    }

    @OneToMany(mappedBy = "userdetail")
    public Set<Orders> getOrders() {
        return orders;
    }

    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }

    @ManyToOne
    @JoinColumn(name = "uid")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Id
    @Column(name = "did")
    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    @Basic
    @Column(name = "receiver")
    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Userdetail that = (Userdetail) o;
        return Objects.equals(did, that.did);
    }

    @Override
    public int hashCode() {
        return Objects.hash(did, receiver, phone, address);
    }
}
