package com.business.dto.model.base;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

import com.business.dto.model.base.Client;
import com.business.dto.model.base.User;


/**
 * 请求参数信息
 *
 * @author zhaojl
 */
@XmlRootElement
@XmlType(propOrder = { "callid", "language", "timezone", "region", "client", "user" })
public class Parameter implements Serializable {

    /**
     * @Fields serialVersionUID : 
     */
    private static final long serialVersionUID = 1025836130409890003L;
    /**
     * 流水号
     */
    private String callid;
    /**
     * 语言
     */
    private String language;
    /**
     * 时区
     */
    private String timezone;
    /**
     * 国家
     */
    private String region;
    /**
     * 设备信息
     */
    private Client client;
    /**
     * 用户信息
     */
    private User user;

    /**
     * @return the callid
     */
    public String getCallid() {
	return callid;
    }

    /**
     * @param callid the callid to set
     */
    public void setCallid(String callid) {
	this.callid = callid;
    }

    /**
     * @return the language
     */
    public String getLanguage() {
	return language;
    }

    /**
     * @param language the language to set
     */
    public void setLanguage(String language) {
	this.language = language;
    }

    /**
     * @return the client
     */
    public Client getClient() {
	return client;
    }

    /**
     * @param client the client to set
     */
    public void setClient(Client client) {
	this.client = client;
    }

    /**
     * @return the user
     */
    public User getUser() {
	return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
	this.user = user;
    }

    public String getTimezone() {
	return timezone;
    }

    public void setTimezone(String timezone) {
	this.timezone = timezone;
    }

    public String getRegion() {
	return region;
    }

    public void setRegion(String region) {
	this.region = region;
    }

}
