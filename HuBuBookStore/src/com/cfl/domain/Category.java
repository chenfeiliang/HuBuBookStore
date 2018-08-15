package com.cfl.domain;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.CascadeType;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Category {
    private String id;
    private String name;
    private String description;
    private Set<Book> books;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @OneToMany(mappedBy = "category")
    @Cascade(CascadeType.ALL)
    public Set<Book> getBooks() {
        return books;
    }

    public void setBooks(Set<Book> books) {
        this.books = books;
    }
}

