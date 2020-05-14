const getters = {
  user: state => state.user.sysUser,

  permissions: state => state.permission.permissions,
  permission_routers: state => state.permission.routers,
  addRouters: state => state.permission.addRouters
}
export default getters
