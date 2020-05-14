import axios from 'axios'
import { Message } from 'element-ui'
import * as types from '../vuex/types'
import store from '../vuex/store'
import router from '../router'

// axios.defaults.timeout = 5000

// let wishBase = 'localhost:8086'
const service = axios.create({
  baseURL: '',
  // baseURL: process.env.BASE_API, // api的base_url
  timeout: 0 // 请求超时时间
})

service.interceptors.request.use(
  config => {
    if (store.state.user.token) {
      config.headers.Authorization = `Basic ${store.state.user.token}`
    }
    return config
  },
  err => {
    return Promise.reject(err)
  }
)

service.interceptors.response.use(
  response => {
    // if the response has a text and a type property, it is a message to be shown
    if (response.data.text && response.data.type && response.status !== 200) {
      Message({
        message: response.data.text,
        type: response.data.type,
        duration: 5 * 1000
      })
    }

    return response
  },
  error => {
    if (error.response) {
      switch (error.response.status) {
        case 401:
          store.commit(types.LOGOUT)
          router.push({ path: '/login' })
          break
        case 403:
          router.push({ path: '/login' })
          break
        case 404:
          router.push({ path: '/404' })
          break
        default:
          store.commit(types.LOGOUT)
          router.push({ path: '/login' })
      }
    } else {
      store.commit(types.LOGOUT)
      router.push({ path: '/login' })
    }
    return Promise.reject(error)
  }
)

export default service
