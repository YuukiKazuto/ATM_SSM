package com.kinghand.domain;

import java.util.List;

public class User {
    private int id;
    private String password;
    private String name;
    private String idCardNO;
    private String phoneNumber;
    private double money;
    private int numberOfPasswordError;
    private String state;
    private List<History> historyList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdCardNO() {
        return idCardNO;
    }

    public void setIdCardNO(String idCardNO) {
        this.idCardNO = idCardNO;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public int getNumberOfPasswordError() {
        return numberOfPasswordError;
    }

    public void setNumberOfPasswordError(int numberOfPasswordError) {
        this.numberOfPasswordError = numberOfPasswordError;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<History> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<History> historyList) {
        this.historyList = historyList;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", idCardNO='" + idCardNO + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", money=" + money +
                ", number0fPasswordError=" + numberOfPasswordError +
                ", state='" + state + '\'' +
                ", historyList=" + historyList +
                '}';
    }
}
