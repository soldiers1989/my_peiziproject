package com.business.dto.model;

// Generated 2015-9-28 14:16:01 by Hibernate Tools 3.4.0.CR1

import javax.xml.bind.annotation.XmlRootElement;

@SuppressWarnings("serial")
@XmlRootElement
public class UserDTO implements java.io.Serializable {

	private Long id;
	private String uid;// uuid
	private String phone;// 手机号
	private String password;// 密码
	private double amount;// 余额
	private String realName;// 真实姓名
	private String centNo;// 身份证号
	private Integer centStatus;// 身份验证状态
	private String bankName;// 开户行
	private String bankNo;// 银行帐号
	private Integer bankStatus;// 银行绑定状态
	private String remdPhone;// 推荐人手机号
	private String createtime;
	private String operatetime;
	private RestfulResult restfulResult;
	public UserDTO() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getCentNo() {
		return centNo;
	}

	public void setCentNo(String centNo) {
		this.centNo = centNo;
	}

	public Integer getCentStatus() {
		return centStatus;
	}

	public void setCentStatus(Integer centStatus) {
		this.centStatus = centStatus;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public Integer getBankStatus() {
		return bankStatus;
	}

	public void setBankStatus(Integer bankStatus) {
		this.bankStatus = bankStatus;
	}

	public String getRemdPhone() {
		return remdPhone;
	}

	public void setRemdPhone(String remdPhone) {
		this.remdPhone = remdPhone;
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

	public RestfulResult getRestfulResult() {
		return restfulResult;
	}

	public void setRestfulResult(RestfulResult restfulResult) {
		this.restfulResult = restfulResult;
	}

}
