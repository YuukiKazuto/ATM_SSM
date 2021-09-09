package com.kinghand.service;

import com.kinghand.domain.History;
import com.kinghand.domain.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();
    public User findById(int id);
    public void updateNumberOfPasswordError(User user);
    public User cash(double money,User user);
    public User deposit(double money,User user);
    public User transfer(double money, User user, User user1);
}
