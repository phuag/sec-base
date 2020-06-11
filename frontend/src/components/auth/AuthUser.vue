<template>
  <section>
    <!--工具条-->
    <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
      <el-form :inline="true" :model="filters">
        <el-form-item>
          <el-cascader style="width:280px" filterable clearable change-on-select v-model="filters.authUnit" :options="authUnitOptions" :props="authUnitProps" placeholder="所在单位">
          </el-cascader>
        </el-form-item>
        <el-form-item>
          <el-input v-model="filters.name" placeholder="姓名或者身份证" suffix-icon="el-icon-search"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" v-on:click="query">查询</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="pullData">同步</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary">导出</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary">导入</el-button>
        </el-form-item>
      </el-form>
    </el-col>

    <!--列表-->
    <el-table :data="authUsers" highlight-current-row v-loading="listLoading" @selection-change="selsChange" style="width: 100%;">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column type="index" width="60">
      </el-table-column>
      <el-table-column prop="name" label="姓名" min-width="80" sortable>
      </el-table-column>
      <el-table-column prop="unitName" label="单位" min-width="180" sortable :formatter="unit_formatter">
      </el-table-column>
      <el-table-column prop="uniqueId" label="身份证号" min-width="120" sortable>
      </el-table-column>
      <el-table-column prop="sex" label="性别" min-width="60" sortable>
      </el-table-column>
      <el-table-column prop="authorized" label="授权状态" min-width="60" :formatter="authorized_formatter" sortable>
      </el-table-column>
      <el-table-column label="操作" width="200">
        <template slot-scope="scope">
          <el-button type="primary" class="el-icon-edit"  size="small" @click="showUserAuthorizationForm(scope.$index, scope.row)"  title="授权"></el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--工具条-->
    <el-col :span="24" class="toolbar">
      <el-pagination layout="prev, pager, next" background :current-page.sync="page" @current-change="getAuthUsers()" :page-size="pageSize" :total="total" style="float:right;">
      </el-pagination>
    </el-col>

    <!--授权界面-->

  <el-dialog title="授权" :visible.sync="userAuthorizationFormVisible" :close-on-click-modal="false">
      <el-form :model="userAuthorizationForm" label-width="120px" ref="userAuthorizationForm" novalidate>
        <el-form-item label="角色授予：">
          <el-col :span="20">
            <el-select v-model="userAuthorizationForm.roles" multiple placeholder="请选择" filterable  style="width: 100%;">
              <el-option v-for="item in roleOptions" :key="item.id" :label="item.name" :value="item.id" :disabled="item.disabled" >
              </el-option>
            </el-select>
          </el-col>
        </el-form-item>
      </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="userAuthorizationFormVisible = false">取消</el-button>
      <el-button type="primary" @click="authSubmit" >提交</el-button>
    </div>
  </el-dialog>
  </section>
</template>

<script>
// import NProgress from 'nprogress'
import { getAuthUserListPage, saveAuthUserRole, getAuthUserRole } from '../../api/auth/authUser'
import { authRoleSelectList } from '../../api/auth/authRole'
import { getAuthUnitList } from '../../api/auth/authUnit'
import router from '../../router'
import util from '../../common/js/util'
export default {
  data () {
    return {
      filters: {
        authUnit: [],
        name: ''
      },
      authUsers: [],
      total: 0,
      page: 1,
      pageSize: 10,
      listLoading: false,
      sels: [], // 列表选中列
      userAuthorizationFormVisible: false,
      userAuthorizationForm: {
        roles: []
      },
      roleOptions: [],
      selectAuthRow: '', // 选中的授权行
      authUnitOptions: [], // 单位
      authUnitProps: {
        value: 'id',
        label: 'name',
        children: 'authUnits'
      },
      unitHash: {} // 单位id和对象的map
    }
  },
  methods: {
    // 性别显示转换
    formatSex: function (row) {
      return row.sex === '男' ? '男' : row.sex === '女' ? '女' : '未知'
    },
    authorized_formatter (row) {
      return row.authorized === '1' ? '是' : '否'
    },
    unit_formatter (row) {
      return util.getFullPath(this.unitHash, row.unitParentIds, 'name', '-', row.unitName)
    },
    query () {
      this.page = 1
      this.getAuthUsers()
    },
    // 获取人员列表
    getAuthUsers () {
      let para = {
        page: this.page,
        size: this.pageSize,
        keyword: this.filters.name,
        authUnitId: this.filters.authUnit[this.filters.authUnit.length - 1]
      }
      this.listLoading = true
      getAuthUserListPage(para).then((res) => {
        this.total = res.data.total
        this.authUsers = res.data.list
        this.listLoading = false
        // NProgress.done()
      }).catch(err => {
        console.log(err)
        router.push({ path: '/login' })
      })
    },
    selsChange: function (sels) {
      this.sels = sels
    },
    pullData () {
      console.log('pullData')
    },
    // 授权窗口
    showUserAuthorizationForm (index, row) {
      this.userAuthorizationFormVisible = true
      this.selectAuthRow = row
      let authorized = row.authorized
      // 判断是否授权 已授权的用户 打开窗口时回显授权信息
      if (authorized === '1') {
        getAuthUserRole(row.uniqueId).then((res) => {
          this.userAuthorizationForm.roles = res.data
        })
      } else { // 未授权显示为空
        this.userAuthorizationForm.roles = []
      }
    },
    getUserRoleList () {
      authRoleSelectList().then((res) => {
        this.roleOptions = res.data
      })
    },
    authSubmit () {
      this.addLoading = true
      let para = Object.assign({}, this.userAuthorizationForm)
      para.uniqueId = this.selectAuthRow.uniqueId
      saveAuthUserRole(para).then((res) => {
        this.addLoading = false
        if (res.data.code === '0') {
          this.$refs['userAuthorizationForm'].resetFields()
          this.userAuthorizationFormVisible = false
          this.getAuthUsers()
        }
        this.$message({
          message: res.data.text,
          type: res.data.type
        })
      })
    },
    initAuthUnitOptions () {
      getAuthUnitList().then((res) => {
        this.unitHash = util.getTreeHashMap(res.data, 'id')
        this.authUnitOptions = util.toTree(res.data, 'id', 'parentId', 'authUnits')
      }).catch(err => {
        console.log(err)
      })
    }
  },
  mounted () {
    this.initAuthUnitOptions() // 一定要先初始化单位数据，后面列表展示时需要
    this.getAuthUsers()
    this.getUserRoleList()
  }
}
</script>

<style scoped>

</style>
