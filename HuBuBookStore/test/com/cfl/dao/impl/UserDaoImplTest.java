package com.cfl.dao.impl;

import com.cfl.dao.UserDao;
import com.cfl.domain.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserDaoImplTest {
    UserDao ud;

    @Before
    public  void getBeans(){
        ClassPathXmlApplicationContext applicationContenxt = new ClassPathXmlApplicationContext("spring.xml");

        ud = (UserDao) applicationContenxt.getBean("userDaoImpl");

    }

    @Test
    public void addUser() {
        User u = new User();
        u.setUserName("xxx");
        u.setEmail("xxxxxx");
        boolean x = ud.addUser(u);
        Assert.assertTrue(x);
    }

    @Test
    public void delUserById() {
        boolean x = ud.delUserById("4028938162f0f8d20162f0f8dc210000");
        Assert.assertTrue(x);
    }

    @Test
    public void updateUser() {
        User user = new User() ;
        user.setId("1ee589b2-13a2-4c9b-a4fd-3e93dfd0a115");
        user.setUserName("zhangsan");
        user.setPassWord("123");
        user.setEmail("xxxx");//不可为空
        boolean x = ud.updateUser(user);
        Assert.assertTrue(x);
    }

    @Test
    public void findUserByName() {
        User u = ud.findUserByName("zhangsan");
        Assert.assertNotNull(u);
    }

    @Test
    public void findUserById() {
        User u = ud.findUserById("1ee589b2-13a2-4c9b-a4fd-3e93dfd0a115");
        Assert.assertNotNull(u);
    }

    @Test
    public void findAllUsers() {
    }

    @Test
    public void findPageUsers() {
        List<User> list = ud.findPageUsers(1,5);
        Assert.assertTrue(list.size()>0);
    }

    @Test
    public void findTotalRecordCounts() {
        int x = ud.findTotalRecordCounts();
        Assert.assertTrue(x>=0);
    }
}