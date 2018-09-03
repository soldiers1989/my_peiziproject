package com.business.enums;


/**
 * 店铺类型
 */
public enum ShopType {
    GAME("GAME", "游戏"), FAMILY("FAMILY", "家庭"), CHILDREN("CHILDREN", "儿童");

    private String code;
    private String name;

    ShopType(String code, String name) {
	this.code = code;
	this.name = name;
    }

    public ShopType valueof(String name) {
	for (ShopType a : ShopType.values()) {
	    if (a.name.equals(name))
		return a;
	}
	return null;
    }

    public String value() {
	return this.code;
    }

    public String getCode() {
	return code;
    }

    public String getName() {
	return name;
    }

    public String valueofCode(String code) {
	for (ShopType a : ShopType.values()) {
	    if (a.code.equals(code))
		return a.name;
	}
	return "";
    }
}
