package com.cfl.service.impl;

import com.cfl.dao.BookDao;
import com.cfl.dao.CategoryDao;
import com.cfl.dao.impl.BookDaoImpl;
import com.cfl.dao.impl.CategoryDaoImpl;
import com.cfl.domain.Page;
import com.cfl.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PageServiceImpl_Category implements PageService {

    CategoryDao cdao ;

    @Override
    public int getRowCount() {
        return (int) cdao.findTotalRecordCounts();
    }

    @Override
    public int getPageCount(int pageSize, int rowCount) {
        return (rowCount - 1) / pageSize + 1;
    }

    @Override
    public List getPageRecords(int pageNow, int pageSize) {
        return cdao.findPageCategorys(pageNow, pageSize);
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
        return null;
    }

    @Override
    public int getRowCountByCategoryId(String var1) {
        return 0;
    }

    @Override
    public List getPageRecordsByCategoryId(int pageNow, int pageSize, String categoryId) {
        return null;
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

    public CategoryDao getCdao() {
        return cdao;
    }

    @Autowired
    public void setCdao(CategoryDao cdao) {
        this.cdao = cdao;
    }
}
