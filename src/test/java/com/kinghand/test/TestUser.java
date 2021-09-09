package com.kinghand.test;

import com.kinghand.domain.History;
import com.kinghand.domain.User;
import com.kinghand.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestUser {
    @Autowired
    private UserService userService;
    @Test
    public void test(){
//        History history = new History();
//        history.setUid(620000);
//        history.setTime(new Date());
//        history.setType("取款");
//        history.setMoney(10000);
//        userService.addHistory(history);
        User user=userService.findById(620000);
        User user1=userService.findById(620001);
        userService.transfer(100,user,user1);
    }
}
