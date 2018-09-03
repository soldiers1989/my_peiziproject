package com.business.enums;


/**
 * Status状态说明
 */
public enum Status {
    INVALID(0, "invalid", "无效"),
    ACTIVE(1, "active", "有效"),
    DISCONTINUED(2, "discontinued", "停用"),
    CANCELLED(3, "cancelled", "取消"),
    DEPRECATED(4, "deprecated", "弃置");

    private int code;
    private String name, display;

    Status(int code, String name, String display) {
        this.code = code;
        this.name = name;
        this.display = display;
    }

    public int value() {
        return this.code;
    }

    public Status valueof(String name) {
        for (Status a : Status.values()) {
            if (a.name.equals(name)) return a;
        }
        return null;
    }

    public String getDisplay() {
        return this.display;
    }
}
