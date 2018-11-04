/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.rest.web;

/**
 * 后台返回码枚举类
 */
public enum OutRecordReturnCode {

	BANK_NOTBINDING(1, "您的银行卡信息未绑定，请在个人主页进行完善！"), 
	ACCOUNT_NULL(1, "交易帐号未分配！"), 
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
