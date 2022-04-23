package com.sixsixsix516.manager.vo.response.menu;

import com.sixsixsix516.common.model.system.TreeSelect;
import lombok.Data;

import java.util.List;

/**
 * @author SUN
 * @date 23/04/2022
 */
@Data
public class MenuListResponse {

    private List<Integer> checkedKeys;
    private List<TreeSelect> menus;
}
