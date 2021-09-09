package com.kinghand.mapper;

import com.kinghand.domain.User;

import java.util.List;

public interface UserMapper {
    public List<User> findAll();
    public User findById(int id);
    public void addUser(User user);
    public void updatePassword(String password, int id);
    public void updateNumberOfPasswordError(User user);
    public void addMoney(User user);
    public void subMoney(User user);
}
