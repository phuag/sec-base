import service from '../api'

export const getAuthUserListPage = params => { return service.get(`/api/authUser`, { params: params }) }

export const removeAuthUser = params => { return service.delete(`/api/authUser/` + params.id) }

export const batchRemoveAuthUser = params => { return service.delete(`/api/authUser/batchremove`, { params: params }) }

export const editAuthUser = params => { return service.put(`/api/authUser/` + params.id, params) }

export const addAuthUser = params => { return service.post(`/api/authUser/`, params) }

export const saveAuthUserRole = params => { return service.put(`/api/authUser/save/saveRole`, params) }

export const getAuthUserRole = dn => { return service.get(`/api/authUser/getRolesByDn/` + dn) }
