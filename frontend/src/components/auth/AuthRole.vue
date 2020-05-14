<template>
  <section>
    <!--工具条-->
    <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
      <el-form :inline="true">
        <el-form-item>
          <el-input v-model="keyword" placeholder="角色名称" suffix-icon="el-icon-search"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="query">查询</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="addOne">新增</el-button>
        </el-form-item>
      </el-form>
    </el-col>

    <el-table :data="user_role_list" highlight-current-row v-loading="listLoading" @selection-change="selsChange" style="width: 100%;">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column type="index" width="60">
      </el-table-column>
      <el-table-column prop="name" label="角色名称" min-width="200" sortable>
      </el-table-column>
      <!-- <el-table-column prop="createBy" label="创建者" min-width="200" sortable>
      </el-table-column> -->
      <el-table-column prop="createDate" label="创建时间" min-width="200" sortable>
      </el-table-column>
      <el-table-column prop="useable" label="状态" :formatter="format_useable" width="150" sortable>
      </el-table-column>
      <el-table-column label="操作" width="180">
        <template slot-scope="scope">
          <el-button type="primary" size="small" class="el-icon-edit" @click="editOne(scope.$index, scope.row)" title="编辑"></el-button>
          <el-button type="danger" size="small" class="el-icon-delete" @click="deleteOne(scope.$index, scope.row)" title="删除"></el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--工具条-->
     <el-col :span="24" class="toolbar">
      <el-pagination layout="prev, pager, next"  :current-page.sync="page" background @current-change="getAuthRoleList()" :page-size="pageSize" :total="total" style="float:right;">
      </el-pagination>
    </el-col>
  <!--新增窗口 -->
  <el-dialog title="新增" :visible.sync="addFormVisible" :close-on-click-modal="false">
    <el-form :model="addForm" label-width="120px" ref="addForm">
      <el-form-item label="角色名称：" required>
        <el-col :span="20">
            <el-input placeholder="角色名称" v-model="addForm.name" style="width: 100%;"></el-input>
        </el-col>
      </el-form-item>
      <el-form-item label="角色权限：" required>
         <el-col :span="20">
          <el-select v-model="addForm.permissions" multiple placeholder="请选择" filterable  style="width: 100%;">
            <el-option v-for="item in authPermissionOptions" :key="item.id" :label="item.name" :value="item.id" :disabled="item.disabled" >
            </el-option>
          </el-select>
         </el-col>
       </el-form-item>
      <el-form-item label="使用状态：" required>
        <el-radio-group v-model="addForm.useable">
          <el-radio class="radio" :label="1">正常</el-radio>
          <el-radio class="radio" :label="0">禁用</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="备注：">
        <el-col :span="20">
           <el-input type="textarea" :rows="2" v-model="addForm.remarks"  placeholder="请输入内容" ></el-input>
        </el-col>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="addFormVisible = false">取消</el-button>
      <el-button type="primary" @click="addSubmit">提交</el-button>
    </div>
  </el-dialog>
<!--编辑窗口 -->
  <el-dialog title="编辑" :visible.sync="editFormVisible" :close-on-click-modal="false">
      <el-form :model="addForm" label-width="120px" ref="editForm">
        <el-form-item label="角色名称：" required>
          <el-col :span="20">
            <el-form-item prop="name">
              <el-input placeholder="规则名称" v-model="editForm.name" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="角色权限：" required>
          <el-col :span="20">
            <el-select v-model="editForm.permissions" multiple placeholder="请选择" filterable  style="width: 100%;">
              <el-option v-for="item in authPermissionOptions" :key="item.id" :label="item.name" :value="item.id" :disabled="item.disabled" >
              </el-option>
            </el-select>
          </el-col>
        </el-form-item>
        <el-form-item label="使用状态：" required>
          <el-radio-group v-model="editForm.useable">
            <el-radio class="radio" :label="1">正常</el-radio>
            <el-radio class="radio" :label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注：">
          <el-col :span="20">
            <el-input type="textarea" :rows="2" v-model="editForm.remarks"  placeholder="请输入内容" ></el-input>
          </el-col>
        </el-form-item>
      </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click.native="editFormVisible = false">取消</el-button>
      <el-button type="primary" @click.native="editSubmit">提交</el-button>
    </div>
  </el-dialog>
  </section>
