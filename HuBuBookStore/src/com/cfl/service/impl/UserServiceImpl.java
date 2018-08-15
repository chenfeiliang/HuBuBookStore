package com.cfl.service.impl;

import java.util.List;

import com.cfl.dao.UserDao;
import com.cfl.dao.impl.UserDaoImpl;
import com.cfl.domain.User;
import com.cfl.service.OrderInfoService;
import com.cfl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private UserDao ud ;

    @Override
    public boolean addUser(User user) {
        return ud.addUser(user);
    }

    @Override
    public boolean delUserById(String id) {
        return ud.delUserById(id);
    }

    @Override
    public boolean updateUser(User user) {
        return ud.updateUser(user);

    }

    @Override
    public User findUserByName(String name) {
        return ud.findUserByName(name);
    }

    @Override
    public User findUserById(String id) {
        return ud.findUserById(id);
    }

    @Override
    public List<User> findAllUsers() {
        return null;
    }

    @Override
    public List<User> findPageUsers(int pageNow, int pageSize) {
        return ud.findPageUsers(pageNow, pageSize);
    }

    @Override
    public int findTotalRecordCounts() {
        return ud.findTotalRecordCounts();
    }


    public UserDao getUd() {
        return ud;
    }

    @Autowired
    public void setUd(UserDao ud) {
        this.ud = ud;
    }
}
