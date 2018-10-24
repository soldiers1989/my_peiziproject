/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business.rest.web;

/**
 * 后台返回码枚举类
 */
public enum PeiziReturnCode {

	ACCOUNT_NOTENOUGH(1, "可分配的交易帐号数量不足！"), 
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