</template>

<script>
import { authRoleList, authRoleSave, authRoleUpdate, getPermissionsByRole, authRoleDelete } from '../../api/authRole'
import { authPermissionSelectList } from '../../api/authPermission'
// import router from '../../router'
export default {
  data () {
    return {
      user_role_list: [],
      keyword: '',
      page: 1,
      pageSize: 10,
      total: 0,
      sels: [], // 列表选中列
      listLoading: false,
      authPermissionOptions: [],
      // addForm
      addFormVisible: false,
      addForm: {
        name: '',
        permissions: [],
        useable: 1,
        remarks: ''
      },
      //
      editFormVisible: false,
      editForm: {
        id: '',
        name: '',
        permissions: [],
        useable: 1,
        remarks: ''
      }
    }
  },
  methods: {
    addOne () {
      this.addFormVisible = true
      this.addForm = {
        name: '',
        permissions: [],
        useable: 1,
        remarks: ''
      }
    },
    addSubmit () {
      this.$refs.addForm.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗？', '提示', {}).then(() => {
            this.addLoading = true
            let para = Object.assign({}, this.addForm)
            console.log(para)
            authRoleSave(para).then((res) => {
              this.addLoading = false
              // NProgress.done()
              console.log(res)
              if (res.data.code === '0') {
                this.$refs['addForm'].resetFields()
                this.addFormVisible = false
                this.getAuthRoleList()
              }
              this.$message({
                message: res.data.text,
                type: res.data.type
              })
            })
          })
        }
      })
    },
    editOne (index, row) {
      this.editFormVisible = true
      // this.editForm = Object.assign({}, row)
      console.log(row)
      this.editForm = {
        id: row.id,
        name: row.name,
        permissions: [],
        useable: parseInt(row.useable),
        remarks: row.remarks
      }
      // 查询当前角色拥有的 规则 用于回显
      getPermissionsByRole(row.id).then((res) => {
        this.editForm.permissions = res.data
      })
    },
    editSubmit () {
      this.$refs.editForm.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗？', '提示', {}).then(() => {
            this.addLoading = true
            let para = Object.assign({}, this.editForm)
            authRoleUpdate(para).then((res) => {
              this.addLoading = false
              // NProgress.done()
              console.log(res)
              if (res.data.code === '0') {
                this.editFormVisible = false
                this.getAuthRoleList()
              }
              this.$message({
                message: res.data.text,
                type: res.data.type
              })
            })
          })
        }
      })
    },
    deleteOne (index, row) {
      this.$confirm('确认删除？如果该角色已绑定用户和规则，将解除其绑定关系。', '提示', {}).then(() => {
        authRoleDelete(row.id).then(res => {
          this.$message({
            message: res.data.text,
            type: res.data.type
          })
          this.getAuthRoleList()
        }).catch(e => {
          console.log(e)
        })
      }).catch(() => {
        // this.$message({
        //   message: '已取消删除',
        //   type: 'info'
        // })
      })
    },
    format_useable (row, column) {
      return row.useable === '1' ? '正常' : '禁用'
    },
    selsChange (sels) {
      this.sels = sels
    },
    query () {
      this.page = 1
      this.getAuthRoleList()
    },
    getAuthRoleList () {
      let para = {
        page: this.page,
        size: this.pageSize,
        keyword: this.keyword
      }
      this.listLoading = true
      authRoleList(para).then((res) => {
        this.total = res.data.total
        this.user_role_list = res.data.list
        this.listLoading = false
      }).catch(err => {
        console.log(err)
        // router.push({ path: '/login' })
      })
    },
    getAuthPermissionSelectList () {
      authPermissionSelectList().then((res) => {
        this.authPermissionOptions = res.data
      })
    }
  },
  mounted () {
    this.getAuthRoleList()
    this.getAuthPermissionSelectList()
  }
}
</script>
