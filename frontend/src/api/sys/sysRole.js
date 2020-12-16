import service from '../api'

export const getRoleList = params => { return service.get(`/admin/api/sysRole`, { params: params }) }

export const addRole = params => { return service.post(`/admin/api/sysRole`, params) }

export const removeRole = params => { return service.delete(`/admin/api/sysRole/` + params.id) }

export const batchRemoveRole = params => { return service.delete(`/admin/api/sysRole/batchRemove`, { params: params }) }

export const editRole = params => { return service.put(`/admin/api/sysRole/` + params.id, params) }

export const getrole = params => { return service.get(`/admin/api/sysRole/getRoleid`, { params: params }) }
