import request from '@/utils/request'

///====================== ${table.comment!}分类 ======================

// ${table.comment!}列表
export function ${table.entityPath}List(data) {
    return request({
        url: '/${table.entityPath}/list',
        method: 'get',
        params: data
    })
}

// ${table.comment!}保存
export function save${entity}(data) {
    return request({
        url: '/${table.entityPath}',
        method: 'post',
        data
    })
}

// ${table.comment!}删除
export function delete${entity}(id) {
    return request({
        url: '/${table.entityPath}/'+id,
        method: 'delete'
    })
}
