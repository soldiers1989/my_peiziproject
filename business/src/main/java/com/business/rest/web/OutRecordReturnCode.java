/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.rest.web;

/**
 * 后台返回码枚举类
 */
public enum OutRecordReturnCode {

	AMOUNT_NOTENOUGH(1, "您提现的金额大于您的余额！"), 
	;
	private int flag;
	private String desc;

	OutRecordReturnCode(int flag, String desc) {
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
