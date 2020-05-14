import { asyncRouterMap, constantRouterMap } from '@/router/index'
import * as types from '../types'
import util from '../../common/js/util'

/**
 * 判断用户是否拥有此菜单
 * @param menus 用户拥有的菜单代码
 * @param route 前台的菜单项
 */
function hasPermission (menus, route) {
  if (route.menu) {
    /*
    * 如果这个路由有menu属性,就需要判断用户是否拥有此menu权限
    */
    return menus.indexOf(route.menu) > -1
  } else {
    return true
  }
}

/**
 * 递归过滤异步路由表，返回符合用户菜单权限的路由表
 * @param routerMap
 * @param menus
 */
function filterAsyncRouter (routerMap, menus) {
  const accessedRouters = routerMap.filter(route => {
    let menuCode = Array.from(menus, value => value.code)
    // filter,js语法里数组的过滤筛选方法
    if (hasPermission(menuCode, route)) {
      if (route.children && route.children.length) {
        // 如果这个路由下面还有下一级的话,就递归调用
        route.children = filterAsyncRouter(route.children, menus)
        // 如果过滤一圈后,没有子元素了,这个父级菜单就也不显示了
        return (route.children && route.children.length)
      }
      return true
    }
    return false
  })
  return accessedRouters
}

const permission = {
  state: {
    permissions: [], // 本用户的permissionCode权限操作码
    routers: constantRouterMap, // 本用户所有的路由,包括了固定的路由和下面的addRouters
    addRouters: [] // 本用户的角色赋予的新增的动态路由
  },
  mutations: {
    [types.SET_PERMISSION]: (state, data) => {
      state.permissions = data.permissions
      state.addRouters = data.routers
      state.routers = constantRouterMap.concat(data.routers) // 将固定路由和新增路由进行合并, 成为本用户最终的全部路由信息
      // console.log('routes:', state.routers)
    },
    [types.DEL_PERMISSION]: (state) => {
      state.permissions = []
      state.routers = constantRouterMap
      state.addRouters = []
    }
  },
  actions: {
    GenerateRoutes ({ commit }, userPermission) {
      // 生成路由
      return new Promise(resolve => {
        // roles是后台传过来的角色数组,比如['管理员','文章']
        // const role = userPermission.roleName
        // const menus = userPermission.menuList
        const menus = userPermission
        // 声明 该角色可用的路由
        const asMap = util.clone(asyncRouterMap)
        let accessedRouters = filterAsyncRouter(asMap, menus)
        // if (role === '管理员') {
        //   // 如果角色里包含'管理员',那么所有的路由都可以用
        //   // 其实管理员也拥有全部菜单,这里主要是利用角色判断,节省加载时间
        //   accessedRouters = asyncRouterMap
        // } else {
        //   // 否则需要通过以下方法来筛选出本角色可用的路由
        //   accessedRouters = filterAsyncRouter(asyncRouterMap, menus)
        // }
        // 执行设置路由的方法
        let permissions = Array.from(menus, value => value.permissionCode)
        commit(types.SET_PERMISSION, { routers: accessedRouters, permissions: permissions })
        resolve()
      })
    },
    DeleteRoutes ({ commit }) {
      commit(types.DEL_PERMISSION)
    }
  }
}
export default permission
