package com.cfl.service;

import java.util.List;

import com.cfl.domain.OrderItem;

public interface OrderItemService {

    public boolean addOrderItem(OrderItem orderItem);

    public void delOrderItemById(Integer id) ;

    public void updateOrderItem(OrderItem orderItem);

    public OrderItem findOrderItemByName(String name);

    public OrderItem findOrderItemById(Integer id);

    public List<OrderItem> findAllOrderItems();

    public List<OrderItem> findPageOrderItemByCategoryId(String category, int pageNow, int pageSize);

    public List<OrderItem> findPageOrderItems(int pageNow, int pageSize);

    public int findTotalRecordCounts();

    public boolean updateOrderItemByOrderInfoId(OrderItem orderItem);

}
