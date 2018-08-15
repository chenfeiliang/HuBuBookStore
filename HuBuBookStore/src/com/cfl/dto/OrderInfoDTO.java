package com.cfl.dto;

import com.cfl.domain.OrderInfo;

public class OrderInfoDTO extends OrderInfo {

    private String bookName;

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }


}
