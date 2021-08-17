package com.phuag.ds.common.auth;

/**
 * @author davidhua
 * 2018/10/12
 */
public class AuthConstraints {

    private AuthConstraints(){

    }
    public static final String GATEWAY_CLIENT = "exchangis-gateway";

    public static final String ENV_SERV_TOKEN = "env.serv.token";

    public static final String ENV_SERV_TOKEN_PATH = "env.serv.token.path";

    public static final String DEFAULT_SSO_COOKIE = "UM-SSO-BDP";

    public static final String TICKET_NAME = "ticket";

    public static final String HOST_PORT = "host_port";

    public static final String TICKT_REFRESH_PARAM = "refresh_tk";

    public static final String SSO_TOKEN_TIMESTAMP = "tk-time";

    public static final String SSO_TOKEN_TIME_PATTERN = "yyyyMMddHHmmss";

    public static final String SSO_REDIRECT_SERVICE = "service";

    public static final String SSO_REDIRECT_SYSTEMID = "systemId";

    public static final String X_AUTH_ID="X-AUTH-ID";

    public static final String ALLOWEDURIS = "allowedUris";

    public static final String TOKEN_REFRESH_ID = "id";

    public static final String TOKEN_REFRESH_PWD = "pwd";

    public static final String SCRIPT_ACCOUNT_NAME = "SC_AUTH_ID";

    public static final String SCRIPT_PWD_NAME = "SC_AUTH_PWD";
}
