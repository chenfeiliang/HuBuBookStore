package com.cfl.service.impl;

import com.cfl.dao.BookDao;
import com.cfl.dao.impl.BookDaoImpl;
import com.cfl.domain.Page;
import com.cfl.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PageServiceImpl_Book implements PageService {

    private BookDao bdao ;

    @Override
    public int getRowCount() {
        return (int) bdao.findTotalRecordCounts();
    }
    
    public int getRowCountByCategoryId(String var1) {
        return (int) bdao.findTotalRecordCounts(var1);
    }

    @Override
    public int getPageCount(int pageSize, int rowCount) {
        return (rowCount - 1) / pageSize + 1;
    }

    @Override
    public List getPageRecords(int pageNow, int pageSize) {
        return bdao.findPageBooks(pageNow, pageSize);
    }

    @Override
    public List getPageRecordsByCategoryId(int pageNow, int pageSize, String categoryId) {
        return bdao.findPageBooks(categoryId, pageNow, pageSize);
    }

    @Override
    public int getRowCountByStatusId(int i, String user_id) {
        return 0;
    }

    @Override
    public Page getPage(int currentPage, int pageSize, String url, String user_id, int statusId) {
        return null;
    }

    @Override
    public int getRowCount(String user_id) {
        return 0;
    }

    @Override
    public Page getPage(int pageNow, int pageSize, String url) {
        Page page = new Page();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);
        page.setRowCount(this.getRowCount());
        page.setPageCount(this.getPageCount(pageSize, this.getRowCount()));
        page.setRecords(this.getPageRecords(pageNow, pageSize));
        page.setUrl(url);
        return page;
    }

    @Override
    public Page getPage(int pageNow, int pageSize, String url, String categoryId) {
        Page page = new Page();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);
        System.out.println("setRowCount" + this.getRowCountByCategoryId(categoryId));
        page.setRowCount(this.getRowCountByCategoryId(categoryId));
        page.setPageCount(this.getPageCount(pageSize, this.getRowCountByCategoryId(categoryId)));
        page.setRecords(this.getPageRecordsByCategoryId(pageNow, pageSize, categoryId));
        page.setUrl(url);
        return page;
    }

    public BookDao getBdao() {
        return bdao;
    }

    @Autowired
    public void setBdao(BookDao bdao) {
        this.bdao = bdao;
    }
}
