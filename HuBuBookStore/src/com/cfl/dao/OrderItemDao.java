package com.cfl.dao;

import java.util.List;

import com.cfl.domain.OrderItem;

public interface OrderItemDao {


    public int delOrderItemByOrderInfoId(String orderInfoId);

    public boolean addOrderItem(OrderItem orderItem);

    public void delOrderItemById(Integer id) ;

    public boolean updateOrderItemByOrderInfoId(OrderItem orderItem);

    public OrderItem findOrderItemByName(String name);

    public OrderItem findOrderItemById(Integer id);

    public List<OrderItem> findAllOrderItems();

    public List<OrderItem> findPageOrderItemByCategoryId(String category, int pageNow, int pageSize);

    public List<OrderItem> findPageOrderItems(int pageNow, int pageSize);

    public int findTotalRecordCounts();

}
