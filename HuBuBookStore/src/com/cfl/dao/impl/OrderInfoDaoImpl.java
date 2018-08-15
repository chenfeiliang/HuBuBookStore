
package com.cfl.dao.impl;

import java.util.List;



import com.cfl.dao.OrderInfoDao;
import com.cfl.domain.OrderInfo;
import org.springframework.stereotype.Service;

@Service
public class OrderInfoDaoImpl extends BaseDaoImpl implements OrderInfoDao {


    @Override
    public boolean addOrderInfo(OrderInfo orderInfo) {
       boolean flag = save(orderInfo);
       return  flag;
    }

    @Override
    public boolean delOrderInfoById(String id) {
        OrderInfo orderInfo = getHibernateTemplate().load(OrderInfo.class,id);

        if(orderInfo!=null){
            return delete(orderInfo);
        }
        return  false;
    }

    @Override
    public boolean updateOrderInoNumById(OrderInfo order) {
        OrderInfo orderInfo = getHibernateTemplate().load(OrderInfo.class,order.getId());
        orderInfo.setNum(order.getNum());
        boolean x = update(orderInfo);
        return x;
    }

    @Override
    public boolean delOrderInfoByUserId(String user_id) {
        List<OrderInfo> orderInfos =  findByHql("from OrderInfo where user_id = ?",user_id).list();
        if(orderInfos!=null){
            for (int i = 0;i<orderInfos.size();i++)
            {
                delete(orderInfos.get(i));
            }
            return true;
        }
        return  false;
    }

    @Override
    public void updateOrderInfo(OrderInfo orderInfo) {

    }

    @Override
    public OrderInfo findOrderInfoByName(String name) {
        return null;
    }

    @Override
    public OrderInfo findOrderInfoById(Integer id) {
        return null;
    }

    @Override
    public List<OrderInfo> findAllOrderInfos() {
        return null;
    }

    @Override
    public List<OrderInfo> findPageOrderInfosByStatus(int pageNow, int pageSize, int status, String user_id) {
        List<OrderInfo> list= findByHql("from OrderInfo as o where o.status =? and o.user.id = ? ",status,user_id).setFirstResult((pageNow - 1) * pageSize).setMaxResults(pageSize).list();

        return list;

    }

    @Override
    public List<OrderInfo> findPageOrderInfos(int pageNow, int pageSize, String user_id) {

        List<OrderInfo> list= findByHql("from OrderInfo as o where o.user.id = ? and o.status!=0 ",user_id).setFirstResult((pageNow - 1) * pageSize).setMaxResults(pageSize).list();

        return list;

    }

    @Override
    public int findTotalRecordCounts(String user_id) {
        return 0;
    }

    @Override
    public int findTotalRecordCountsByStatus(int status, String user_id) {
        long count = (Long) findByHql("select count(o) from OrderInfo as o where o.status = ? and o.user.id = ? ",status,user_id).uniqueResult();
        return (int)count;
    }

    @Override
    public List findIdByUserId(String user_id) {
        return null;
    }

    @Override
    public boolean updateOrderInfoStatusById(OrderInfo order) {
        OrderInfo orderInfo = getHibernateTemplate().load(OrderInfo.class,order.getId());
        orderInfo.setStatus(order.getStatus());
        boolean x = update(orderInfo);
        return x;
    }

    @Override
    public List<OrderInfo> findAllPageOrderInfos(int pageNow, int pageSize) {
        return null;
    }

    @Override
    public int findTotalRecordCounts() {
        long count = (Long) findByHql("select count(o) from OrderInfo as o").uniqueResult();
        return (int)count;
    }
}

