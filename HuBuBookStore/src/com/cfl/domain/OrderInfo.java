package com.cfl.domain;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
public class OrderInfo {

    private String id;
    private String orderId;
    private int num;
    private float price;
    private int status;
    private Timestamp createTime;
    private User user;
    private Book book;
    private OrderItem orderItem;

    @Id
    @GeneratedValue(generator = "uuid")  //JPA 持续性提供程序为它选择的主键生成器分配一个名称,如果该名称无效，则设置为generator
    @GenericGenerator(name = "uuid", strategy = "uuid")//name属性指定生成器名称 ，strategy属性指定具体生成器的类名。
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }


    @ManyToOne(fetch = FetchType.LAZY)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @OneToOne(mappedBy = "orderInfo",fetch = FetchType.LAZY)
    @Cascade(CascadeType.ALL)
    public OrderItem getOrderItem() {
        return orderItem;
    }


    public void setOrderItem(OrderItem orderItem) {
        this.orderItem = orderItem;
    }
}
