package com.phuag.ds.datasource.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
public class DataSource extends DataEntity<DataSource> {

    /**
     * Data source name
     */
    @NotBlank(message = "{udes.domain.datasource.name.notBlank}")
    @Size(max = 100, message = "{udes.domain.datasource.name.maxSize}")
    private String name;




    /**
     * Data source type
     */
    @NotBlank(message = "{udes.domain.datasource.type.notBlank}")
    @Size(max = 50, message = "{udes.domain.datasource.type.maxSize}")
    private String sourceType;

    /**
     * Data source owner
     */
    @NotBlank(message = "{udes.domain.datasource.owner.notBlank}")
    @Size(max = 50, message = "{udes.domain.datasource.owner.maxSize}")
    private String owner;

    /**
     * ID of data source model
     */
    private Integer modelId;

    /**
     * Auth credential for data source connection
     */
    private String authCreden;

    /**
     * Auth entity for data source connection
     */
//    @NotBlank(message = "{udes.domain.datasource.authentity.notBlank}")
    private String authEntity;

    /**
     * Parameters of connection
     */
    private String parameter;

    @JsonIgnore
    private Map<String, Object> parameterMap;

    /**
     * Project id
     */
    private String projectId;


    /**
     * Read permission
     */
    private boolean readable = false;

    /**
     * Write permission
     */
    private boolean writeable = false;

    /**
     * Edit permission
     */
    private boolean editable = false;

    /**
     * Execute permission
     */
    private boolean executable = false;

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
