package com.business.dto.model;

import javax.xml.bind.annotation.XmlRootElement;

import com.business.dto.model.RestfulResult;


@XmlRootElement
public class SystemConfig {

    private Long id;
    private String code;
    private String name;
    private String value;
    private String memo;
    private Integer status;
    private String createtime;
    private String operator;
    private String operatetime;
    private RestfulResult result;

    public String getCode() {
	return code;
    }

    public void setCode(String code) {
	this.code = code;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getValue() {
	return value;
    }

    public void setValue(String value) {
	this.value = value;
    }

    public String getMemo() {
	return memo;
    }

    public void setMemo(String memo) {
	this.memo = memo;
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

    public RestfulResult getResult() {
	return result;
    }

    public void setResult(RestfulResult result) {
	this.result = result;
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

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }
}
