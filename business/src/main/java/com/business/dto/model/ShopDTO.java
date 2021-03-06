package com.business.dto.model;

// Generated 2015-9-28 14:16:01 by Hibernate Tools 3.4.0.CR1

import javax.xml.bind.annotation.XmlRootElement;

import com.business.dto.model.RestfulResult;


/**
 * TShop generated by hbm2java
 */
@SuppressWarnings("serial")
@XmlRootElement
public class ShopDTO implements java.io.Serializable {

    private Long id;
    private String name;
    private String icon;
    private String iconurl;
    private String type;
    private Integer prior;
    private String shopDesci;
    private Integer status;
    private String createtime;
    private String operator;
    private String operatetime;
    private RestfulResult restfulResult;

    public ShopDTO() {
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getIcon() {
	return icon;
    }

    public void setIcon(String icon) {
	this.icon = icon;
    }

    public String getType() {
	return type;
    }

    public void setType(String type) {
	this.type = type;
    }

    public Integer getPrior() {
	return prior;
    }

    public void setPrior(Integer prior) {
	this.prior = prior;
    }

    public String getShopDesci() {
	return shopDesci;
    }

    public void setShopDesci(String shopDesci) {
	this.shopDesci = shopDesci;
    }

    public Integer getStatus() {
	return status;
    }

    public void setStatus(Integer status) {
	this.status = status;
    }

    public String getCreatetime() {
	return createtime;
    }

    public void setCreatetime(String createtime) {
	this.createtime = createtime;
    }

    public String getOperator() {
	return operator;
    }

    public void setOperator(String operator) {
	this.operator = operator;
    }

    public String getOperatetime() {
	return operatetime;
    }

    public void setOperatetime(String operatetime) {
	this.operatetime = operatetime;
    }

    public RestfulResult getRestfulResult() {
	return restfulResult;
    }

    public void setRestfulResult(RestfulResult restfulResult) {
	this.restfulResult = restfulResult;
    }

    public String getIconurl() {
	return iconurl;
    }

    public void setIconurl(String iconurl) {
	this.iconurl = iconurl;
    }

}
