<template>
  <section>
    <!--工具条-->
    <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
      <el-form :inline="true" :model="filters">
        <el-form-item>
          <el-input v-model="filters.name" placeholder="姓名" icon="search"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" v-on:click="querySysRoles">查询</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleAdd">新增</el-button>
        </el-form-item>
      </el-form>
    </el-col>

    <!--列表-->
    <el-table :data="roles" highlight-current-row v-loading="listLoading" @selection-change="selsChange" style="width: 100%;">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column type="index" width="60">
      </el-table-column>
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="拥有权限》">
              <div v-for="menu in formatMenus(props.row.menus)" :key="menu.name">
                <!-- {{menu.name}}：<menu-info :permList="menu.permissionList" ></menu-info> -->
                {{menu.name}}：{{menu.permissionList}}
              </div>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>
      <el-table-column prop="name" label="角色名称" label-width="100" sortable>
      </el-table-column>
      <el-table-column prop="createPerson" label="创建人" fit=false label-width="200" sortable>
      </el-table-column>
      <el-table-column prop="useable" label="状态" width="180" :formatter="format_useable" sortable>
      </el-table-column>
      <el-table-column label="操作" width="150">
        <template slot-scope="scope">
          <el-button size="small" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button type="danger" size="small" @click="handleDel(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--工具条-->
    <el-col :span="24" class="toolbar">
      <el-button type="danger" @click="batchRemove" :disabled="this.sels.length===0">批量删除</el-button>
      <el-pagination background layout="prev, pager, next" @current-change="getRoles" :page-size="size" :total="total" :current-page.sync="page" style="float:right;">
      </el-pagination>
    </el-col>

    <!--角色窗口-->
    <el-dialog :title="tempRole.title" :visible.sync="tempRoleVisible" :close-on-click-modal="false">
      <el-form :model="tempRole" label-width="160px" ref="tempRole">
        <el-form-item label="角色名称：" required>
          <el-col :span="20">
            <el-input v-model="tempRole.name" placeholder="请输入角色名称" auto-complete="off"></el-input>
          </el-col>
        </el-form-item>
        <el-form-item label="菜单&权限：" required>
          <el-col :span="24" v-for="(menu ,_index) in navMenuAndButtios" :key="menu.id">
            <el-col :span="8" style="width: 100px; display: inline-block; margin-top:8px;">
              <el-button :type="isMenuNone(_index) ? '' : (isMenuAll(_index) ? 'success' : 'primary' )" @click="checkAll(_index)">{{menu.name}}</el-button>
            </el-col>
            <el-col :span="16" style="display: inline-block; margin-left:20px;margin-top:8px;">
              <el-checkbox-group v-model="tempRole.permissions" size="medium">
                <el-checkbox-button v-for="btn in menu.buttons" :label="btn.id" :key="btn.id" @change="checkRequired(btn,_index)">{{btn.permission}}
                </el-checkbox-button>
              </el-checkbox-group>
            </el-col>
          </el-col>
          <p style="color:red;margin-top:10px;">说明：【查看】权限为对应菜单内的必选权限</p>
        </el-form-item>
        <el-form-item label="使用状态：" required>
          <el-col :span="20">
            <el-radio-group v-model="tempRole.useable">
              <el-radio class="radio" :label="1">正常</el-radio>
              <el-radio class="radio" :label="0">禁用</el-radio>
            </el-radio-group>
          </el-col>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="tempRoleVisible = false">取消</el-button>
        <el-button type="primary" @click.native="saveSubmit" :loading="addLoading">提交</el-button>
      </div>
    </el-dialog>
  </section>
</template>

