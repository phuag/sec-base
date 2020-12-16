import service from '../api'
// import * as base64 from '../common/js/base64'

// export const requestLogin = params => { return service.post(`/login`, params).then(res => res.data) }
export const requestLogin = data => {
  let config = {
    url: '/auth/oauth/token',
    headers: {
      'isToken': false,
      'Authorization': 'Basic cGlnOnBpZw=='
    },
    method: 'post',
    params: data
  }
  return service.request(config)
}

export const requestLogout = () => {
  delete service.defaults.headers.common['Authorization']
  return service.delete(`/auth/token/logout`)
}

export const getUserInfo = () => service.post(`/admin/api/sysUser/me`)


export const authorize = params => service.post(`/oauth/authorize`, params)