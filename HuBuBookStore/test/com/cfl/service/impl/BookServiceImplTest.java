package com.cfl.service.impl;

import com.cfl.domain.Book;
import com.cfl.service.BookService;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BookServiceImplTest {

    BookService bs ;

    @BeforeClass
    public  void getBeans(){
        ClassPathXmlApplicationContext applicationContenxt = new ClassPathXmlApplicationContext("spring.xml");

        bs = (BookService) applicationContenxt.getBean("bookService");

    }
    @Test
    public void addBook() {
    }

    @Test
    public void delBookById() {
    }

    @Test
    public void updateBook() {
    }

    @Test
    public void findBookById() {

        Book book = bs.findBookById("020fada5-6a88-4565-aca5-dbf4cae14d54");

        System.out.println(book.getName());

        Assert.assertNotNull(book);
    }

    @Test
    public void findPageBooks() {
        List<Book> books= bs.findPageBooks("4028938162f59f400162f59f48160000",1,4);
        for (Book b :books) {
            System.out.println(b.getName());
        }
        Assert.assertTrue(books.size()>0);
    }

    @Test
    public void findPageBooks1() {
    }

    @Test
    public void findTotalRecordCounts() {
    }

    @Test
    public void findTotalRecordCounts1() {
    }

    @Test
    public void findBookByName() {
    }

    @Test
    public void findAllBooks() {
    }

    @Test
    public void getBk() {
    }

    @Test
    public void setBk() {
    }

}