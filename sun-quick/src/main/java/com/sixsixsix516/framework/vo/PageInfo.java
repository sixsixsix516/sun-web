package com.sixsixsix516.framework.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * @author sun 2020/9/4 10:06
 */
@Data
public class PageInfo {

	@TableField(exist = false)
	private int pageNum;
	@TableField(exist = false)
	private int pageSize;

}
