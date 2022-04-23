package ${package.Entity};

import java.io.Serializable;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;


<#list table.importPackages as pkg>
import ${pkg};
</#list>

/**
 * ${table.comment!} 搜索请求类
 *
 * @author ${author}
 * @date ${date}
 */
@Data
public class ${entity}SearchRequest {


<#-- ----------  属性私有化  ---------->
<#list table.fields as field>
    <#-- 注释 -->
 <#if (field.comment) != ''>
    /**
     * ${field.comment!}
     */
 </#if>
    <#-- 自动填充注解 -->
 <#if field.propertyName != "createTime" && field.propertyName != "updateTime" && field.propertyName != "id">
     private ${field.propertyType} ${field.propertyName};
 </#if>

</#list>
}
