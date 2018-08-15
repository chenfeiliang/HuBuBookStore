package com.cfl.domain;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.CascadeType;
import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Users")
public class User {

    private String id;
    private String userName;
    private String passWord;
    private String cellPhone;
    private String mobilePhone;
    private String address;
    private String email;
    private Set<OrderInfo> orderInfos;

    @Id
    @GeneratedValue(generator = "uuid")  //JPA 持续性提供程序为它选择的主键生成器分配一个名称,如果该名称无效，则设置为generator
    @GenericGenerator(name = "uuid", strategy = "uuid")//name属性指定生成器名称 ，strategy属性指定具体生成器的类名。
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @OneToMany(mappedBy = "user")
    @Cascade(CascadeType.ALL)
    public Set<OrderInfo> getOrderInfos() {
        return orderInfos;
    }

    public void setOrderInfos(Set<OrderInfo> orderInfos) {
        this.orderInfos = orderInfos;
    }
}
