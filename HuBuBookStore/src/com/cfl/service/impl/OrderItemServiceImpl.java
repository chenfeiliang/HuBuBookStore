package com.cfl.service.impl;

import java.util.List;

import com.cfl.dao.OrderItemDao;
import com.cfl.domain.OrderItem;
import com.cfl.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderItemServiceImpl implements OrderItemService {

    OrderItemDao oi ;

    @Override
    public boolean addOrderItem(OrderItem orderItem) {
        // TODO Auto-generated method stub
        return oi.addOrderItem(orderItem);
    }

    @Override
    public void delOrderItemById(Integer id)  {
        // TODO Auto-generated method stub

    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {
        // TODO Auto-generated method stub

    }

    @Override
    public OrderItem findOrderItemByName(String name) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public OrderItem findOrderItemById(Integer id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<OrderItem> findAllOrderItems() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<OrderItem> findPageOrderItemByCategoryId(String category, int pageNow, int pageSize) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<OrderItem> findPageOrderItems(int pageNow, int pageSize) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int findTotalRecordCounts() {
        // TODO Auto-generated method stub
        return oi.findTotalRecordCounts();
    }

    @Override
    public boolean updateOrderItemByOrderInfoId(OrderItem orderItem) {
        // TODO Auto-generated method stub
        return oi.updateOrderItemByOrderInfoId(orderItem);
    }

    public OrderItemDao getOi() {
        return oi;
    }

    @Autowired
    public void setOi(OrderItemDao oi) {
        this.oi = oi;
    }
}