<script>
// import NProgress from 'nprogress'
import { getRoleList, removeRole, batchRemoveRole, editRole, addRole } from '../../api/sysRole'
import { getMenuDetail } from '../../api/sysMenu'
import MenuInfo from './MenuInfo'
export default {
  components: { MenuInfo },
  data () {
    return {
      props: {
        value: 'id',
        label: 'name',
        children: 'offices'
      },
      radio: '',
      roles: [],
      options: [],
      filters: {
        name: ''
      },
      total: 0,
      page: 1,
      size: 20,
      listLoading: false,
      sels: [], // 列表选中列
      tempRoleVisible: false, // 新增界面是否显示
      addLoading: false,
      // tempRoleRules: {
      //   name: [
      //     { required: true, message: '请输入姓名', trigger: 'blur' },
      //     { min: 1, max: 5, message: '长度在1到5个字符', trigger: 'blur' }
      //   ],
      //   useable: [
      //     { required: true, message: '请输入姓名', trigger: 'blur' }
      //   ]
      // },
      // 新增界面数据
      tempRole: {
        title: '新增',
        name: '',
        useable: 1,
        permissions: []
      },
      navMenuAndButtios: []
    }
  },
  methods: {
    format_useable (row, column) {
      return row.useable === '1' ? '正常' : '禁用'
    },
    querySysRoles () {
      this.page = 1
      this.getRoles()
    },
    // 获取人员列表
    getRoles () {
      let para = {
        page: this.page,
        size: this.size,
        q: this.filters.name
      }
      this.listLoading = true
      // NProgress.start()
      getRoleList(para).then((res) => {
        this.total = res.data.total
        this.roles = res.data.list
        // this.menuname = res.menuname
        this.listLoading = false
        // NProgress.done()
      }).catch(err => {
        console.log(err)
        // router.push({ path: '/login' })
      })
    },
    formatMenus (menus) {
      let menuSet = new Set()
      let menuList = []
      // 将code放入menuSet集合中
      for (let i in menus) {
        menuSet.add(menus[i].name)
      }
      // 根据menuSet组成新的Map
      for (let item of menuSet) {
        let menuObj = {}
        let permissionList = []
        for (let j in menus) {
          let m = menus[j]
          if (m.name === item) {
            permissionList.push(m.permission)
          }
        }
        menuObj.name = item
        menuObj.permissionList = permissionList
        menuList.push(menuObj)
      }
      console.log('menuList：', menuList)
      return menuList
    },
    // 删除
    handleDel: function (index, row) {
      this.$confirm('确认删除该记录吗?', '提示', {
        type: 'warning'
      }).then(() => {
        this.listLoading = true
        // NProgress.start()
        let para = { id: row.id }
        removeRole(para).then((res) => {
          this.listLoading = false
          // NProgress.done()
          this.$message({
            message: '删除成功',
            type: 'success'
          })
          this.getRoles()
        })
      }).catch(() => {
        this.listLoading = false
      })
    },
    // 显示编辑界面
    handleEdit: function (index, row) {
      // 弹出框
      this.tempRoleVisible = true
      this.tempRole.id = row.id
      this.tempRole.title = '编辑'
      this.tempRole.name = row.name
      this.tempRole.useable = parseInt(row.useable)
      // 展开编辑界面时 先置为空 在赋值
      let permissions = this.tempRole.permissions = []
      for (let i in row.menus) {
        permissions.push(row.menus[i].id)
      }
    },
    // 显示新增界面
    handleAdd: function () {
      this.tempRoleVisible = true
      this.tempRole = {
        title: '新增',
        name: '',
        useable: 1,
        permissions: []
      }
    },
    checkAll (_index) {
      let me = this
      // 按钮选中
      if (me.isMenuAll(_index)) {
        // 如果全选，则全部取消
        me.noPerm(_index)
      } else {
        // 如果尚未全选，则全选
        me.allPerm(_index)
      }
    },
    // 全部选择
    allPerm (_index) {
      let buttons = this.navMenuAndButtios[_index].buttons
      let permissions = this.tempRole.permissions
      for (let i = 0; i < buttons.length; i++) {
        this.addUnique(buttons[i].id, permissions)
      }
    },
    // 全部取消
    noPerm (_index) {
      let buttons = this.navMenuAndButtios[_index].buttons
      for (let i = 0; i < buttons.length; i++) {
        let idIndex = this.tempRole.permissions.indexOf(buttons[i].id)
        if (idIndex > -1) {
          this.tempRole.permissions.splice(idIndex, 1)
        }
      }
    },
    isMenuNone (_index) {
      // 判断本级菜单内的权限是否一个都没选
      let buttons = this.navMenuAndButtios[_index].buttons
      let result = true
      for (let i in buttons) {
        if (this.tempRole.permissions.indexOf(buttons[i].id) > -1) {
          result = false
          break
        }
      }
      return result
    },
    isMenuAll (_index) {
      // 判断本级菜单内的权限是否全选
      let buttons = this.navMenuAndButtios[_index].buttons
      let permissions = this.tempRole.permissions
      let result = true
      for (let i in buttons) {
        if (permissions.indexOf(buttons[i].id) < 0) {
          result = false
          break
        }
      }
      return result
    },
    checkRequired (btn, _index) {
      let premId = btn.id
      if (this.tempRole.permissions.indexOf(premId) > -1) {
        // 选中事件
        this.makeRequiredPremissionChecked(_index)
      } else {
        // 取消选中
        if (btn.isRequired === '1') {
          this.noPerm(_index)
        }
      }
    },
    makeRequiredPremissionChecked (_index) {
      let buttons = this.navMenuAndButtios[_index].buttons
      for (let i = 0; i < buttons.length; i++) {
        let btn = buttons[i]
        if (btn.isRequired === '1') {
          this.addUnique(btn.id, this.tempRole.permissions)
        }
      }
    },
    addUnique (val, arr) {
      let _index = arr.indexOf(val)
      if (_index < 0) {
        arr.push(val)
      }
    },
    // 保存提交
    saveSubmit: function () {
      this.$refs.tempRole.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗？', '提示', {}).then(() => {
            this.tempRoleLoading = true
            let para = Object.assign({}, this.tempRole)
            if (para.id) { // 更新
              this.editSubmit(para)
            } else { // 新增
              this.addSubmit(para)
            }
          })
        }
      })
    },
    reseyTempRole: function () {
      this.tempRoleLoading = false
      this.$message({
        message: '提交成功',
        type: 'success'
      })
      this.$refs['tempRole'].resetFields()
      this.tempRoleVisible = false
      this.getRoles()
    },
    // 新增
    addSubmit: function (para) {
      addRole(para).then((res) => {
        this.reseyTempRole()
      })
    },
    // 编辑
    editSubmit: function (para) {
      editRole(para).then((res) => {
        this.reseyTempRole()
      })
    },
    selsChange: function (sels) {
      this.sels = sels
    },
    // 批量删除
    batchRemove: function () {
      var ids = this.sels.map(item => item.id).toString()
      this.$confirm('确认删除选中记录吗？', '提示', {
        type: 'warning'
      }).then(() => {
        this.listLoading = true
        let para = { ids: ids }
        batchRemoveRole(para).then((res) => {
          this.listLoading = false
          this.$message({
            message: '删除成功',
            type: 'success'
          })
          this.getRoles()
        })
      }).catch(() => {

      })
    }
  },
  mounted () {
    this.getRoles()
    getMenuDetail().then(res => {
      this.navMenuAndButtios = res.data
      console.log('navMenuAndButtios：', this.navMenuAndButtios)
    })
  }
}
</script>

<style scoped>
.demo-table-expand {
  font-size: 0;
}

.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}

.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 100%;
}
</style>
