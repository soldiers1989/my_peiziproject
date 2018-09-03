package com.business.dto.model.base;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * 设备信息
 *
 * @author zhaojl
 *
 */
@XmlRootElement
@XmlType(propOrder = { "dnum", "didtoken", "devmodel",  "clientver", "systemver"})
public class Client implements Serializable {

    /**
     * @Fields serialVersionUID : 
     */
    private static final long serialVersionUID = -2362169563742574917L;
    /**
     * dum
     */
    private String dnum;
    /**
     * didtoken
     */
    private String didtoken;
    /**
     * clienttype
     */
    private String devmodel;
    /**
     * 客户端版本
     */
    private String clientver;

    /**
    * 系统版本
    */
    private String systemver;

    public String getDnum() {
	return dnum;
    }

    public void setDnum(String dnum) {
	this.dnum = dnum;
    }

    public String getDidtoken() {
	return didtoken;
    }

    public void setDidtoken(String didtoken) {
	this.didtoken = didtoken;
    }

    public String getDevmodel() {
	return devmodel;
    }

    public void setDevmodel(String devmodel) {
	this.devmodel = devmodel;
    }

    public String getClientver() {
	return clientver;
    }

    public void setClientver(String clientver) {
	this.clientver = clientver;
    }

    public String getSystemver() {
	return systemver;
    }

    public void setSystemver(String systemver) {
	this.systemver = systemver;
    }

}
