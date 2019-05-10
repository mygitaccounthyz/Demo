package com.midpac.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "user")
public class User  implements Serializable {
    private int uid;
    private String name;
    private String pass;
    private String sex;
    private Double money;
    private Integer grade;
    private Set<Userdetail> userdetails;
    private Set<Orders> orders;
    private Set<Trolley> trolleys;
    private Set<Comment> comments;


    public User(){}

    public User(int uid) {
        this.uid = uid;
    }

    public User(String name, String pass, Integer grade) {
        this.name = name;
        this.pass = pass;
        this.grade = grade;
    }

    @OneToMany(mappedBy = "user",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
//    @org.hibernate.annotations.OrderBy(clause = "time desc")
    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @OneToMany(mappedBy = "user",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    public Set<Trolley> getTrolleys() {
        return trolleys;
    }

    public void setTrolleys(Set<Trolley> trolleys) {
        this.trolleys = trolleys;
    }

    @OneToMany(mappedBy = "user",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    public Set<Orders> getOrders() {
        return orders;
    }

    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }

    @OneToMany(mappedBy = "user",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    public Set<Userdetail> getUserdetails() {
        return userdetails;
    }

    public void setUserdetails(Set<Userdetail> userdetails) {
        this.userdetails = userdetails;
    }

    @Id
    @Column(name = "uid")
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "pass")
    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Basic
    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
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
    @Column(name = "grade")
    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(uid, user.uid) ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, name, pass, sex, money, grade);
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", name='" + name + '\'' +
                '}';
    }

}
