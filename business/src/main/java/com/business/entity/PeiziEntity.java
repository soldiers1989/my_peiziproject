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
@Table(name = "t_peizi")
public class PeiziEntity implements java.io.Serializable {

	private Long id;
	private Long userid;
	private Integer type;//0:免息,1:按天,2:按月
	private Long baozhengAmount;//保证金
	private Integer dayCount;//配资周期
	private Long rate;//配资利息
	private Long peiziAmount;//配资金额
	private Long caopanAmount;//操盘金额
	private Long warnLine;//预警线
	private Long pingcangLine;//平仓线
	private Integer tradeDay;//1:今日 ,2:下个交易日
	private Date createtime;

	public PeiziEntity() {
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

	@Column(name = "userid", nullable = false)
	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	@Column(name = "type", nullable = false)
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "baozheng_amount", nullable = false)
	public Long getBaozhengAmount() {
		return baozhengAmount;
	}

	public void setBaozhengAmount(Long baozhengAmount) {
		this.baozhengAmount = baozhengAmount;
	}

	@Column(name = "day_count", nullable = false)
	public Integer getDayCount() {
		return dayCount;
	}

	public void setDayCount(Integer dayCount) {
		this.dayCount = dayCount;
	}

	@Column(name = "rate", nullable = false)
	public Long getRate() {
		return rate;
	}

	public void setRate(Long rate) {
		this.rate = rate;
	}

	@Column(name = "peizi_amount", nullable = false)
	public Long getPeiziAmount() {
		return peiziAmount;
	}

	public void setPeiziAmount(Long peiziAmount) {
		this.peiziAmount = peiziAmount;
	}

	@Column(name = "caopan_amount", nullable = false)
	public Long getCaopanAmount() {
		return caopanAmount;
	}

	public void setCaopanAmount(Long caopanAmount) {
		this.caopanAmount = caopanAmount;
	}

	@Column(name = "warn_line", nullable = false)
	public Long getWarnLine() {
		return warnLine;
	}

	public void setWarnLine(Long warnLine) {
		this.warnLine = warnLine;
	}

	@Column(name = "pingcang_line", nullable = false)
	public Long getPingcangLine() {
		return pingcangLine;
	}

	public void setPingcangLine(Long pingcangLine) {
		this.pingcangLine = pingcangLine;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createtime", nullable = false, length = 19)
	public Date getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Column(name = "trade_day", nullable = false)
	public Integer getTradeDay() {
		return tradeDay;
	}

	public void setTradeDay(Integer tradeDay) {
		this.tradeDay = tradeDay;
	}


	

}
