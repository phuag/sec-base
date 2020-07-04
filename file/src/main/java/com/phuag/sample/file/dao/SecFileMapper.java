package com.phuag.sample.file.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.phuag.sample.file.domain.SecFile;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author phuag
 */
public interface SecFileMapper  extends BaseMapper<SecFile> {
    /**
     * 查询md5是否已经存在
     *
     */

    @Select("select count(*) from sec_file "+
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and file_md5= #{fileMd5,jdbcType=VARCHAR} limit 1")
    int checkMd5Whether(@Param("fileMd5") String fileMd5);

    /**
     * 根据Md5获取文件信息
     */
    @Select("SELECT * FROM sec_file " +
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and file_md5= #{fileMd5,jdbcType=VARCHAR}")
    SecFile getFileByMd5(@Param("fileMd5") String fileMd5);


    /**
     * 根据文件ID获取文件信息
     *
     */
    @Select("SELECT * FROM sec_file " +
            "WHERE del_flag = ${@com.phuag.sample.common.persistence.domain.BaseEntity@DEL_FLAG_NORMAL}  " +
            "and file_id= #{fileId,jdbcType=VARCHAR}")
    SecFile getFileByFid(@Param("fileId") String fileId);
}
