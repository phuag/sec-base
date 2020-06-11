import service from '../api'

export const getAuthUnitList = params => { return service.get(`/api/authUnit`, { params: params }) }
