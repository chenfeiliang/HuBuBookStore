package com.cfl.dao.impl;

import com.cfl.dao.BookDao;
import com.cfl.domain.Book;
import com.cfl.domain.Category;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;


public class BookDaoImplTest {

    BookDao bd;

   @Before
    public  void getBeans(){
        ClassPathXmlApplicationContext applicationContenxt = new ClassPathXmlApplicationContext("spring.xml");

        bd = (BookDao) applicationContenxt.getBean("bookDaoImpl");

    }

    @Test
    public void addBook() {
        Book book = new Book();
        book.setName("围城222");
        book.setAuthor("asdsad");
        book.setPrice(112);
        book.setDescription("xxxxx");
        Category c = new Category();
        c.setId("893c5acd-7d86-4fea-8872-2fc701e42f21");
        book.setCategory(c);
        book.setImageName("files/0d3611fc-0e38-475a-827e-44ee5155396d50p58PICFYP_1024.jpg");
        boolean x = bd.addBook(book);
        Assert.assertTrue(x);
    }

    @Test
    public void delBookById() {
        addBook();
        boolean x = bd.delBookById(bd.findPageBooks(1,4).get(2).getId());
/*        boolean x = bd.delBookById("32a65c64-e1a9-4b71-9218-e40aa2b8187a");*/
        Assert.assertTrue(x);
    }

    @Test
    public void delBookByCategoryId() {

    }

    @Test
    public void updateBook() {
       Book book = new Book();
       book.setId(bd.findPageBooks(1,4).get(0).getId());
       book.setName("阿达1234444");
       boolean x = bd.updateBook(book);
       Assert.assertTrue(x);
    }

    @Test
    public void findAllBooks() {
    }

    @Test
    public void findPageBooks() {
       List<Book> list = bd.findPageBooks(1,5);
       Assert.assertTrue(list.size()>0);
    }

    @Test
    public void findPageBooks1() {
        List<Book> list = bd.findPageBooks(bd.findPageBooks(1,4).get(0).getCategory().getId(),1,5);
        Assert.assertTrue(list.size()>0);
    }

    @Test
    public void findBookByName() {
    }

    @Test
    public void findBookById() {
        Book book = bd.findBookById(bd.findPageBooks(1,4).get(0).getId());

        System.out.println(book.getName());

        Assert.assertNotNull(book);
    }

    @Test
    public void findTotalRecordCounts() {
       long x = bd.findTotalRecordCounts();
       System.out.println(x);
       Assert.assertTrue(x>=0);
    }

    @Test
    public void findTotalRecordCounts1() {
    }
}