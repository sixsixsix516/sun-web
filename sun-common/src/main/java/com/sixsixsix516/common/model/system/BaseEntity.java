package com.sixsixsix516.common.model.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Map;

/**
 * Entity基类
 *
 * @author SUN
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 搜索值
	 */
	@TableField(exist = false)
	private String searchValue;

	/**
	 * 开始时间
	 */
	@JsonIgnore
	@TableField(exist = false)
	private String beginTime;

	/**
	 * 结束时间
	 */
	@JsonIgnore
	@TableField(exist = false)
	private String endTime;

	/**
	 * 请求参数
	 */
	@TableField(exist = false)
	private Map<String, Object> params;

}
