import service from '../api'

export const getSysBackupList = params => { return service.get(`/api/sysBackup`, { params: params }) }

export const backup = params => { return service.post(`/api/sysBackup`, params) }

export const deleteBackup = id => { return service.delete(`/api/sysBackup/` + id) }

export const recover = id => { return service.post(`/api/sysBackup/` + id) }
