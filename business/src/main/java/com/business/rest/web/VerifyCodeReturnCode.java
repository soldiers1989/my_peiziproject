/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.rest.web;

/**
 * 后台返回码枚举类
 */
public enum VerifyCodeReturnCode {

	MSG_SENDERROR(1, "短信发送失败!"), 
	MSG_PHONENOTEXIST(1, "找回密码手机号码不存在!"), 
	;
	private int flag;
	private String desc;

	VerifyCodeReturnCode(int flag, String desc) {
		this.flag = flag;
		this.desc = desc;
	}

	public String getDesc() {
		return this.desc;
	}

	public int getFlag() {
		return this.flag;
	}
}
