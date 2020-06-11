import * as types from '../types'
import store from '../store'
import router from '../../router'
import { getUserMenu } from '../../api/sys/sysUser'
import Vue from 'vue'

const user = {
  state: {
    sysUser: '',
    token: '',
    title: ''
  },
  mutations: {
    [types.LOGIN]: (state, data) => {
      state.token = data.token
      state.sysUser = data.user
    },
    [types.LOGOUT]: (state) => {
      state.token = ''
      state.sysUser = ''
    },
    [types.TITLE]: (state, data) => {
      state.title = data
    }
  },
  actions: {
    Login ({ commit }, data) {
      commit(types.LOGIN, data)
    },
    GetInfo ({ commit }) {
      return new Promise((resolve, reject) => {
        getUserMenu().then(res => {
          let userPermission = res.data
          store.dispatch('GenerateRoutes', userPermission).then(() => {
            // 生成该用户的新路由json操作完毕之后,调用vue-router的动态新增路由方法,将新路由添加
            router.addRoutes(store.getters.addRouters)
            // localStorage.setItem('router', router)
            Vue.prototype.addRouterTag = true
            commit(types.TITLE,"info")
            resolve()
          })
        }).catch(error => {
          reject(error)
        })
      })
    },
    Logout ({ commit }) {
      commit(types.LOGOUT)
      store.dispatch('DeleteRoutes')
    }
  }
}
export default user
