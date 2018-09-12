/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.rest.pc;

/**
 * 后台返回码枚举类
 */
public enum UserReturnCode {

	USER_REPEAT(1, "用户已存在"), 
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
