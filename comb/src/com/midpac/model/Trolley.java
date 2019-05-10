package com.midpac.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "trolley")
public class Trolley  implements Serializable {
    private int id;
    private Good good;
    private int gcount;
    private User user;

    @ManyToOne
    @JoinColumn(name = "gid")
    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
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
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Trolley() {
    }

    public Trolley(int id) {
        this.id = id;
    }

    public Trolley(Good good, int gcount, User user) {
        this.good=good;
        this.gcount = gcount;
        this.user = user;
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
        Trolley trolley = (Trolley) o;
        return id == trolley.id ;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id,gcount);
    }
}
