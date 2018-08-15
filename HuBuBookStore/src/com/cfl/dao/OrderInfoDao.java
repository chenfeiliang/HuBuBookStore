package com.cfl.dao;

import java.util.List;

import com.cfl.domain.OrderInfo;

public interface OrderInfoDao {


    public boolean addOrderInfo(OrderInfo orderInfo);


    public boolean delOrderInfoById(String id);


    public boolean updateOrderInoNumById(OrderInfo order);

    public boolean delOrderInfoByUserId(String user_id);

    public void updateOrderInfo(OrderInfo orderInfo);

    public OrderInfo findOrderInfoByName(String name);

    public OrderInfo findOrderInfoById(Integer id);

    public List<OrderInfo> findAllOrderInfos();

    public List<OrderInfo> findPageOrderInfosByStatus(int pageNow, int pageSize, int status, String user_id);

    public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize, String user_id);

    public int findTotalRecordCounts(String user_id);

    public int findTotalRecordCountsByStatus(int status, String user_id);

    public List findIdByUserId(String user_id);

    public boolean updateOrderInfoStatusById(OrderInfo order);

    public List<OrderInfo> findAllPageOrderInfos(int pageNow, int pageSize);

    public int findTotalRecordCounts();

}
