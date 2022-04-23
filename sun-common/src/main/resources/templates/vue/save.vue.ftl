<template>
  <el-dialog
    :title="saveState === 1 ? '添加${table.comment!}' : '更新${table.comment!}'"
    center
    :visible.sync="show" width="40%"
    append-to-body
    :close-on-click-modal="false"
    :before-close="close">

    <el-form :model="currentEntity" ref="form" :rules="rules">
      <#list table.fields as field>
        <#if (field.propertyName) != 'createTime' &&  (field.propertyName)  != 'updateTime' &&  (field.propertyName)  != 'id'>
        <el-form-item label="${field.comment!}" label-width="120px" prop="${field.propertyName}">
          <el-input style="width: 400px" v-model="currentEntity.${field.propertyName}" placeholder="请输入${field.comment!}" maxlength="10" show-word-limit></el-input>
        </el-form-item>
        </#if>
      </#list>
    </el-form>

    <!-- 底部按钮组开始 -->
    <span slot="footer" class="dialog-footer">
        <el-button @click="close">取 消</el-button>
        <el-button @click="save" type="primary" :loading="saveBtnLoading">保存</el-button>
      </span>
  </el-dialog>
</template>

<script>

import {save${entity}} from '@/api/${table.entityPath}';

export default {
  name: "save",
  props: {
    show: Boolean,
    // 保存状态 1添加 2更新
    saveState: Number,
    // 当前实体
    currentEntity: Object,
  },
  data(){
    return {
        saveBtnLoading: false,
        rules: {
            <#list table.fields as field>
            <#if (field.propertyName) != 'createTime' &&  (field.propertyName)  != 'updateTime' &&  (field.propertyName)  != 'id'>
                ${field.propertyName}: [
                    {required: true, message: '请输入${field.comment!}', trigger: 'blur'},
                ],
            </#if>
            </#list>
        }
    }
  },
  methods: {
    // 保存${table.comment!}
    save() {
     this.$refs['form'].validate((valid) => {
         if (valid) {
             this.saveBtnLoading = true;
             save${entity}(this.currentEntity).then( _=> {
                 this.msgSuccess("保存成功");
                 this.saveBtnLoading = false;
                 this.close();
             })
         } else {
             return false;
         }
     });
    },

    close() {
      this.$emit("close");
    }
  }
}
</script>

<style scoped>

</style>
