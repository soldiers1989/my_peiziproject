package com.business.dto.model;

// Generated 2015-9-28 14:16:01 by Hibernate Tools 3.4.0.CR1

@SuppressWarnings("serial")
public class PeiziDTO implements java.io.Serializable {

	private Long id;
	private Long userid;
	private String phone;// 手机号
	private Integer type;// 0:免息,1:按天,2:按月
	private String typeName;
	private double baozhengAmount;// 保证金
	private Integer dayCount;// 配资周期
	private double rate;// 配资利息
	private double peiziAmount;// 配资金额
	private double caopanAmount;// 操盘金额
	private double warnLine;// 预警线
	private double pingcangLine;// 平仓线
	private Integer tradeDay;// 今日 or下个交易日
	private Integer tradeCount;// 操盘天数
	private String tradeDayName;
	private Integer status;
	private String statusStr;
	private String createtime;
	private RestfulResult restfulResult;

	public PeiziDTO() {
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getDayCount() {
		return dayCount;
	}

	public void setDayCount(Integer dayCount) {
		this.dayCount = dayCount;
	}

	public Integer getTradeDay() {
		return tradeDay;
	}

	public void setTradeDay(Integer tradeDay) {
		this.tradeDay = tradeDay;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public RestfulResult getRestfulResult() {
		return restfulResult;
	}

	public void setRestfulResult(RestfulResult restfulResult) {
		this.restfulResult = restfulResult;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTradeDayName() {
		return tradeDayName;
	}

	public void setTradeDayName(String tradeDayName) {
		this.tradeDayName = tradeDayName;
	}

	public double getBaozhengAmount() {
		return baozhengAmount;
	}

	public void setBaozhengAmount(double baozhengAmount) {
		this.baozhengAmount = baozhengAmount;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public double getPeiziAmount() {
		return peiziAmount;
	}

	public void setPeiziAmount(double peiziAmount) {
		this.peiziAmount = peiziAmount;
	}

	public double getCaopanAmount() {
		return caopanAmount;
	}

	public void setCaopanAmount(double caopanAmount) {
		this.caopanAmount = caopanAmount;
	}

	public double getWarnLine() {
		return warnLine;
	}

	public void setWarnLine(double warnLine) {
		this.warnLine = warnLine;
	}

	public double getPingcangLine() {
		return pingcangLine;
	}

	public void setPingcangLine(double pingcangLine) {
		this.pingcangLine = pingcangLine;
	}

	public Integer getTradeCount() {
		return tradeCount;
	}

	public void setTradeCount(Integer tradeCount) {
		this.tradeCount = tradeCount;
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
