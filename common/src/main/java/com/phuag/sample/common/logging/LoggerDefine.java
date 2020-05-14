package com.phuag.sample.common.logging;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 *
 * @author vvvvvv
 * @date 2017/12/6
 */
@Data
@AllArgsConstructor
public class LoggerDefine {
    private String module;
    private String describe;
    private String type;
}
