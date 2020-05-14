<template>
  <section>
    <!--工具条-->
    <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
      <el-form :inline="true">
        <el-form-item>
          <el-input v-model="keyword" placeholder="权限名称" suffix-icon = "el-icon-search"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="query">查询</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="addOne">新增</el-button>
        </el-form-item>
      </el-form>
    </el-col>

    <el-table :data="user_rule_list" highlight-current-row v-loading="listLoading" @selection-change="selsChange" style="width: 100%;">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column type="index" width="60">
      </el-table-column>
      <el-table-column prop="name" label="权限名称" width="200" sortable>
      </el-table-column>
      <!-- <el-table-column prop="createBy" label="创建者" min-width="200" sortable>
        </el-table-column> -->
      <el-table-column prop="createDate" label="创建时间" width="200" sortable>
      </el-table-column>
      <el-table-column prop="useable" label="状态" :formatter="format_useable" width="100" sortable>
      </el-table-column>
      <el-table-column prop="remarks" label="说明" min-width="200" sortable>
      </el-table-column>
      <el-table-column label="操作" width="180">
        <template slot-scope="scope">
          <el-button type="primary" size="small" class="el-icon-edit" @click="editOne(scope.$index, scope.row)" title="编辑"></el-button>
          <el-button type="danger" size="small"  class="el-icon-delete" @click="deleteOne(scope.$index, scope.row)" title="删除"></el-button>
        </template>
      </el-table-column>
    </el-table>
    <!--工具条-->
    <el-col :span="24" class="toolbar">
      <el-pagination layout="prev, pager, next" :current-page.sync="currentPage"  @current-change="getAuthPermissionList()" background :page-size="pageSize"  :total="total" style="float:right;">
      </el-pagination>
    </el-col>

    <!--新增界面-->

    <el-dialog title="新增" :visible.sync="addFormVisible" :close-on-click-modal="false">
      <el-form :model="addForm" label-width="120px" ref="addForm">
        <el-form-item label="权限名称：" required>
          <el-col :span="21">
            <el-form-item prop="name">
              <el-input placeholder="规则名称" v-model="addForm.name" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="允许入网：" required>
          <el-radio-group v-model="addForm.allowLogin">
            <el-radio class="radio" :label="1">是</el-radio>
            <el-radio class="radio" :label="0">否</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="准入地址：" v-if="addForm.allowLogin">
          <el-col :span="10">
            <el-form-item prop="addressBegin">
              <el-input placeholder="开始地址" v-model="addForm.addressBegin" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
          <el-col class="line textCenter" :span="1">-</el-col>
          <el-col :span="10">
            <el-form-item prop="addressEnd">
              <el-input placeholder="结束地址" v-model="addForm.addressEnd" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="使用状态：" required>
          <el-radio-group v-model="addForm.useable">
            <el-radio class="radio" :label="1">正常</el-radio>
            <el-radio class="radio" :label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="addFormVisible = false">取消</el-button>
        <el-button type="primary" @click.native="addSubmit">提交</el-button>
      </div>
    </el-dialog>

    <!--编辑界面-->

    <el-dialog title="编辑" :visible.sync="editFormVisible" :close-on-click-modal="false">
      <el-form :model="editForm" label-width="120px" ref="editForm">
        <el-form-item label="权限名称：" required>
          <el-col :span="21">
            <el-form-item prop="name">
              <el-input placeholder="规则名称" v-model="editForm.name" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="允许入网：" required>
          <el-radio-group v-model="editForm.allowLogin">
            <el-radio class="radio" :label="1">是</el-radio>
            <el-radio class="radio" :label="0">否</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="地址范围:" v-if="editForm.allowLogin">
          <el-col :span="10">
            <el-form-item prop="addressBegin">
              <el-input placeholder="开始地址" v-model="editForm.addressBegin" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
          <el-col class="line textCenter" :span="1">-</el-col>
          <el-col :span="10">
            <el-form-item prop="addressEnd">
              <el-input placeholder="结束地址" v-model="editForm.addressEnd" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="使用状态：" required>
          <el-radio-group v-model="editForm.useable">
            <el-radio class="radio" :label="1">正常</el-radio>
            <el-radio class="radio" :label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="editFormVisible = false">取消</el-button>
        <el-button type="primary" @click="editSubmit">提交</el-button>
      </div>
    </el-dialog>
  </section>
