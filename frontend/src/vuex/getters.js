const getters = {
  user: state => state.user.sysUser,
  access_token: state => state.user.access_token,

  permissions: state => state.permission.permissions,
  permission_routers: state => state.permission.routers,
  addRouters: state => state.permission.addRouters
}
export default getters
