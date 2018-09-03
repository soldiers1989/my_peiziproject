package com.business.dto.model;

import javax.xml.bind.annotation.XmlRootElement;

import com.business.dto.model.RestfulResult;



@XmlRootElement
public class ManagerAuth {
	private Long managerid;
	private String account;
	private String password;
	private String authnames;
	private String logintime;
	private String selectKeys;
	private String dynatrees;
	private String userId;
	private String createtime;
	private String operator;
	private String operatetime;
	private RestfulResult result;
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

	public RestfulResult getResult() {
		return result;
	}

	public void setResult(RestfulResult result) {
		this.result = result;
	}

	public String getAuthnames() {
		return authnames;
	}

	public void setAuthnames(String authnames) {
		this.authnames = authnames;
	}

	public String getLogintime() {
		return logintime;
	}

	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getSelectKeys() {
		return selectKeys;
	}

	public void setSelectKeys(String selectKeys) {
		this.selectKeys = selectKeys;
	}

	public String getDynatrees() {
		return dynatrees;
	}

	public void setDynatrees(String dynatrees) {
		this.dynatrees = dynatrees;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Long getManagerid() {
		return managerid;
	}

	public void setManagerid(Long managerid) {
		this.managerid = managerid;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getOperatetime() {
		return operatetime;
	}

	public void setOperatetime(String operatetime) {
		this.operatetime = operatetime;
	}

}
