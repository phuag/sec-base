import Vue from 'vue'
import Router from 'vue-router'
import store from '../vuex/store'

import Home from '@/components/Home.vue'

Vue.use(Router)

export const constantRouterMap = [
  {
    path: '/login',
    component: () => import('@/components/Login.vue'),
    name: '',
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/components/404.vue'),
    name: '',
    hidden: true
  },
  {
    path: '/',
    component: Home,
    redirect: '/main',
    name: '首页',
    hidden: true,
    children: [
      { path: 'main', component: () => import('@/components/Main.vue'), name: '个人设置' }
    ]
  }
]

export const asyncRouterMap = [
  {
    path: '/sys',
    component: Home,
    redirect: '/sys/sysUser',
    name: '系统管理',
    iconCls: 'el-icon-message', // 图标样式class
    children: [
      { path: 'sysUser', component: () => import('@/components/sys/SysUser.vue'), name: '系统管理员', menu: 'sysUser' },
      { path: 'sysRole', component: () => import('@/components/sys/SysRole.vue'), name: '系统角色', menu: 'sysRole' },
      { path: 'sysBackup', component: () => import('@/components/sys/SysBackup.vue'), name: '系统备份', menu: 'sysBackup' },
      { path: 'sysLog', component: () => import('@/components/sys/SysLog.vue'), name: '系统日志', menu: 'sysLog' }
    ]
  },
  {
    path: '/auth',
    component: Home,
    name: '用户授权',
    iconCls: 'el-icon-message', // 图标样式class
    children: [
      { path: 'staff', component: () => import('@/components/auth/AuthUser.vue'), name: '用户列表', menu: 'authUser' },
      { path: 'userRole', component: () => import('@/components/auth/AuthRole.vue'), name: '用户角色', menu: 'authRole' },
      { path: 'userRule', component: () => import('@/components/auth/AuthPermission.vue'), name: '用户权限', menu: 'authPermission' }
    ]
  },
  {
    path: '*',
    hidden: true,
    redirect: { path: '/404' }
  }
]

let routesOpenToPublic = ['/login', '/404']

const router = new Router({
  // mode: 'history', // 后端支持可开
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})

router.beforeEach((to, from, next) => {
  let access_token = store.getters.access_token
  if (access_token && access_token !== '') {
    if (to.path === '/login') {
      next({ path: '/' }) // 有session 想跳到login，转到主页
    } else if (Vue.prototype.addRouterTag === false) {
      store.dispatch('GetUserInfo').then(() => {
        next({ ...to })
      })
    } else { // 有session 想跳到非login的页面，正常跳转
      next()
    }
  } else {
    Vue.prototype.addRouterTag = false
    if (routesOpenToPublic.indexOf(to.path) !== -1) {
      next() // 无session 想跳到公开页面，正常跳转
    } else {
      next('/login') // 无session 想跳到非公开页面，转到登录
    }
  }
})

export default router
