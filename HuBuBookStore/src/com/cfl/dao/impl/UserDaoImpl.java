
package com.cfl.dao.impl;

import java.util.List;


import com.cfl.dao.UserDao;
import com.cfl.domain.User;
import org.springframework.stereotype.Service;

@Service
public class UserDaoImpl extends BaseDaoImpl implements UserDao {

    @Override
    public boolean addUser(User user) {
        boolean flag = save(user);
        return flag;

    }

    @Override
    public boolean delUserById(String userId) {
        User user = getHibernateTemplate().load(User.class,userId);

        if(user!=null){
            return  delete(user);
        }

        return false;
    }

    @Override
    public boolean updateUser(User user) {
        User u = getHibernateTemplate().load(User.class,user.getId());

        if(u!=null){
            if(user.getUserName()!=null) u.setUserName(user.getUserName());
            if(user.getPassWord()!=null) u.setPassWord(user.getPassWord());
            if(user.getAddress()!=null)  u.setAddress(user.getAddress());
            if(user.getCellPhone()!=null) u.setCellPhone(user.getCellPhone());
            if(user.getMobilePhone()!=null) u.setMobilePhone(user.getMobilePhone());
            if(user.getEmail()!=null) u.setEmail(user.getEmail());
            return  update(u);
        }

        return false;
    }

    @Override
    public User findUserByName(String name) {
        User user = (User) findByHql("from User as u where u.userName = ?",name).uniqueResult();

        if(user!=null) {
            return user;
        }

        return null;
    }

    @Override
    public User findUserById(String id) {
        User user = (User) findByHql("from User as u where u.id = ?",id).uniqueResult();
        if(user!=null){
            return user;
        }
        return null;
    }

    @Override
    public List<User> findAllUsers() {
        List list = findByHql("from User").list();

        return list;

    }

    @Override
    public List<User> findPageUsers(int pageNow, int pageSize) {
        List<User> list = findByHql("from User").setFirstResult((pageNow - 1) * pageSize).setMaxResults(pageSize).list();

        return list;
    }

    @Override
    public int findTotalRecordCounts() {
        long count = (Long) findByHql("select count(u) from User as u").uniqueResult();
        return (int)count;
    }
}

