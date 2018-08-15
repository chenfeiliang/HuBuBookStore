package com.cfl.service.impl;

import java.util.List;

import com.cfl.dao.BookDao;
import com.cfl.domain.Book;
import com.cfl.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bk ;

    @Override
    public boolean addBook(Book book) {
        return bk.addBook(book);
    }

    @Override
    public boolean delBookById(String id) {
        return bk.delBookById(id);
    }

    @Override
    public boolean updateBook(Book book) {
        return bk.updateBook(book);
    }

    @Transactional
    @Override
    public Book findBookById(String id) {
        return bk.findBookById(id);
    }

    @Override
    public List<Book> findPageBooks(String category, int pageNow, int pageSize) {
        return bk.findPageBooks(category, pageNow, pageSize);
    }

    @Override
    public List<Book> findPageBooks(int pageNow, int pageSize) {
        return bk.findPageBooks(pageNow, pageSize);
    }

    @Override
    public long findTotalRecordCounts() {
        return bk.findTotalRecordCounts();
    }

    public long findTotalRecordCounts(String categoryId) {
        return bk.findTotalRecordCounts(categoryId);
    }

    @Override
    public Book findBookByName(String name) {
        return null;
    }

    @Override
    public List<Book> findAllBooks() {
        return null;
    }

    public BookDao getBk() {
        return bk;
    }

    @Autowired
    public void setBk(BookDao bk) {
        this.bk = bk;
    }
}
