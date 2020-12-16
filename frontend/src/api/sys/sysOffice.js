import service from '../api'

export const getOfficeList = params => { return service.get(`/admin/api/sysOffice`, { params: params }) }
