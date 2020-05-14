import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './vuex/store'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import 'font-awesome/css/font-awesome.min.css'
import { hasPermission } from './common/js/hasPermission'

Vue.use(ElementUI)
Vue.config.productionTip = false
// 全局的常量
Vue.prototype.hasPerm = hasPermission
Vue.prototype.addRouterTag = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
