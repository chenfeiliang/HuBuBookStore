package com.cfl.dao;

import java.util.List;

import com.cfl.domain.User;

public interface UserDao {

    public boolean addUser(User user);

    public boolean delUserById(String userId);

    public boolean updateUser(User user);

    public User findUserByName(String name);

    public User findUserById(String id);

    public List<User> findAllUsers();

    public List<User> findPageUsers(int pageNow, int pageSize);

    public int findTotalRecordCounts();

}
