package com.cfl.service;

import com.cfl.domain.Page;

import java.util.List;

public interface PageService {
    int getRowCount();

    int getPageCount(int var1, int var2);

    List getPageRecords(int var1, int var2);

    Page getPage(int var1, int var2, String var3);

    Page getPage(int pageNow, int pageSize, String url, String categoryId);

    int getRowCountByCategoryId(String var1);

    List getPageRecordsByCategoryId(int pageNow, int pageSize, String categoryId);

    int getRowCountByStatusId(int i, String user_id);

    Page getPage(int currentPage, int pageSize, String url, String user_id, int statusId);

    int getRowCount(String user_id);
}
