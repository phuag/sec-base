import service from './api'

export const getAreas = params => { return service.get(`/api/sysarea/list`, { params: params }) }

export const getareaid = params => { return service.get(`/api/sysarea/getareaid`, { params: params }) }
