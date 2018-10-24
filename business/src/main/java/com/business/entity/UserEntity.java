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

@SuppressWarnings("serial")
@Entity
@Table(name = "t_user")
public class UserEntity implements java.io.Serializable {

	private Long id;
	private String uid;//uuid
	private String phone;//手机号
	private String password;//密码
	private String account;//交易帐号
	private Long amount;//余额
	private String realName;//真实姓名
	private String centNo;//身份证号
	private Integer centStatus;//身份验证状态
	private String bankName;//开户行
	private String bankNo;//银行帐号
	private Integer bankStatus;//银行绑定状态
	private String remdPhone;//推荐人手机号

	private Date createtime;
	private Date operatetime;

	public UserEntity() {
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

	@Column(name = "uid", nullable = false, length = 40)
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Column(name = "phone", nullable = false, length = 20)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "password", nullable = false, length = 200)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createtime", nullable = false, length = 19)
	public Date getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "operatetime", nullable = false, length = 19)
	public Date getOperatetime() {
		return operatetime;
	}

	public void setOperatetime(Date operatetime) {
		this.operatetime = operatetime;
	}

	@Column(name = "amount", nullable = false)
	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	@Column(name = "real_name", length = 20)
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "cent_no", length = 40)
	public String getCentNo() {
		return centNo;
	}

	public void setCentNo(String centNo) {
		this.centNo = centNo;
	}

	@Column(name = "cent_status", nullable = false)
	public Integer getCentStatus() {
		return centStatus;
	}

	public void setCentStatus(Integer centStatus) {
		this.centStatus = centStatus;
	}

	@Column(name = "bank_name", length = 100)
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Column(name = "bank_no", length = 50)
	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	@Column(name = "bank_status", nullable = false)
	public Integer getBankStatus() {
		return bankStatus;
	}

	public void setBankStatus(Integer bankStatus) {
		this.bankStatus = bankStatus;
	}

	@Column(name = "remd_phone", length = 20)
	public String getRemdPhone() {
		return remdPhone;
	}

	public void setRemdPhone(String remdPhone) {
		this.remdPhone = remdPhone;
	}

	@Column(name = "account", length = 20)
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	

}
