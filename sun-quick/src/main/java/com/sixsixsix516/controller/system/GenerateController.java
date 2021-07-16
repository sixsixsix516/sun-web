package com.sixsixsix516.controller.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sixsixsix516.framework.generate.GenTableService;
import com.sixsixsix516.framework.generate.domain.GenTable;
import com.sixsixsix516.framework.generate.mapper.GenTableMapper;
import com.sixsixsix516.framework.vo.PageInfo;
import com.sixsixsix516.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 代码生成
 *
 * @author SUN
 * @date 2021/7/16
 */
@RestController
@RequestMapping("/generate")
public class GenerateController {

    @Autowired
    private GenTableMapper genTableMapper;
    @Autowired
    private GenTableService genTableService;


    /**
     * 数据库表列表
     */
    @GetMapping("/list")
    public Result list(PageInfo pageInfo){
        IPage<GenTable> genTablePage = genTableMapper.listTable(new Page<>(pageInfo.getPageNum(), pageInfo.getPageSize()), null);
        return Result.ok(genTablePage.getRecords(),genTablePage.getTotal());
    }


    /**
     * 生成代码
     */
    @GetMapping
    public ResponseEntity<byte[]> generate(String tableName){
        return genTableService.generateCode(tableName);
    }


}
