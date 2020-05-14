package com.phuag.sample.common.exception;

import com.phuag.sample.common.enums.ResultEnum;

/**
 * Created by Administrator on 2018/7/18.
 */
public class InnerException extends RuntimeException {
   // private int code;

    public InnerException(ResultEnum resultEnum) {
        super(resultEnum.getMsg());
       // this.code = code;
    }

  /*  public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }*/
}
