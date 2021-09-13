package com.kinghand.service.impl;

import com.kinghand.domain.History;
import com.kinghand.domain.User;
import com.kinghand.mapper.HistoryMapper;
import com.kinghand.mapper.UserMapper;
import com.kinghand.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private HistoryMapper historyMapper;
    @Autowired
    private History history;

    public List<User> findAll() {
        return userMapper.findAll();
    }

    public User findById(int id) {
        return userMapper.findById(id);
    }

    public void updateNumberOfPasswordError(User user) {
        userMapper.updateNumberOfPasswordError(user);
    }

    @Override
    public User cash(double money, User user) {
        List<History> historyList = user.getHistoryList();
        double balance = user.getMoney();
        if (balance >= money) {
            user.setMoney(balance - money);
            userMapper.subMoney(user);
            history.setUid(user.getId());
            history.setType("取款");
            history.setMoney(money);
            history.setTime(new Date());
            historyList.add(history);
            user.setHistoryList(historyList);
            historyMapper.addHistory(history);
        } else {
            user = null;
        }
        return user;
    }

    @Override
    public User deposit(double money, User user) {
        List<History> historyList = user.getHistoryList();
        double balance = user.getMoney();
        user.setMoney(balance + money);
        userMapper.addMoney(user);
        history.setUid(user.getId());
        history.setType("存款");
        history.setMoney(money);
        history.setTime(new Date());
        historyList.add(history);
        user.setHistoryList(historyList);
        historyMapper.addHistory(history);
        return user;
    }

    @Override
    public User transfer(double money, User user, User user1) {
        List<History> historyList = user.getHistoryList();
        double balance = user.getMoney(), balance1 = user1.getMoney();
        Date date = new Date();
        user.setMoney(balance - money);
        user1.setMoney(balance1 + money);
        userMapper.subMoney(user);
        history.setUid(user.getId());
        history.setType("转账给" + user1.getId());
        history.setMoney(money);
        history.setTime(date);
        historyList.add(history);
        user.setHistoryList(historyList);
        historyMapper.addHistory(history);
        userMapper.addMoney(user1);
        historyList = user1.getHistoryList();
        history.setUid(user1.getId());
        history.setType("收款来自" + user.getId());
        history.setMoney(money);
        history.setTime(date);
        historyList.add(history);
        user1.setHistoryList(historyList);
        historyMapper.addHistory(history);
        return user;
    }


}
