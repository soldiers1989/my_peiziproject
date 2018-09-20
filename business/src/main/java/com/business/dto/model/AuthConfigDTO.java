package com.business.dto.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class AuthConfigDTO {

    private Long id;
    private String name;
    private String url;
    private Long pid;
    private Long status;
    private String createtime;
    private String operator;
    private String operatetime;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getUrl() {
	return url;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    public String getCreatetime() {
	return createtime;
    }

    public void setCreatetime(String createtime) {
	this.createtime = createtime;
    }

    public Long getStatus() {
	return status;
    }

    public void setStatus(Long status) {
	this.status = status;
    }

    public Long getPid() {
	return pid;
    }

    public void setPid(Long pid) {
	this.pid = pid;
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
