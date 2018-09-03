package com.business.dto.model.base;

import java.io.Serializable;

/**
 * 系统通讯结果码字典
 * 
 * @author zhaojl
 *
 */
public enum ReturnInfo implements Serializable {

    /**
     * 成功
     */
    SUCCESS("0000", "成功"),
    /**
     * 正常
     */
    NORMAL("2000", "正常"),

    /**
     * 业务逻辑异常
     */
    BUSINESSERROR("9999", "业务逻辑异常"),
    /**
     * 错误
     */
    ERROR("99999", "错误");

    /**
     * 返回码
     */
    private String code;
    /**
     * 返回信息
     */
    private String msg;

    /**
     * 构告方法
     * @param code
     * @param msg
     */
    private ReturnInfo(String code, String msg) {
	this.code = code;
	this.msg = msg;
    }

    /**
     * @return the code
     */
    public String getCode() {
	return code;
    }

    /**
     * @return the msg
     */
    public String getMsg() {
	return msg;
    }

}
