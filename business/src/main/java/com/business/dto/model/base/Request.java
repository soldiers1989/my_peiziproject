package com.business.dto.model.base;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

import com.business.dto.model.base.Parameter;


/**
 * 请求的基类
 * 
 * @author zhaojl
 *
 */
@XmlRootElement
@XmlType(propOrder = { "parameter", "apiversion" })
public class Request implements Serializable {

    /**
     * @Fields serialVersionUID : 
     */
    private static final long serialVersionUID = -3374356655769770170L;

    /**
     * 请求基本参数
     */
    private Parameter parameter;

    /**
     * api版本
     */
    private String apiversion;

    /**
     * 构造方法
     */
    public Request() {
    }

    /**
     * @return the parameter
     */
    public Parameter getParameter() {
	return parameter;
    }

    /**
     * @param parameter the parameter to set
     */
    public void setParameter(Parameter parameter) {
	this.parameter = parameter;
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
