package com.business.dto.model;

// Generated 2015-9-28 14:16:01 by Hibernate Tools 3.4.0.CR1

@SuppressWarnings("serial")
public class InRecordDTO implements java.io.Serializable {

	private Long id;
	private Long userid;
	private String phone;
	private double amount;
	private Integer way;
	private String wayStr;
	private Integer status;
	private String statusStr;
	private String createtime;

	public InRecordDTO() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getWay() {
		return way;
	}

	public void setWay(Integer way) {
		this.way = way;
	}

	public String getWayStr() {
		return wayStr;
	}

	public void setWayStr(String wayStr) {
		this.wayStr = wayStr;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getStatusStr() {
		return statusStr;
	}

	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}

}
