import service from './api'
export const authAttributeList = params => { return service.get(`/api/authAttribute/list`, { params: params }) }
export const saveAttribute = params => { return service.post(`/api/authAttribute`, params) }
export const updateAttribute = params => { return service.put(`/api/authAttribute`, params) }
export const deleteAttribute = url => { return service.delete(`/api/authAttribute/` + url) }
