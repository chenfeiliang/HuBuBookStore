package com.cfl.service.impl;

import java.util.List;

import com.cfl.dao.OrderInfoDao;
import com.cfl.domain.OrderInfo;
import com.cfl.service.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {

    private OrderInfoDao oi ;

    @Override
    public boolean addOrderInfo(OrderInfo orderInfo) {
        // TODO Auto-generated method stub
        return oi.addOrderInfo(orderInfo);
    }

    @Override
    public boolean delOrderInfoById(String id) {
        return oi.delOrderInfoById(id);

    }
    
    public boolean delOrderInfoByUserId(String userId){
        return oi.delOrderInfoByUserId(userId);   
    }

    @Override
    public void updateOrderInfo(OrderInfo orderInfo) {
        // TODO Auto-generated method stub

    }

    @Override
    public List<OrderInfo> findAllOrderInfos() {
        // TODO Auto-generated method stub
        return null;
    }

/*    public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize) {
        return oi.
    }*/

    @Override
    public List<OrderInfo> findPageOrderInfos(String category, int pageNow, int pageSize) {
        // TODO Auto-generated method stub
        return null;
    }

   @Override
   public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize, String user_id) {
        return oi.findPageOrderInfos(pageNow, pageSize, user_id);
    }

    @Override
    public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize, int status, String user_id) {
        return oi.findPageOrderInfosByStatus(pageNow, pageSize, status, user_id);
    }

    @Override
    public int findTotalRecordCounts(String user_id) {
        return oi.findTotalRecordCounts(user_id);
    }

    @Override
    public int findTotalRecordCounts() {
        return oi.findTotalRecordCounts();
    }

    public int findTotalRecordCounts(int status, String user_id) {
        return oi.findTotalRecordCountsByStatus(status, user_id);
    }

    public boolean updateOrderInoNumById(OrderInfo order) {
        return oi.updateOrderInoNumById(order);
    }

    public boolean updateOrderInfoStatusById(OrderInfo order) {
        return oi.updateOrderInfoStatusById(order);
    }

    @Override
    public OrderInfo findOrderInfoByName(String name) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public OrderInfo findOrderInfoById(Integer id) {
        // TODO Auto-generated method stub
        return null;
    }

	@Override
	public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

    public OrderInfoDao getOi() {
        return oi;
    }

    @Autowired
    public void setOi(OrderInfoDao oi) {
        this.oi = oi;
    }
}
