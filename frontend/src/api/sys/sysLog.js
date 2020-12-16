import service from '../api'

export const getLogList = params => { return service.get(`/admin/api/sysLog/list`, { params: params }) }
