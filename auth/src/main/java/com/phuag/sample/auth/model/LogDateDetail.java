package com.phuag.sample.auth.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2018/7/12.
 */
@NoArgsConstructor
@Data
public class LogDateDetail implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;

    private char type;

    private String title;

    private String create_by;

   @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    protected Date createDate;

    private String remoteAddr;

    private String userAgent;

    private String requestUri;

    private String method;

    private String params;

    private String exception;

}
