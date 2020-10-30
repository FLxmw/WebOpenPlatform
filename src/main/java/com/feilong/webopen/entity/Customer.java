package com.feilong.webopen.entity;

import java.io.Serializable;

/**
 * @author FeiLong
 * @version 1.8
 * @date 2020/10/5 22:47
 */
@SuppressWarnings("ALL")
public class Customer implements Serializable {
    private Integer id;
    private String username;
    private String password;
    private String nickname;
    private String address;
    private Integer money;
    private Integer state;

    public Customer() {
    }

    public Customer(Integer id, String username, String password, String nickname, String address, Integer money, Integer state) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.address = address;
        this.money = money;
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", address='" + address + '\'' +
                ", money=" + money +
                ", state=" + state +
                '}';
    }
}
