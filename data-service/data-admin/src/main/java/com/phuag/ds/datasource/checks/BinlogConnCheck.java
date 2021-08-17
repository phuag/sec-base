package com.phuag.ds.datasource.checks;

import com.phuag.ds.datasource.entity.DataSource;
import com.phuag.ds.datasource.entity.DataSourceModel;
import org.springframework.stereotype.Service;

import java.io.File;
import static com.phuag.ds.common.datasource.Constants.*;
import static com.phuag.ds.datasource.checks.DataSourceConnCheck.PREFIX;


/**
 * @author davidhua
 * 2020/2/26
 */
@Service(PREFIX + "binlog")
public class BinlogConnCheck extends AbstractDataSourceConnCheck{
    @Override
    public void validate(DataSourceModel md) throws Exception {

    }

    @Override
    public void check(DataSource ds, File file) throws Exception {

    }
}
