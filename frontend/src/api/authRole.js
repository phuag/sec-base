import service from './api'

export const authRoleList = params => { return service.get(`/api/authRole/list`, { params: params }) }

export const authRoleSave = params => { return service.post(`/api/authRole`, params) }

export const authRoleUpdate = params => { return service.put(`/api/authRole`, params) }

export const authRoleDelete = id => { return service.delete(`/api/authRole/` + id) }

export const authRoleSelectList = () => { return service.get(`/api/authRole/list/selectList`) }

export const getPermissionsByRole = roleId => { return service.get(`/api/authRole/getPermissionsByRole/` + roleId) }
