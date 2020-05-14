import service from './api'
import * as base64 from '../common/js/base64'

// export const requestLogin = params => { return service.post(`/login`, params).then(res => res.data) }
export const requestLogin = params => {
  // httpHeaders.Authorization = 'Basic ' + base64.encode(params.username + ':' + params.password)
  service.defaults.headers.common['Authorization'] = 'Basic ' + base64.encode(params.username + ':' + params.password)
  return service.post(`/api/sysUser/me`).then(res => res.data)
}

export const requestLogout = () => {
  delete service.defaults.headers.common['Authorization']
  return service.post(`/api/sysUser/logout`)
}

export const getUserMenu = () => { return service.post(`/api/sysUser/myMenu`) }

export const getSysUserListPage = params => { return service.get(`/api/sysUser`, { params: params }) }

export const removeSysUser = params => { return service.delete(`/api/sysUser/` + params.id) }

export const batchRemoveSysUser = params => { return service.delete(`/api/sysUser/batchremove`, { params: params }) }

export const editSysUser = params => { return service.put(`/api/sysUser/` + params.id, params) }

export const addSysUser = params => { return service.post(`/api/sysUser/`, params) }

export const checkLoginName = params => { return service.get(`/api/sysUser/checkLoginName`, { params: params }) }

export const resetUserPwd = id => { return service.get(`/api/sysUser/resetUserPwd/` + id) }

export const modifyUserPwd = params => { return service.post(`/api/sysUser/modifyUserPwd`, params) }

export const getRoles = params => { return service.get(`/api/sysUser/getRoleAll`, { params: params }) }
