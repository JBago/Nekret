import 'es6-promise/auto'
import axios from 'axios'
import 'bulma'
import '@/css/mystyles.css'
import "@mdi/font/css/materialdesignicons.css"
import Vue from 'vue'
import VueAuth from '@websanova/vue-auth'
import VueAxios from 'vue-axios'
import VueRouter from 'vue-router'
import Index from './views/App.vue'
import auth from './auth'
import router from './router'


window.Vue = Vue

// Set Vue router
Vue.router = router
Vue.use(VueRouter)


// Set Vue authentication
Vue.use(VueAxios, axios)
Vue.use(VueAuth, auth)

// Load Index
Vue.component('index', Index)

const app = new Vue({
  el: '#app',
  router
});
