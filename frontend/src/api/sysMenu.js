import service from './api'

export const getMenus = params => { return service.get(`/api/sysMenu/list`, { params: params }) }

export const getMenuDetail = () => { return service.get(`/api/sysMenu/getMenuDetail`) }
