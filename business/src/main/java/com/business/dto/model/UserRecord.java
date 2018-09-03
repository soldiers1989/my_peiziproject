package com.business.dto.model;

// Generated 2015-9-28 14:16:01 by Hibernate Tools 3.4.0.CR1

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class UserRecord implements java.io.Serializable {

    private Long id;
    private String realname;
    private String phone;
    private String accountbank;
    private String createtime;

    public UserRecord() {
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getRealname() {
	return realname;
    }

    public void setRealname(String realname) {
	this.realname = realname;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public String getAccountbank() {
	return accountbank;
    }

    public void setAccountbank(String accountbank) {
	this.accountbank = accountbank;
    }

    public String getCreatetime() {
	return createtime;
    }

    public void setCreatetime(String createtime) {
	this.createtime = createtime;
    }

}
