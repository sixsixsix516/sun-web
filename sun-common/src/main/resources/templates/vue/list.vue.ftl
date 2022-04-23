<template>
  <div class="app-container">

    <div class="searchWrapper">
      <#list table.fields as field>
      <#if (field.propertyName) != 'createTime' &&  (field.propertyName)  != 'updateTime' &&  (field.propertyName)  != 'id'>
      <el-input
              v-model="queryParams.${field.propertyName}"
              placeholder="查询${field.comment!}"
              clearable
              style="width: 240px"
              size="small"
              @change="handleQuery"
              @keyup.enter.native="handleQuery"
      />
      </#if>
      </#list>
      <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
    </div>

    <div class="pageContent">
      <div class="featureList">
        <el-button type="primary" icon="el-icon-plus"  @click="prepareSave(1)" v-hasPermi="['${table.entityPath}:save']">新增</el-button>
      </div>

    <!-- 表格区域开始 -->
    <el-table v-loading="loading"  :data="tableData">
      <#list table.fields as field>
      <el-table-column prop="${field.propertyName}" align="center" label="${field.comment!}" show-overflow-tooltip/>
      </#list>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button title="修改"
                     @click="prepareSave(2,scope.row)"
                     v-hasPermi="['${table.entityPath}:save']"
                     type="text"
                     icon="el-icon-edit"/>
          <el-button title="删除" @click="handleDelete(scope.row)"
                     v-hasPermi="['${table.entityPath}:delete']"
                     type="text"
                     icon="el-icon-delete"/>
        </template>
      </el-table-column>
    </el-table>
    <!-- 表格区域结束 -->

    <pagination
            v-show="total>0"
            :total="total"
            :page.sync="queryParams.pageNum"
            :limit.sync="queryParams.pageSize"
            @pagination="getList"
    />

    </div>

    <!-- 保存 -->
    <save :show="saveDialogVisible" :currentEntity="currentEntity" :saveState="saveState" @close="closeDialog"/>

    <el-backtop/>
  </div>
</template>

<script>
import {${table.entityPath}List, delete${entity}} from "@/api/${table.entityPath}";
import save from './save';

export default {
  name: "${table.entityPath}List",
  components: {
    save,
  },
  data() {
    return {
      // 遮罩层
      loading: true,

      // 分页数据
      pageSize: 10,
      total: 0,
      currentPage: 1,
      tableData: [],

      queryParams: {
        pageNum: 1,
        pageSize: 10,
      <#list table.fields as field>
        <#if (field.propertyName) != 'createTime' &&  (field.propertyName)  != 'updateTime' &&  (field.propertyName)  != 'id'>
        // ${field.comment!}
        ${field.propertyName}: '',
        </#if>
      </#list>
      },

      // 保存状态 1添加 2更新
      saveState: 1,
      // 保存框是否显示
      saveDialogVisible: false,
      // 当前实体
      currentEntity: {},
    }
  },
  mounted() {
    this.getList()
  },

  methods: {
    // 搜索按钮操作
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /**
     * 获取${table.comment!}列表
     */
    async getList() {
      this.loading = true;
      ${table.entityPath}List(this.queryParams).then(res => {
        this.tableData = res.data;
        this.total = res.total;
        this.loading = false;
      });
    },

    /**
     * 准备保存${table.comment!}
     * @param saveState 1添加 2更新
     */
    prepareSave(saveState, entity) {
      if (saveState === 1) {
        entity = {

        }
      }
      this.saveState = saveState;
      this.currentEntity = entity;
      this.saveDialogVisible = true;
    },
    handleDelete(row) {
      this.$confirm('此操作将删除该数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        delete${entity}(row.id).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        });
      })
    },
    closeDialog() {
      this.saveDialogVisible = false;
      this.getList();
    },
  },
}
</script>
