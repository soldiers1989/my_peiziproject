package com.business.entity;

// Generated 2015-9-28 14:16:01 by Hibernate Tools 3.4.0.CR1

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * TShop generated by hbm2java
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "t_shop", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class ShopEntity implements java.io.Serializable {

    private Long id;
    private String name;
    private String icon;
    private String type;
    private Integer prior;
    private String shopDesci;
    private Integer status;
    private Date createtime;
    private String operator;
    private Date operatetime;

    public ShopEntity() {
    }

    public ShopEntity(String name, String shopType, Integer status, Date createtime) {
	this.name = name;
	this.status = status;
	this.createtime = createtime;
    }

    public ShopEntity(String name, String shopDesci, String shopType, Integer status, Date createtime, String operator, Date operatetime) {
	this.name = name;
	this.shopDesci = shopDesci;
	this.status = status;
	this.createtime = createtime;
	this.operator = operator;
	this.operatetime = operatetime;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
	return this.id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    @Column(name = "name", nullable = false, length = 60)
    public String getName() {
	return this.name;
    }

    public void setName(String name) {
	this.name = name;
    }

    @Column(name = "shop_desci", length = 500)
    public String getShopDesci() {
	return this.shopDesci;
    }

    public void setShopDesci(String shopDesci) {
	this.shopDesci = shopDesci;
    }

    @Column(name = "status", nullable = false)
    public Integer getStatus() {
	return this.status;
    }

    public void setStatus(Integer status) {
	this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createtime", nullable = false, length = 19)
    public Date getCreatetime() {
	return this.createtime;
    }

    public void setCreatetime(Date createtime) {
	this.createtime = createtime;
    }

    @Column(name = "operator", length = 45)
    public String getOperator() {
	return this.operator;
    }

    public void setOperator(String operator) {
	this.operator = operator;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "operatetime", length = 19)
    public Date getOperatetime() {
	return this.operatetime;
    }

    public void setOperatetime(Date operatetime) {
	this.operatetime = operatetime;
    }

    @Column(name = "prior", length = 11, nullable = false)
    public Integer getPrior() {
	return prior;
    }

    public void setPrior(Integer prior) {
	this.prior = prior;
    }

    public String getIcon() {
	return icon;
    }

    @Column(name = "icon", length = 100, nullable = false)
    public void setIcon(String icon) {
	this.icon = icon;
    }

    @Column(name = "type", length = 10, nullable = false)
    public String getType() {
	return type;
    }

    public void setType(String type) {
	this.type = type;
    }

}
