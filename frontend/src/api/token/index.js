import service from '../api'
// import * as base64 from '../common/js/base64'

// export const requestLogin = params => { return service.post(`/login`, params).then(res => res.data) }
export const requestLogin = params => {
  return service.post(`/token/form`, params).then(res => res.data)
}

export const requestLogout = () => {
  delete service.defaults.headers.common['Authorization']
  return service.delete(`/token/logout`)
}

export const authorize = params => service.post(`/oauth/authorize`, params)