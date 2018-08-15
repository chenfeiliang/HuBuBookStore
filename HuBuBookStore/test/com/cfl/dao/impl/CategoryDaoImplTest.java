package com.cfl.dao.impl;

import com.cfl.dao.CategoryDao;
import com.cfl.domain.Category;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class CategoryDaoImplTest {
    CategoryDao cd;

    @Before
    public  void getBeans(){
        ClassPathXmlApplicationContext applicationContenxt = new ClassPathXmlApplicationContext("spring.xml");

        cd = (CategoryDao) applicationContenxt.getBean("categoryDaoImpl");

    }
    @Test
    public void addCategory() {
        Category c = new Category();
        c.setName("java2");
        c.setDescription("xxxxx");
        boolean x = cd.addCategory(c);
        Assert.assertTrue(x);
    }

    @Test
    public void delCategoryById() {
   /*     Category c = cd.findAllCategorys().get(0);*/
        boolean x = cd.delCategoryById("4028938162f583ce0162f583d65a0000");
        Assert.assertTrue(x);
    }

    @Test
    public void updateCategory() {
        Category c = new Category();
        c.setId("4028938162f0e30c0162f0e3143a0000");
        c.setName("java1");
        c.setDescription("xxxxx");
        boolean x = cd.updateCategory(c);
        Assert.assertTrue(x);
    }

    @Test
    public void findCategoryById() {
        Category category = cd.findCategoryById("a2711cc9-1854-4d12-b09c-b9d62351e5e9");

        System.out.println(category.getName());

        Assert.assertNotNull(category);
    }

    @Test
    public void findAllCategorys() {
        List list = cd.findAllCategorys();
        Assert.assertTrue(list.size()>0);
    }

    @Test
    public void findPageCategorys() {
        List<Category> list = cd.findPageCategorys(1,5);
        Assert.assertTrue(list.size()>0);
    }

    @Test
    public void findTotalRecordCounts() {
        int x = cd.findTotalRecordCounts();
        System.out.println(x);
        Assert.assertTrue(x>=0);
    }
}