package com.phuag.ds.datasource.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.phuag.sample.common.core.persistence.domain.DataEntity;
import com.phuag.sample.common.core.util.JSONUtils;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.Map;

/**
 * @author phuag
 */
@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class DataSourceModel extends DataEntity<DataSourceModel> {
    /**
     * Model name
     */
    @NotBlank(message = "{udes.domain.model.name.notBlank}")
    @Size(max = 100, message = "{udes.domain.model.name.maxSize}")
    private String name;


    /**
     * Data source type
     */
    @NotBlank(message = "{udes.domain.model.type.notBlank}")
    @Size(max = 50, message = "{udes.domain.model.type.maxSize}")
    private String sourceType;

    /**
     * Model parameters
     */
    @NotBlank(message = "{udes.domain.model.parameter.notBlank}")
    private String parameter;

    @JsonIgnore
    private Map<String, Object> parameterMap;

    /**
     * resolve parameters
     * @return
     */
    public Map<String, Object> resolveParams(){
        if(null == parameterMap){
            if (StringUtils.isNotBlank(parameter)){
                parameterMap = JSONUtils.parseObject(getParameter(), Map.class);
            }else {
                parameterMap = new HashMap<>(4);
            }
        }
        return parameterMap;
    }
}
