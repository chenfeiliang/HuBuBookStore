package com.cfl.domain;


import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class OrderItem {

    private String id;
    private int num;
    private float price;
    private Timestamp createTime;
    private Book book;
    private OrderInfo orderInfo;

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Id
    @GeneratedValue(generator = "uuid")  //JPA 持续性提供程序为它选择的主键生成器分配一个名称,如果该名称无效，则设置为generator
    @GenericGenerator(name = "uuid", strategy = "uuid")//name属性指定生成器名称 ，strategy属性指定具体生成器的类名。
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    @ManyToOne(fetch = FetchType.LAZY)
    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @OneToOne
    @JoinColumn(name = "orderInfo_id")
    public OrderInfo getOrderInfo() {
        return orderInfo;
    }

    public void setOrderInfo(OrderInfo orderInfo) {
        this.orderInfo = orderInfo;
    }
}
