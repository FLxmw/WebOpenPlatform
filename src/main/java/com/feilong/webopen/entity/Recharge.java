package com.feilong.webopen.entity;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("ALL")
public class Recharge implements Serializable {

  private Integer id;
  private Integer cusId;
  private String orderId;
  private Date createtime;
  private Date updatetime;
  private Integer money;
  private Integer state;
  private Integer paymenttype;

  public Recharge() {
  }

  public Recharge(Integer id, Integer cusId, String orderId, Date createtime, Date updatetime, Integer money, Integer state, Integer paymenttype) {
    this.id = id;
    this.cusId = cusId;
    this.orderId = orderId;
    this.createtime = createtime;
    this.updatetime = updatetime;
    this.money = money;
    this.state = state;
    this.paymenttype = paymenttype;
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

  public Date getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Date createtime) {
    this.createtime = createtime;
  }

  public Date getUpdatetime() {
    return updatetime;
  }

  public void setUpdatetime(Date updatetime) {
    this.updatetime = updatetime;
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

  public Integer getPaymenttype() {
    return paymenttype;
  }

  public void setPaymenttype(Integer paymenttype) {
    this.paymenttype = paymenttype;
  }

  @Override
  public String toString() {
    return "Recharge{" +
            "id=" + id +
            ", cusId=" + cusId +
            ", orderId='" + orderId + '\'' +
            ", createtime=" + createtime +
            ", updatetime=" + updatetime +
            ", money=" + money +
            ", state=" + state +
            ", paymenttype=" + paymenttype +
            '}';
  }
}
