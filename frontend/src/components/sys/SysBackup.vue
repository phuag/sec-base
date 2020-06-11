<template>
  <section>
    <!--工具条-->
    <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
      <el-form :inline="true">
        <el-form-item>
          <el-input v-model="keyword" placeholder="备份名称" suffix-icon="search"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="query">查询</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="backupOne">备份</el-button>
        </el-form-item>
         <el-form-item>
          <el-button type="primary" >恢复</el-button>
        </el-form-item>
      </el-form>
    </el-col>
    <!--列表-->
    <el-table :data="backupDetails" highlight-current-row v-loading="listLoading" @selection-change="selsChange" style="width: 100%;">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column type="index" width="60">
      </el-table-column>
      <el-table-column prop="fileName" label="文件名称" min-width="80" sortable>
      </el-table-column>
       <el-table-column prop="fileSize" label="文件大小" min-width="80" sortable>
      </el-table-column>
      <el-table-column prop="createDate" label="备份时间" min-width="120" sortable >
      </el-table-column>
      <el-table-column prop="createBy" label="备份人" min-width="120" sortable>
      </el-table-column>
      <el-table-column prop="remarks" label="备注" min-width="120">
      </el-table-column>
      <el-table-column label="操作" width="200">
        <template slot-scope="scope">
          <el-button type="danger"  size="small"   @click="deleteOne(scope.$index, scope.row)">删除</el-button>
          <el-button type="warning"  size="small" title="删除"  @click="recoverOne(scope.$index, scope.row)">恢复</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--工具条-->
    <el-col :span="24" class="toolbar">
      <el-pagination layout="prev, pager, next" background  :current-page.sync="page" @current-change="getSysBackupDetails()" :page-size="pageSize" :total="total" style="float:right;">
      </el-pagination>
    </el-col>

     <!--新增界面-->
    <el-dialog title="备份" :visible.sync="backupFormVisible" :close-on-click-modal="false">
      <el-form :model="backupForm" label-width="120px" ref="backupForm">
        <el-form-item label="文件名称：">
          <el-col :span="20">
            <el-form-item prop="fileName">
              <el-input placeholder="名称为非必填项，若不填写，将按备份时间自动生成" v-model="backupForm.fileName" style="width: 100%;"></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="备注：">
          <el-col :span="20">
            <el-input type="textarea" :rows="2" v-model="backupForm.remarks"  placeholder="请输入内容" ></el-input>
          </el-col>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="backupFormVisible = false">取消</el-button>
        <el-button type="primary" @click.native="backupSubmit" >提交</el-button>
      </div>
    </el-dialog>
 </section>
</template>

<script>
import { getSysBackupList, backup, deleteBackup, recover } from '../../api/sys/sysBackup'
import router from '../../router'
export default {
  data () {
    return {
      total: 0,
      page: 1,
      pageSize: 10,
      listLoading: false,
      backupLoading: false,
      loadingText: '备份中。。。',
      sels: [], // 列表选中列
      keyword: '',
      backupDetails: [],
      backupForm: {
        fileName: '',
        remarks: ''
      },
      backupFormVisible: false,
      fullscreenLoading: false
    }
  },
  methods: {
    selsChange: function (sels) {
      this.sels = sels
    },
    query () { // 查询
      this.page = 1
      this.getSysBackupDetails()
    },
    showBackupWin () { // 备份
      this.backupFormVisible = true
      this.backupForm = {
        fileName: '',
        remarks: ''
      }
    },
    backupSubmit () {
      this.$refs.backupForm.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗？', '提示', {}).then(() => {
            this.backupLoading = true
            this.loadingText = '备份中。。。'
            let para = Object.assign({}, this.backupForm)
            this.backupFormVisible = false
            backup(para).then((res) => {
              if (res.data.code === '0') {
                this.$refs['backupForm'].resetFields()
                this.getSysBackupDetails()
              }
              this.$message({
                message: res.data.text,
                type: res.data.type
              })
              this.backupLoading = false
            })
          })
        }
      })
    },
    // 获取列表
    getSysBackupDetails () {
      let para = {
        page: this.page,
        size: this.pageSize,
        keyword: this.keyword
      }
      this.listLoading = true
      getSysBackupList(para).then((res) => {
        this.total = res.data.total
        this.backupDetails = res.data.list
        this.listLoading = false
      }).catch(err => {
        console.log(err)
        router.push({ path: '/login' })
      })
    },
    deleteOne (index, row) {
      this.$confirm('确认删除？', '提示', {
        type: 'warning'
      }).then(() => {
        deleteBackup(row.id).then((res) => {
          this.$message({
            message: res.data.text,
            type: res.data.type
          })
          this.getSysBackupDetails()
        }).catch(e => {
          console.log(e)
        })
      }).catch((e) => {
        console.log(e)
      })
    },
    recoverOne (index, row) {
      this.$confirm('确认恢复到当前备份？', '提示', {
        type: 'warning'
      }).then(() => {
        this.backupLoading = true
        this.loadingText = '恢复中。。。'
        recover(row.id).then((res) => {
          this.$message({
            message: res.data.text,
            type: res.data.type
          })
          this.getSysBackupDetails()
          this.backupLoading = false
        })
      })
    }
  },
  mounted () {
    this.getSysBackupDetails()
  }
}
</script>
