import service from '../api'

export const getRoleList = params => { return service.get(`/api/sysRole`, { params: params }) }

export const addRole = params => { return service.post(`/api/sysRole`, params) }

export const removeRole = params => { return service.delete(`/api/sysRole/` + params.id) }

export const batchRemoveRole = params => { return service.delete(`/api/sysRole/batchRemove`, { params: params }) }

export const editRole = params => { return service.put(`/api/sysRole/` + params.id, params) }

export const getrole = params => { return service.get(`/api/sysRole/getRoleid`, { params: params }) }
