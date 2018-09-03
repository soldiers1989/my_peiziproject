package com.business.dto.model.base;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * 响应的基类
 * 
 * @author zhaojl
 *
 */
@XmlRootElement
@XmlType(propOrder = { "callid", "servertime", "state", "note", "apiversion" })
public class Response implements Serializable{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    /**
     * 流水号
     */
    private String callid;

    /**
     * 服务器响应时间
     */
    private String servertime;
    /**
     * 服务器响应内容
     */
    private String note;
    /**
     * 服务器响应码
     */
    private String state;
    /**
     * api版本
     */
    private String apiversion;

    /**
     * 构造方法
     */
    public Response() {

    }

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
     * @return the servertime
     */
    public String getServertime() {
	return servertime;
    }

    /**
     * @param servertime the servertime to set
     */
    public void setServertime(String servertime) {
	this.servertime = servertime;
    }

    /**
     * @return the note
     */
    public String getNote() {
	return note;
    }

    /**
     * @param note the note to set
     */
    public void setNote(String note) {
	this.note = note;
    }

    /**
     * @return the state
     */
    public String getState() {
	return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
	this.state = state;
    }

    /**
     * @return the apiversion
     */
    public String getApiversion() {
	return apiversion;
    }

    /**
     * @param apiversion the apiversion to set
     */
    public void setApiversion(String apiversion) {
	this.apiversion = apiversion;
    }

}
