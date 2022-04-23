package ${package.Controller};

import ${package.Entity}.${entity};
import cn.wkpower.common.vo.Result;
import cn.wkpower.common.vo.PageInfo;
import cn.wkpower.manager.annotation.Log;
import org.springframework.security.access.prepost.PreAuthorize;
import ${package.Entity}.service.${table.serviceName};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import cn.wkpower.framework.vo.PageInfo;

/**
 * ${table.comment!} 控制器
 *
 * @author ${author}
 * @date ${date}
 */
@RestController
@RequestMapping("/${table.entityPath}")
public class ${table.controllerName} {

    @GetMapping("/list")
    @PreAuthorize("@ss.hasPermi('${table.entityPath}:list')")
    public Result list(${entity}SearchRequest request, PageInfo pageInfo) {
        return ${table.entityPath}Service.list(request,pageInfo);
    }

    @PostMapping
    @PreAuthorize("@ss.hasPermi('${table.entityPath}:save')")
    @Log(title = "${table.comment!}", businessType = BusinessType.INSERT)
    public Result save(@RequestBody ${entity} ${table.entityPath}) {
        return ${table.entityPath}Service.save(${table.entityPath});
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("@ss.hasPermi('${table.entityPath}:delete')")
    @Log(title = "${table.comment!}", businessType = BusinessType.DELETE)
    public Result delete(@PathVariable Long id) {
        return ${table.entityPath}Service.delete(id);
    }

    @Autowired
    private ${table.serviceName} ${table.entityPath}Service;

}
