import service from '../api'
// import * as base64 from '../common/js/base64'

// export const requestLogin = params => { return service.post(`/login`, params).then(res => res.data) }
export const requestLogin = params => {
  return service.post(`/admin/api/sysUser/signin`, params).then(res => res.data)
}

export const requestLogout = () => {
  delete service.defaults.headers.common['Authorization']
  return service.post(`/admin/api/sysUser/logout`)
}

export const getUserMenu = () => { return service.post(`/admin/api/sysUser/myMenu`) }

export const getSysUserListPage = params => { return service.get(`/admin/api/sysUser`, { params: params }) }

export const removeSysUser = params => { return service.delete(`/admin/api/sysUser/` + params.id) }

export const batchRemoveSysUser = params => { return service.delete(`/admin/api/sysUser/batchremove`, { params: params }) }

export const editSysUser = params => { return service.put(`/admin/api/sysUser/` + params.id, params) }

export const addSysUser = params => { return service.post(`/admin/api/sysUser/`, params) }

export const checkLoginName = params => { return service.get(`/admin/api/sysUser/checkLoginName`, { params: params }) }

export const resetUserPwd = id => { return service.get(`/admin/api/sysUser/resetUserPwd/` + id) }

export const modifyUserPwd = params => { return service.post(`/admin/api/sysUser/modifyUserPwd`, params) }

export const getRoles = params => { return service.get(`/admin/api/sysUser/getRoleAll`, { params: params }) }
