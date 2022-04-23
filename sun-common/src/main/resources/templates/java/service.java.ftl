package ${package.Service};

import ${package.Entity}.${entity};
import cn.wkpower.common.vo.Result;
import ${package.Mapper}.mapper.${table.mapperName};
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.wkpower.common.vo.PageInfo;

/**
 * ${table.comment!} Service
 *
 * @author ${author}
 * @date ${date}
 */
@Service
public class ${table.serviceName} {

    public Result list(${entity}SearchRequest request, PageInfo pageInfo) {
        IPage<${entity}> ${table.entityPath}Page = ${table.entityPath}Mapper.selectPage(new Page<>(pageInfo.getPageNum(), pageInfo.getPageSize()),
            new QueryWrapper<${entity}>().lambda());
        return Result.ok(${table.entityPath}Page.getRecords(), ${table.entityPath}Page.getTotal());
    }

    public Result save(${entity} ${table.entityPath}) {
        Long id =  ${table.entityPath}.getId();
        if (id == null) {
            ${table.entityPath}Mapper.insert(${table.entityPath});
        } else {
            ${table.entityPath}Mapper.updateById(${table.entityPath});
        }
        return Result.ok();
    }

    public Result delete(Long id) {
        ${table.entityPath}Mapper.deleteById(id);
        return Result.ok();
    }

    @Autowired
    private ${table.mapperName} ${table.entityPath}Mapper;

}
