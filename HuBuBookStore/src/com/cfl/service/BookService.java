package com.cfl.service;

import java.util.List;

import com.cfl.domain.Book;

public interface BookService {


    public boolean addBook(Book book);

    public boolean delBookById(String id);

    public boolean updateBook(Book book);

    public List<Book> findAllBooks();

    public List<Book> findPageBooks(int pageNow, int pageSize);

    public List<Book> findPageBooks(String category, int pageNow, int pageSize);

    public long findTotalRecordCounts();

    public long findTotalRecordCounts(String categoryId);

    public Book findBookByName(String name);

    public Book findBookById(String id);
}
