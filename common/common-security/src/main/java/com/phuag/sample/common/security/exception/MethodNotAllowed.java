package com.phuag.sample.common.security.exception;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.phuag.sample.common.security.component.Auth2ExceptionSerializer;
import org.springframework.http.HttpStatus;

/**
 * @author lengleng
 * @date 2019/2/1
 */
@JsonSerialize(using = Auth2ExceptionSerializer.class)
public class MethodNotAllowed extends Auth2Exception {

	public MethodNotAllowed(String msg, Throwable t) {
		super(msg);
	}

	@Override
	public String getOAuth2ErrorCode() {
		return "method_not_allowed";
	}

	@Override
	public int getHttpErrorCode() {
		return HttpStatus.METHOD_NOT_ALLOWED.value();
	}

}
