package com.cfl.dao;

import java.util.List;

import com.cfl.domain.Book;

public interface BookDao {

    public boolean addBook(Book book);

    public boolean delBookById(String id);

    public int delBookByCategoryId(String id);

    public boolean updateBook(Book book);

    public List<Book> findAllBooks();

    public List<Book> findPageBooks(int pageNow, int pageSize);

    public List<Book> findPageBooks(String categoryId, int pageNow, int pageSize);

    public Book findBookByName(String name);

    public Book findBookById(String id);

    public long findTotalRecordCounts();

    public long findTotalRecordCounts(String categoryId);

}
