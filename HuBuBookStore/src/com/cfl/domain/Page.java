package com.cfl.domain;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable {
    private int pageNow;
    private int pageCount;
    private int pageSize;
    private int rowCount;
    private List records;
    private String url;

    public Page() {
    }

    public int getPageNow() {
        return this.pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageCount() {
        return this.pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getRowCount() {
        return this.rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public List getRecords() {
        return this.records;
    }

    public void setRecords(List records) {
        this.records = records;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
