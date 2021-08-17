package com.phuag.ds.datasource.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.phuag.sample.common.core.persistence.domain.DataEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * Data source owner
 * @author davidhua
 */
@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class DataSourceOwner extends DataEntity<DataSourceOwner> {

    /**
     * Owner name
     */
    @NotBlank(message = "{udes.domain.datasource.owner.name.notBlank}")
    @Size(max = 20, message = "{udes.domain.datasource.owner.name.max}")
    private String name;



}
