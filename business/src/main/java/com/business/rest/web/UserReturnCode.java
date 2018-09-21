/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.rest.web;

/**
 * 后台返回码枚举类
 */
public enum UserReturnCode {

	USER_NOTEXIST(1, "用户不存在！"), 
	USER_REPEAT(1, "手机号已存在！"), 
	CODE_NOTSEND(1, "未发送验证码！"), 
	CODE_ERROR(1, "验证码错误！"), 
	PASSWORD_ERROR(1, "密码错误！"), 
	OLDPASSWORD_ERROR(1, "原始密码错误！"), 
	;
	private int flag;
	private String desc;

	UserReturnCode(int flag, String desc) {
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
