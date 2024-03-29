package com.phuag.sample.common.core.persistence.domain;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.phuag.sample.common.core.util.IdGen;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import java.util.Date;

/**
 * 数据Entity类,关联表对象别继承此类
 * @author ThinkGem
 * @version 2014-05-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
public abstract class DataEntity<T> extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 备注
	 */
	@Length(min=0, max=255)
	protected String remarks;

	/**
	 * 创建者
	 */
	@JsonIgnore
	@TableField(value = "create_by", fill = FieldFill.INSERT)
	@CreatedBy
	protected String createBy;

	/**
	 * 创建日期
 	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@TableField(value = "create_date", fill = FieldFill.INSERT)
	@CreatedDate
	protected Date createDate;

	/**
	 * 更新者
 	 */
	@JsonIgnore
	@TableField(value = "update_by", fill = FieldFill.UPDATE)
	@LastModifiedBy
	protected String updateBy;

	/**
	 * 更新日期
	 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@TableField(value = "update_Date", fill = FieldFill.UPDATE)
	@LastModifiedDate
	protected Date updateDate;

	/**
	 * 删除标记（0：正常；1：删除；2：审核）
	 */
	@JsonIgnore
	@Length(min=1, max=1)
	@TableLogic(DEL_FLAG_NORMAL)
	protected String delFlag;


	public DataEntity() {
		super();
		this.delFlag = DEL_FLAG_NORMAL;
	}
	
	public DataEntity(String id) {
		super(id);
	}

	/**
	 * 插入之前执行方法，需要手动调用
	 */
	@Override
	public void preInsert(){
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		if (this.isNewRecord()){
			setId(IdGen.uuid());
		}
	}

	/**
	 * 更新之前执行方法，需要手动调用
	 */
	@Override
	public void preUpdate(){
		this.updateDate = new Date();
	}

}
