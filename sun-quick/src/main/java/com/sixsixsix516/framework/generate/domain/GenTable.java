package com.sixsixsix516.framework.generate.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.sixsixsix516.framework.constant.GenConstants;
import lombok.Data;
import org.apache.commons.lang3.ArrayUtils;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * 业务表 gen_table
 *
 * @author SUN
 */
@Data
public class GenTable {

	/**
	 * 编号
	 */
	@TableId(type = IdType.AUTO)
	private Long tableId;

	/**
	 * 表名称
	 */
	@NotBlank(message = "表名称不能为空")
	private String tableName;

	/**
	 * 表描述
	 */
	@NotBlank(message = "表描述不能为空")
	private String tableComment;

	/**
	 * 实体类名称(首字母大写)
	 */
	@NotBlank(message = "实体类名称不能为空")
	private String className;

	/**
	 * 使用的模板（crud单表操作 tree树表操作）
	 */
	private String tplCategory;

	/**
	 * 生成包路径
	 */
	@NotBlank(message = "生成包路径不能为空")
	private String packageName;

	/**
	 * 生成模块名
	 */
	@NotBlank(message = "生成模块名不能为空")
	private String moduleName;

	/**
	 * 生成业务名
	 */
	@NotBlank(message = "生成业务名不能为空")
	private String businessName;

	/**
	 * 生成功能名
	 */
	@NotBlank(message = "生成功能名不能为空")
	private String functionName;

	/**
	 * 生成作者
	 */
	@NotBlank(message = "作者不能为空")
	private String functionAuthor;

	/**
	 * 生成代码方式（0zip压缩包 1自定义路径）
	 */
	private String genType;

	/**
	 * 生成路径（不填默认项目路径）
	 */
	private String genPath;

	/**
	 * 主键信息
	 */
	@TableField(exist = false)
	private GenTableColumn pkColumn;

	/**
	 * 表列信息
	 */
	@Valid
	@TableField(exist = false)
	private List<GenTableColumn> columns;

	/**
	 * 其它生成选项
	 */
	private String options;

	/**
	 * 树编码字段
	 */
	@TableField(exist = false)
	private String treeCode;

	/**
	 * 树父编码字段
	 */
	@TableField(exist = false)
	private String treeParentCode;

	/**
	 * 树名称字段
	 */
	@TableField(exist = false)
	private String treeName;

	/**
	 * 上级菜单ID字段
	 */
	@TableField(exist = false)
	private String parentMenuId;

	/**
	 * 上级菜单名称字段
	 */
	@TableField(exist = false)
	private String parentMenuName;

	@TableField(exist = false)
	private String createTime;

	@TableField(exist = false)
	private String updateTime;

}
