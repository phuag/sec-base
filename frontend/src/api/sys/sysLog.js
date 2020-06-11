import service from '../api'

export const getLogList = params => { return service.get(`/api/sysLog/list`, { params: params }) }
