/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.rest.web;

/**
 * 后台返回码枚举类
 */
public enum PeiziReturnCode {

	AMOUNT_NOTENOUGH(1, "您的余额不足,请先充值再进行配资申请！"), 
	;
	private int flag;
	private String desc;

	PeiziReturnCode(int flag, String desc) {
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
