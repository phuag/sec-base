<template>
  <section>
  <el-tabs v-model="activeName">
  <el-tab-pane label=" 个人信息" name="profile">
    <el-form :model="profileForm" label-width="100px" ref="profileForm">
      <el-form-item label="所在部门" prop="officeIds">
        <el-cascader clearable change-on-select v-model="profileForm.officeIds" :options="officeOptions" :props="props" :disabled="true" placeholder="所在部门">
        </el-cascader>
      </el-form-item>
      <el-form-item label="登录名" prop="loginName">
        <el-input v-model="profileForm.loginName" auto-complete="off" :disabled="true"></el-input>
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input v-model="profileForm.name" auto-complete="off" :disabled="true"></el-input>
      </el-form-item>
      <el-form-item label="性别">
        <el-radio-group v-model="profileForm.sex">
          <el-radio class="radio" label="男">男</el-radio>
          <el-radio class="radio" label="女">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="生日">
        <el-date-picker type="date" placeholder="选择日期" v-model="profileForm.birth"></el-date-picker>
      </el-form-item>
      <el-form-item label="创建时间">
        <el-input v-model="profileForm.createDate" :formatter="formatDate" :disabled="true">
        </el-input>
      </el-form-item>
      <el-form-item label="上次登陆:">
        <label class="lbl">IP: {{profileForm.loginIp}}&nbsp;&nbsp;&nbsp;&nbsp;时间：{{ formatDate(profileForm.loginDate)}}</label>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click.native="profileSubmit" :loading="profileLoading">保存</el-button>
      </el-form-item>
    </el-form>
  </el-tab-pane>
  <el-tab-pane label="修改密码" name="modifyPassword">修改密码
    <el-form :model="modifyPasswordForm" :rules="modifyPasswordFormRules" label-width="100px" ref="modifyPasswordForm">
      <el-form-item label="旧密码" prop="oldPassword">
        <el-input type="password" v-model="modifyPasswordForm.oldPassword"></el-input>
      </el-form-item>
      <el-form-item label="新密码" prop="newPassword">
        <el-input type="password" v-model="modifyPasswordForm.newPassword"></el-input>
      </el-form-item>
      <el-form-item label="确认新密码" prop="confirmNewPassword">
        <el-input type="password" v-model="modifyPasswordForm.confirmNewPassword"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click.native="modifyPasswordSubmit" :loading="modifyPasswordLoading">保存</el-button>
        <el-button @click="resetForm('modifyPasswordForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </el-tab-pane>
  </el-tabs>
  </section>
</template>

<script>
import util from '../common/js/util'
import store from '../vuex/store'
import { editSysUser, modifyUserPwd } from '../api/sysUser'
import { getOfficeList } from '../api/sysOffice'
export default {
  data () {
    var validateConfirmNewPassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请再次输入密码'))
      } else if (value !== this.modifyPasswordForm.newPassword) {
        callback(new Error('两次输入密码不一致!'))
      } else if (value === this.modifyPasswordForm.oldPassword) {
        callback(new Error('新密码不能与原密码一致!'))
      } else {
        callback()
      }
    }
    return {
      activeName: 'profile',
      officeOptions: [],
      props: {
        value: 'id',
        label: 'name',
        children: 'offices'
      },
      profileLoading: false,
      profileForm: {
        id: 0,
        loginName: '',
        name: '',
        sex: -1,
        birth: '',
        officeIds: [],
        createDate: '',
        loginIp: '',
        loginDate: ''
      },
      modifyPasswordLoading: false,
      modifyPasswordForm: {
        oldPassword: '',
        newPassword: '',
        confirmNewPassword: ''
      },
      modifyPasswordFormRules: {
        oldPassword: [
          { required: true, message: '请输入原密码', trigger: 'blur' }
        ],
        newPassword: [
          { required: true, message: '请输入新密码', trigger: 'blur' }
        ],
        confirmNewPassword: [
          { validator: validateConfirmNewPassword, trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    formatDate: function (val) {
      return util.formatDate.format(new Date(val), 'yyyy-MM-dd hh:mm:ss')
    },
    initOfficeOptions () {
      // let para = {
      //   officeId: 0
      // }
      getOfficeList().then((res) => {
        this.officeOptions = util.toTree(res.data, 'id', 'parentId', 'offices')
      }).catch(err => {
        console.log(err)
      })
    },
    profileSubmit: function () {
      this.$refs.profileForm.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗？', '提示', {}).then(() => {
            this.profileLoading = true
            let para = Object.assign({}, this.profileForm)
            para.birth = (!para.birth || para.birth === '') ? '' : util.formatDate.format(new Date(para.birth), 'yyyy-MM-dd')
            para.officeId = para.officeIds.pop()
            editSysUser(para).then((res) => {
              this.profileLoading = false
              this.$message({
                message: '提交成功',
                type: 'success'
              })
            })
          })
        }
      })
    },
    modifyPasswordSubmit: function () {
      this.$refs.modifyPasswordForm.validate((valid) => {
        if (valid) {
          this.$confirm('确认提交吗?', '提示', {}).then(() => {
            this.modifyPasswordLoading = true
            let para = Object.assign({}, this.modifyPasswordForm)
            modifyUserPwd(para).then((res) => {
              this.modifyPasswordLoading = false
              this.$message({
                message: '提交成功',
                type: 'success'
              })
            })
          })
        }
      })
    },
    resetForm: function (formName) {
      this.$refs[formName].resetFields()
    }
  },
  mounted () {
    this.initOfficeOptions()
    this.profileForm = store.getters.user
    this.profileForm.officeIds = this.profileForm.office.parentIds.split(',')
    this.profileForm.officeIds.push(this.profileForm.office.id)
  }
}
</script>

<style scoped>
.el-tab-pane {
  max-width: 500px;
}
</style>
