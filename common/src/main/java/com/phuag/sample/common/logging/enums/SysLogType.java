package com.phuag.sample.common.logging.enums;

/**
 *
 * @author vvvvvv
 * @date 2017/12/6
 */
public enum SysLogType {
    LOGIN("1"),ACCESS("2"),OPER("3"),EXCEPION("4");

    private String value;

    SysLogType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
