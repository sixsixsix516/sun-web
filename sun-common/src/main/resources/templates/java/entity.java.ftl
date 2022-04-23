package ${package.Entity};

import java.io.Serializable;
import lombok.Data;

<#list table.importPackages as pkg>
import ${pkg};
</#list>

/**
 * ${table.comment!} 实体类
 *
 * @author ${author}
 * @date ${date}
 */
@Data
public class ${entity} implements Serializable {

    private static final long serialVersionUID = 1L;

<#-- ----------  属性私有化  ---------->
<#list table.fields as field>
    <#-- 注释 -->
 <#if (field.comment) != ''>
    /**
     * ${field.comment!}
     */
 </#if>
    <#-- 注解 -->
    <#-- 乐观锁注解 -->
 <#if (versionFieldName!"") == field.name>
     @Version
 </#if>
    <#-- 逻辑删除注解 -->
 <#if (logicDeleteFieldName!"") == field.name>
     @TableLogic
 </#if>
    <#-- 自动填充注解 -->
 <#if field.propertyName == "createTime">
    @TableField(fill = FieldFill.INSERT)
 </#if>
 <#if field.propertyName == "updateTime">
    @TableField(fill = FieldFill.INSERT_UPDATE)
 </#if>
 <#if field.keyFlag>
    @TableId(type = IdType.AUTO)
  </#if>
    private ${field.propertyType} ${field.propertyName};

</#list>
}
