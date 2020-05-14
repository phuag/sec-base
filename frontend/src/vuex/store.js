import Vue from 'vue'
import Vuex from 'vuex'
import VuexPersistence from 'vuex-persist'
import user from './modules/user'
import permission from './modules/permission'
import getters from './getters'
Vue.use(Vuex)

const vuexLocal = new VuexPersistence({
  storage: window.localStorage
})

export default new Vuex.Store({
  modules: {
    user,
    permission
  },
  getters,
  plugins: [vuexLocal.plugin]
})
