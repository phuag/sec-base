package com.phuag.sample.common.security.exception;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.phuag.sample.common.security.component.Auth2ExceptionSerializer;
import org.springframework.http.HttpStatus;

/**
 * @author lengleng
 * @date 2019/2/1
 */
@JsonSerialize(using = Auth2ExceptionSerializer.class)
public class ServerErrorException extends Auth2Exception {

	public ServerErrorException(String msg, Throwable t) {
		super(msg);
	}

	@Override
	public String getOAuth2ErrorCode() {
		return "server_error";
	}

	@Override
	public int getHttpErrorCode() {
		return HttpStatus.INTERNAL_SERVER_ERROR.value();
	}

}
