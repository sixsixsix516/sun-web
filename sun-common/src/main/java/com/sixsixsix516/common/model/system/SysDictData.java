package com.sixsixsix516.common.model.system;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.sixsixsix516.common.core.constant.UserConstants;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.sixsixsix516.common.core.annotation.Excel;
import com.sixsixsix516.common.core.annotation.Excel.ColumnType;

/**
 * 字典数据表 sys_dict_data
 * @author SUN
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysDictData extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 字典编码
	 */
	@TableId(type = IdType.AUTO)
	@Excel(name = "字典编码", cellType = ColumnType.NUMERIC)
	private Long dictCode;

	/**
	 * 字典排序
	 */
	@Excel(name = "字典排序", cellType = ColumnType.NUMERIC)
	private Long dictSort;

	/**
	 * 字典标签
	 */
	@Excel(name = "字典标签")
	@NotBlank(message = "字典标签不能为空")
	@Size(min = 0, max = 100, message = "字典标签长度不能超过100个字符")
	private String dictLabel;

	/**
	 * 字典键值
	 */
	@Excel(name = "字典键值")
	@NotBlank(message = "字典键值不能为空")
	@Size(min = 0, max = 100, message = "字典键值长度不能超过100个字符")
	private String dictValue;

	/**
	 * 字典类型
	 */
	@Excel(name = "字典类型")
	@NotBlank(message = "字典类型不能为空")
	@Size(min = 0, max = 100, message = "字典类型长度不能超过100个字符")
	private String dictType;

	/**
	 * 样式属性（其他样式扩展）
	 */
	@Size(min = 0, max = 100, message = "样式属性长度不能超过100个字符")
	private String cssClass;

	/**
	 * 表格字典样式
	 */
	private String listClass;

	/**
	 * 是否默认（Y是 N否）
	 */
	@Excel(name = "是否默认", readConverterExp = "Y=是,N=否")
	private String isDefault;

	/**
	 * 状态（0正常 1停用）
	 */
	@Excel(name = "状态", readConverterExp = "0=正常,1=停用")
	private String status;


	public boolean getDefault() {
		return UserConstants.YES.equals(this.isDefault);
	}

}
