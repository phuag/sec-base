import service from '../api'

export const getOfficeList = params => { return service.get(`/api/sysOffice`, { params: params }) }
