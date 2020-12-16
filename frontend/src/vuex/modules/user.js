import * as types from '../types'
import store from '../store'
import router from '../../router'
import { getUserInfo } from '@/api/token/login'
import Vue from 'vue'

const user = {
  state: {
    sysUser: '',
    access_token: '',
    refresh_token: '',
    expires_in: '',
    title: ''
  },
  mutations: {
    [types.LOGIN]: (state, data) => {
      state.access_token = data.access_token
      state.refresh_token =  data.refresh_token
      state.expires_in = data.expires_in
    },
    [types.SET_USER_INFO]: (state, data) => {
      state.sysUser = data
    },
    [types.LOGOUT]: (state) => {
      state.sysUser = ''
      state.access_token = ''
      state.refresh_token =  ''
      state.expires_in = ''
    },
    [types.TITLE]: (state, data) => {
      state.title = data
    }
  },
  actions: {
    Login ({ commit }, data) {
      commit(types.LOGIN, data)
    },
    GetUserInfo ({ commit }) {
      return new Promise((resolve, reject) => {
        getUserInfo().then(response => {
          let data = response.data
          commit(types.SET_USER_INFO, data)
          let userPermission = data.permissions
          store.dispatch('GenerateRoutes', userPermission).then(() => {
            // 生成该用户的新路由json操作完毕之后,调用vue-router的动态新增路由方法,将新路由添加
            router.addRoutes(store.getters.addRouters)
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
