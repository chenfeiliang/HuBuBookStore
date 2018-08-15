package com.cfl.service;

import java.util.List;

import com.cfl.domain.OrderInfo;

public interface OrderInfoService {


    public boolean addOrderInfo(OrderInfo orderInfo);

    public boolean delOrderInfoById(String id);
    
    public boolean delOrderInfoByUserId(String userId);

    public boolean updateOrderInoNumById(OrderInfo order);

    public void updateOrderInfo(OrderInfo orderInfo);

    public boolean updateOrderInfoStatusById(OrderInfo order);

    public OrderInfo findOrderInfoByName(String name);

    public OrderInfo findOrderInfoById(Integer id);

    public List<OrderInfo> findAllOrderInfos();

    public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize);

    public List<OrderInfo> findPageOrderInfos(String category, int pageNow, int pageSize);

    public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize, String user_id);

    public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize, int status, String user_id);

    public int findTotalRecordCounts();

    public int findTotalRecordCounts(String user_id);

    public int findTotalRecordCounts(int status, String user_id);


}