</template>

<script>
import { authPermissionList, authPermissionSave, authPermissionUpdate, authPermissionDelete } from '../../api/authPermission'
// import router from '../../router'
export default {
  data () {
    return {
      // 表格
      user_rule_list: [],
      keyword: '',
      pageSize: 10,
      currentPage: 1,
      total: 0,
      sels: [], // 列表选中列
      listLoading: false,
      // addForm
      addFormVisible: false,
      addForm: {
        name: '',
        allowLogin: 1,
        useable: 1,
        addressBegin: '',
        addressEnd: ''
      },
      // editForm
      editFormVisible: false,
      editForm: {
        id: '',
        name: '',
        allowLogin: '',
        useable: '',
        addressBegin: '',
        addressEnd: ''
      }
    }
  },
  methods: {
    addOne () {
      this.addFormVisible = true
      this.addForm = {
        name: '',
        allowLogin: 1,
        useable: 1,
        addressBegin: '',
        addressEnd: ''
      }
    },
    addSubmit () {
      this.$refs.addForm.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗？', '提示', {}).then(() => {
            this.addLoading = true
            let para = Object.assign({}, this.addForm)
            authPermissionSave(para).then((res) => {
              this.addLoading = false
              // NProgress.done()
              console.log(res)
              if (res.data.code === '0') {
                this.$refs['addForm'].resetFields()
                this.addFormVisible = false
                this.getAuthPermissionList()
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
      let allowLogin = row.allowLogin
      this.editForm = {
        id: row.id,
        name: row.name,
        allowLogin: allowLogin,
        useable: parseInt(row.useable)
      }
      if (allowLogin) {
        this.editForm.addressBegin = row.addressBegin
        this.editForm.addressEnd = row.addressEnd
      } else {
        this.editForm.addressBegin = ''
        this.editForm.addressEnd = ''
      }
    },
    editSubmit () {
      this.$refs.editForm.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗？', '提示', {}).then(() => {
            this.addLoading = true
            let para = Object.assign({}, this.editForm)
            authPermissionUpdate(para).then((res) => {
              console.log(res)
              this.addLoading = false
              if (res.data.code === '0') {
                this.editFormVisible = false
                this.getAuthPermissionList()
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
      this.$confirm('确认删除？如果该权限已绑定用户角色，将解除其绑定关系。', '提示', {
        type: 'warning'
      }).then(() => {
        authPermissionDelete(row.id).then((res) => {
          this.$message({
            message: res.data.text,
            type: res.data.type
          })
          this.getAuthPermissionList()
        }).catch(e => {
          console.log(e)
        })
      }).catch((e) => {
        console.log(e)
      })
    },
    format_useable (row, column) {
      return row.useable === '1' ? '正常' : '禁用'
    },
    query () {
      this.currentPage = 1
      this.getAuthPermissionList()
    },
    selsChange (sels) {
      this.sels = sels
    },
    getAuthPermissionList () {
      let para = {
        page: this.currentPage,
        size: this.pageSize,
        keyword: this.keyword
      }
      this.listLoading = true
      authPermissionList(para).then((res) => {
        this.total = res.data.total
        this.user_rule_list = res.data.list
        this.listLoading = false
      }).catch(err => {
        console.log('authPermissionList:' + err)
      })
    }
  },
  mounted () {
    this.getAuthPermissionList()
  }
}
</script>
<style scoped>
.textCenter {
  text-align: center
}
</style>
