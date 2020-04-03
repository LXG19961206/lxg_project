// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
console.log(axios)
import Mint from 'mint-ui'
import 'mint-ui/lib/style.css'
Vue.use(Mint)
axios.defaults.baseURL='http://127.0.0.1:4000/';
//配置session
axios.defaults.withCredentials=true;
//注册 
Vue.prototype.axios=axios




/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

