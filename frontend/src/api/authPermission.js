import service from './api'

export const authPermissionList = params => { return service.get(`/api/authPermission/list`, { params: params }) }

export const authPermissionSelectList = () => { return service.get(`/api/authPermission/list/selectList`) }

export const authPermissionSave = params => { return service.post(`/api/authPermission/save`, params) }

export const authPermissionUpdate = params => { return service.put(`/api/authPermission`, params) }

export const authPermissionDelete = id => { return service.delete(`/api/authPermission/` + id) }
