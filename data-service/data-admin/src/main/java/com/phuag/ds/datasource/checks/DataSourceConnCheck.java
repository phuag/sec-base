package com.phuag.ds.datasource.checks;


import com.phuag.ds.datasource.entity.DataSource;
import com.phuag.ds.datasource.entity.DataSourceModel;

import java.io.File;

/**
 * @author davidhua
 * 2018/9/03
 * DataSource Test Interface
 */
public interface DataSourceConnCheck {
    String PREFIX = "DatSourceConnCheck-";
    Integer CONNECT_TIMEOUT_IN_SECONDS = 5;
    /**
     * Validate the data source's model assembly
     * @param md data source model assembly
     * @throws Exception if validate fail , throw an Exception
     */
    void validate(DataSourceModel md) throws Exception;

    /**
     * Check main method
     * @param ds data source
     * @param file associate file, not must be required
     */
    void check(DataSource ds, File file) throws Exception;

}
