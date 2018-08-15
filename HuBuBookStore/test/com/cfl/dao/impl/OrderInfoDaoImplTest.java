package com.cfl.dao.impl;

import com.cfl.dao.OrderInfoDao;
import com.cfl.domain.Book;
import com.cfl.domain.OrderInfo;
import com.cfl.domain.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OrderInfoDaoImplTest {

   OrderInfoDao od;

    @Before
    public  void getBeans(){
        ClassPathXmlApplicationContext applicationContenxt = new ClassPathXmlApplicationContext("spring.xml");

        od = (OrderInfoDao) applicationContenxt.getBean("orderInfoDaoImpl");

    }
    @Test
    public void addOrderInfo() {
        OrderInfo o = new OrderInfo();
        o.setStatus(0);
        User user = new User();
        user.setId("4ce37e2e-3583-40e5-a884-474881fbfac1");
        Book book = new Book();
        book.setId("29c8552d-9960-4672-9bab-47ad2fffb32e");
        o.setUser(user);
        o.setBook(book);
        o.setOrderId("312321312");
        o.setPrice(110);
        boolean x = od.addOrderInfo(o);
        Assert.assertTrue(x);
    }

    @Test
    public void delOrderInfoById() {
        boolean x = od.delOrderInfoById("c0957391-0038-4044-8e03-f3f93b74e6d2");
        Assert.assertTrue(x);
    }

    @Test
    public void updateOrderInoNumById() {
    }

    @Test
    public void delOrderInfoByUserId() {
        boolean x = od.delOrderInfoByUserId("4ce37e2e-3583-40e5-a884-474881fbfac1");
        Assert.assertTrue(x);
    }

    @Test
    public void updateOrderInfo() {
    }

    @Test
    public void findOrderInfoByName() {
    }

    @Test
    public void findOrderInfoById() {
    }

    @Test
    public void findAllOrderInfos() {
    }

    @Test
    public void findPageOrderInfosByStatus() {

    }

    @Test
    public void findPageOrderInfos() {
    }

    @Test
    public void findTotalRecordCounts() {
    }

    @Test
    public void findTotalRecordCountsByStatus() {
    }

    @Test
    public void findIdByUserId() {
    }

    @Test
    public void updateOrderInfoStatusById() {
    }

    @Test
    public void findAllPageOrderInfos() {
    }

    @Test
    public void findTotalRecordCounts1() {
    }
}