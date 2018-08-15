
package com.cfl.dao.impl;

import java.util.List;


import com.cfl.dao.OrderItemDao;
import com.cfl.domain.OrderItem;
import org.springframework.stereotype.Service;

@Service
public class OrderItemDaoImpl extends BaseDaoImpl implements OrderItemDao {


    @Override
    public int delOrderItemByOrderInfoId(String orderInfoId) {
        return 0;
    }

    @Override
    public boolean addOrderItem(OrderItem orderItem) {
        boolean x = save(orderItem);
        return x;
    }

    @Override
    public void delOrderItemById(Integer id)  {

    }

    @Override
    public boolean updateOrderItemByOrderInfoId(OrderItem orderItem) {
        OrderItem o = (OrderItem) findByHql("from OrderItem where orderInfo_id = ?",orderItem.getOrderInfo().getId()).uniqueResult();
        if(o!=null){
            o.setNum(orderItem.getNum());
            o.setCreateTime(orderItem.getCreateTime());
            return update(o);
        }
        return  false;
    }

    @Override
    public OrderItem findOrderItemByName(String name) {
        return null;
    }

    @Override
    public OrderItem findOrderItemById(Integer id) {
        return null;
    }

    @Override
    public List<OrderItem> findAllOrderItems() {
        return null;
    }

    @Override
    public List<OrderItem> findPageOrderItemByCategoryId(String category, int pageNow, int pageSize) {
        return null;
    }

    @Override
    public List<OrderItem> findPageOrderItems(int pageNow, int pageSize) {
        return null;
    }

    @Override
    public int findTotalRecordCounts() {
        return 0;
    }
}

