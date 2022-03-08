package com.sixsixsix516.common.model.system;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.sixsixsix516.common.core.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 角色表 sys_role
 *
 * @author SUN
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysRole extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 角色ID
	 */
	@TableId(type = IdType.AUTO)
	@Excel(name = "角色序号", cellType = Excel.ColumnType.NUMERIC)
	private Long roleId;

	/**
	 * 角色名称
	 */
	@Excel(name = "角色名称")
	@NotBlank(message = "角色名称不能为空")
	@Size(min = 0, max = 30, message = "角色名称长度不能超过30个字符")
	private String roleName;

	/**
	 * 角色排序
	 */
	@Excel(name = "角色排序")
	@NotBlank(message = "显示顺序不能为空")
	private String roleSort;

	/**
	 * 角色状态（0正常 1停用）
	 */
	@Excel(name = "角色状态", readConverterExp = "0=正常,1=停用")
	private String status;

	/**
	 * 删除标志（0代表存在 2代表删除）
	 */
	private String delFlag;



	/**
	 * 创建者
	 */
	@TableField(exist = false)
	private String createBy;

	/**
	 * 更新者
	 */
	@TableField(exist = false)
	private String updateBy;

	/**
	 * 创建时间
	 */
	@TableField(fill = FieldFill.INSERT)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime createTime;

	/**
	 * 更新时间
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime updateTime;

	/**
	 * 备注
	 */
	private String remark;

	/**
	 * 用户是否存在此角色标识 默认不存在
	 */
	@TableField(exist = false)
	private boolean flag = false;

	/**
	 * 菜单组
	 */
	@TableField(exist = false)
	private Long[] menuIds;

	public SysRole(Long roleId){
		this.roleId = roleId;
	}

	public boolean isAdmin() {
		return isAdmin(this.roleId);
	}

	public static boolean isAdmin(Long roleId) {
		return roleId != null && 1L == roleId;
	}

}
