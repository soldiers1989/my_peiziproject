package com.business.dto.model;

import javax.xml.bind.annotation.XmlRootElement;

import com.business.dto.model.RestfulResult;


/**
 * The persistent class for the accountinfo database table.
 * 
 */
@XmlRootElement
public class ManagerDTO {

    private Long id;
    private String account;
    private String password;

    private Integer status;
    private String createtime;
    private String operator;
    private String operatetime;
    private RestfulResult result;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public RestfulResult getResult() {
	return result;
    }

    public void setResult(RestfulResult result) {
	this.result = result;
    }

    public String getAccount() {
	return account;
    }

    public void setAccount(String account) {
	this.account = account;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public String getCreatetime() {
	return createtime;
    }

    public void setCreatetime(String createtime) {
	this.createtime = createtime;
    }

    public Integer getStatus() {
	return status;
    }

    public void setStatus(Integer status) {
	this.status = status;
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

}