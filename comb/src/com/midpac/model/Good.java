package com.midpac.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "good")
public class Good  implements Serializable {
    private int id;
    private String name;
    private Double price;
    private String type;
    private String description;
    private String factory;
    private Integer state;
    private Stock stock;
    private Set<Orders> orders;
    private Set<StockRecord> stockRecords;
    private Set<Trolley> trolleys;
    private Set<Comment> comments;


    @OneToMany(mappedBy = "good",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @OneToMany(mappedBy = "good")
    public Set<Trolley> getTrolleys() {
        return trolleys;
    }

    public void setTrolleys(Set<Trolley> trolleys) {
        this.trolleys = trolleys;
    }

    public Good(String name, Double price, String type, String description, String factory) {
        this.name = name;
        this.price = price;
        this.type = type;
        this.description = description;
        this.factory = factory;
        this.state=1;
    }

    public Good(int id) {
        this.id = id;
    }

    public Good() {}

    @OneToMany(mappedBy = "good")
    public Set<StockRecord> getStockRecords() {
        return stockRecords;
    }

    public void setStockRecords(Set<StockRecord> stockRecords) {
        this.stockRecords = stockRecords;
    }

    @OneToOne(mappedBy = "good")
    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    @OneToMany(mappedBy = "good")
    public Set<Orders> getOrders() {
        return orders;
    }

    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "price")
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "factory")
    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
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
        Good good = (Good) o;
        return Objects.equals(id, good.id) &&
                Objects.equals(name, good.name) &&
                Objects.equals(price, good.price) &&
                Objects.equals(type, good.type) &&
                Objects.equals(description, good.description) &&
                Objects.equals(factory, good.factory) &&
                Objects.equals(state, good.state);
    }

    @Override
    public String toString() {
        return "Good{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, price, type, description, factory, state);
    }
}
