package com.business.dto.model.base;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * 用户信息
 * 
 * @author zhaojl
 * 
 */
@XmlRootElement
@XmlType(propOrder = { "token" ,"huanid" })
public class User implements Serializable {

    /**
     * @Fields serialVersionUID : 
     */
    private static final long serialVersionUID = 7092055714126709687L;
    /**
     * token
     */
    private String token;
    /**
     * huanid
     */
    private String huanid;
  
    /**
     * @return the token
     */
    public String getToken() {
	return token;
    }

    /**
     * @param token
     *            the token to set
     */
    public void setToken(String token) {
	this.token = token;
    }

	public String getHuanid() {
		return huanid;
	}

	public void setHuanid(String huanid) {
		this.huanid = huanid;
	}
    

}
