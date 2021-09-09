package com.kinghand.domain;

import java.util.Date;

public class History {
    private int uid;
    private Date time;
    private String type;
    private double money;


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "History{" +
                "uid=" + uid +
                ", time=" + time +
                ", type='" + type + '\'' +
                ", money=" + money +
                '}';
    }
}
