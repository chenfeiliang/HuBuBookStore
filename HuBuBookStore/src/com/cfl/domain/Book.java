package com.cfl.domain;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import javax.persistence.OneToMany;
import java.util.Set;

@Entity
public class Book {
    private String id;
    private String name;
    private String author;
    private float price;
    private String imageName;
    private String description;
    private Category category;
    private Set<OrderInfo> orderInfos;
    private Set<OrderItem> orderItems;

    @Id
    @GeneratedValue(generator = "uuid")  //JPA 持续性提供程序为它选择的主键生成器分配一个名称,如果该名称无效，则设置为generator
    @GenericGenerator(name = "uuid", strategy = "uuid")//name属性指定生成器名称 ，strategy属性指定具体生成器的类名。
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @OneToMany(mappedBy = "book")
    @Cascade(CascadeType.ALL)
    public Set<OrderInfo> getOrderInfos() {
        return orderInfos;
    }

    public void setOrderInfos(Set<OrderInfo> orderInfos) {
        this.orderInfos = orderInfos;
    }

    @OneToMany(mappedBy = "book")
    @Cascade(CascadeType.ALL)
    public Set<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
