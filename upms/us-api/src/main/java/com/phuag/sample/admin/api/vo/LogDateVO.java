package com.phuag.sample.admin.api.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/7/17.
 * 前台日志页面的查询时间封装类
 */
@Slf4j
public class LogDateVO implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 查询开始时间
     */
    private Date beginTime;
    /**
     * 查询结束时间
     */
    private Date finishTime;
    /**
     * 排序功能(正||倒)
     */
    private int sort;

    public int getSort() {
        if (beginTime == null && finishTime == null) {
            sort = 0;
        }
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getFinishTime() {
        return finishTime;
    }

    /**
     * 前台传值少一天，重置为点击日期 12点60分60秒
     */
    public void setFinishTime(String string) throws ParseException {
        if (StringUtils.isNoneBlank(string)) {
            string = string.substring(0, 10);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(string);
            date.setTime(date.getTime() + (48 * 60 * 60 * 1000));
            this.finishTime = date;
        } else {
            this.finishTime = null;
        }
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getBeginTime() {
        return beginTime;
    }

    /**
     * 前台传值少一天，重置为点击日期 0点0分0秒-1秒时间
     */
    public void setBeginTime(String string1) throws ParseException {
        if (StringUtils.isNoneBlank(string1)) {
            string1 = string1.substring(0, 10);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(string1);
            date.setTime(date.getTime() + (24 * 60 * 60 * 1000));
            this.beginTime = date;
        } else {
            this.beginTime = null;
        }
    }

}
