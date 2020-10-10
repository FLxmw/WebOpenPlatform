package com.feilong.webopen.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("ALL")
public class Recharge implements Serializable {

    private Integer id;
    private Integer cusId;
    private String orderId;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
    private Integer money;
    private Integer state;
    private Integer paymentType;

    public Recharge() {
    }

    public Recharge(Integer id, Integer cusId, String orderId, Date createTime, Date updateTime, Integer money, Integer state, Integer paymentType) {
        this.id = id;
        this.cusId = cusId;
        this.orderId = orderId;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.money = money;
        this.state = state;
        this.paymentType = paymentType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCusId() {
        return cusId;
    }

    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public String toString() {
        return "Recharge{" +
                "id=" + id +
                ", cusId=" + cusId +
                ", orderId='" + orderId + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", money=" + money +
                ", state=" + state +
                ", paymentType=" + paymentType +
                '}';
    }
}
