package com.feilong.webopen.entity;


import java.io.Serializable;

@SuppressWarnings("ALL")
public class ApiMapping implements Serializable {

  private Integer id;
  private String gatewayApiName;
  private String insideApiUrl;
  private Integer state;
  private String description;
  private String serviceId;
  private String idempotents;
  private String needfee;


  public ApiMapping() {
  }

  public ApiMapping(Integer id, String gatewayApiName, String insideApiUrl, Integer state, String description, String serviceId, String idempotents, String needfee) {
    this.id = id;
    this.gatewayApiName = gatewayApiName;
    this.insideApiUrl = insideApiUrl;
    this.state = state;
    this.description = description;
    this.serviceId = serviceId;
    this.idempotents = idempotents;
    this.needfee = needfee;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getGatewayApiName() {
    return gatewayApiName;
  }

  public void setGatewayApiName(String gatewayApiName) {
    this.gatewayApiName = gatewayApiName;
  }

  public String getInsideApiUrl() {
    return insideApiUrl;
  }

  public void setInsideApiUrl(String insideApiUrl) {
    this.insideApiUrl = insideApiUrl;
  }

  public Integer getState() {
    return state;
  }

  public void setState(Integer state) {
    this.state = state;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getServiceId() {
    return serviceId;
  }

  public void setServiceId(String serviceId) {
    this.serviceId = serviceId;
  }

  public String getIdempotents() {
    return idempotents;
  }

  public void setIdempotents(String idempotents) {
    this.idempotents = idempotents;
  }

  public String getNeedfee() {
    return needfee;
  }

  public void setNeedfee(String needfee) {
    this.needfee = needfee;
  }

  @Override
  public String toString() {
    return "ApiMapping{" +
            "id=" + id +
            ", gatewayApiName='" + gatewayApiName + '\'' +
            ", insideApiUrl='" + insideApiUrl + '\'' +
            ", state=" + state +
            ", description='" + description + '\'' +
            ", serviceId='" + serviceId + '\'' +
            ", idempotents='" + idempotents + '\'' +
            ", needfee='" + needfee + '\'' +
            '}';
  }
}
