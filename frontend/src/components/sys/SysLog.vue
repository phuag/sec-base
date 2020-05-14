<template>
  <section>
    <!--工具条-->
    <el-col :span="24" class="toolbar" style="padding-bottom: 0px;">
      <el-form :inline="true" :model="filters">
         <div class="block">
            <span class="demonstration">开始时间:</span>
              <el-date-picker
                v-model="beginTime"
                type="date"
                placeholder="选择日期"
                :picker-options="pickerOptions0">
              </el-date-picker>
              &nbsp;&nbsp;
              <span class="demonstration">结束时间:</span>
              <el-date-picker
                v-model="finishTime"
                align="right"
                type="date"
                placeholder="选择日期"
                :picker-options="pickerOptions1">
              </el-date-picker>
        <el-form-item>
          <el-button type="primary" v-on:click="inquiregetAll">查询</el-button>
        </el-form-item>
        </div>
      </el-form>
    </el-col>

    <!--列表-->
    <el-table :data="syslogs" highlight-current-row v-loading="listLoading"  style="width: 100%;">
      <el-table-column type="index" label="序列" width="100">
      </el-table-column>
      <el-table-column prop="title" label="日志标题" width="300" sortable>
      </el-table-column>
      <el-table-column prop="remoteAddr" label="用户IP" width="200" sortable>
      </el-table-column>
      <el-table-column prop="requestUri" label="操作" width="250" sortable>
      </el-table-column>
      <el-table-column prop="method" label="操作方式" width="100" sortable>
      </el-table-column>
      <el-table-column prop="params" label="提交数据" width="400" sortable>
      </el-table-column>
      <el-table-column prop="createDate" label="操作时间" width="200" sortable>
      </el-table-column>
      <el-table-column prop="exception" label="异常信息" width="300" sortable>
      </el-table-column>
    </el-table>
    <el-col :span="24" class="toolbar">
      <el-pagination layout="prev, pager, next" @current-change="handleCurrentChange" :page-size="20" :total="total" :current-page.sync="page"  style="float:right;">
      </el-pagination>
    </el-col>

  </section>
</template>

<script>
import { getLogList } from '../../api/sysLog'
import router from '../../router'

export default {
  data () {
    return {
      pickerOptions1: {
        disabledDate (time) {
          return time.getTime() > Date.now()
        }
      },
      pickerOptions0: {
        disabledDate (time) {
          return time.getTime() > Date.now()
        }
      },
      beginTime: '',
      finishTime: '',
      filters: {
        name: ''
      },
      syslogs: [],
      total: 0,
      page: 1,
      listLoading: false,
      sels: [], // 列表选中列
      sort: 1
    }
  },
  methods: {
    // 刷新当前页为1
    handleCurrentChange (val) {
      this.page = val
      this.sort = 0
      this.getLog()
    },
    // 点击查询按钮
    inquiregetAll () {
      this.handleCurrentChange(1)
    },
    // 获取日志列表
    getLog () {
      let para = {
        page: this.page,
        beginTime: this.beginTime,
        finishTime: this.finishTime,
        sort: 1
      }
      this.listLoading = true
      getLogList(para).then((res) => {
        this.total = res.data.total
        this.syslogs = res.data.list
        this.listLoading = false
      }).catch(err => {
        console.log(err)
        router.push({ path: '/login' })
      })
    }
  },
  mounted () {
    this.getLog()
  }
}
</script>

<style scoped>

</style>
