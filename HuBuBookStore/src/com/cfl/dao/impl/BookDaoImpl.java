package com.cfl.dao.impl;

import java.util.List;
import com.cfl.dao.BookDao;
import com.cfl.domain.Book;
import com.cfl.domain.Category;
import org.springframework.stereotype.Service;

@Service
public class BookDaoImpl extends BaseDaoImpl implements BookDao {

    @Override
    public boolean addBook(Book book) {
        boolean flag = save(book);
        return flag;
    }

    @Override
    public boolean delBookById(String id) {
        Book book = getHibernateTemplate().load(Book.class, id);
        if (book!=null){
            boolean x = delete(book);
        }
        return false;
    }

    @Override
    public int delBookByCategoryId(String id) {
        return 0;
    }

    @Override
    public boolean updateBook(Book book) {

        Book b = getHibernateTemplate().load(Book.class, book.getId());

        if(b!=null){

            if(book.getName()!=null) b.setName(book.getName());
            if(book.getPrice()!=b.getPrice()) b.setPrice(book.getPrice());
            if(book.getAuthor()!=null) b.setName(book.getAuthor());
            if(book.getDescription()!=null) b.setDescription(book.getDescription());
            if(book.getImageName()!=null) b.setImageName(book.getImageName());

            Category c = (Category) findByHql("from Category where id = ?",book.getCategory().getId()).uniqueResult();

            if(c!=null){
                b.setCategory(book.getCategory());
            }
            return update(b);
        }

        return false;
    }

    @Override
    public List<Book> findAllBooks() {
        return null;
    }

    @Override
    public List<Book> findPageBooks(int pageNow, int pageSize) {
        List<Book> list = findByHql("from Book").setFirstResult((pageNow - 1) * pageSize).setMaxResults(pageSize).list();

        return list;

    }

    @Override
    public List<Book> findPageBooks(String categoryId, int pageNow, int pageSize) {
        List<Book> list = findByHql("from Book as b where b.category.id = ?",categoryId).setFirstResult((pageNow - 1) * pageSize).setMaxResults(pageSize).list();

        return list;


    }

    @Override
    public Book findBookByName(String name) {
        return null;
    }


    @Override
    public Book findBookById(String id) {
        Book book = (Book) findByHql("from Book as b where b.id = ?",id).uniqueResult();
        if(book!=null){
            return book;
        }
        return null;
    }

    @Override
    public long findTotalRecordCounts() {
        long count = (Long) findByHql("select count(b) from Book as b").uniqueResult();
        return count;
    }

    @Override
    public long findTotalRecordCounts(String categoryId) {
        long count = (Long)findByHql("select count(b) from Book as b where b.category.id = ?",categoryId).uniqueResult();
        return count; }
}
