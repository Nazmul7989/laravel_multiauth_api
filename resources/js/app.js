
require('./bootstrap');

import Vue from 'vue'
import VueRouter from 'vue-router'
import {routes} from "./router/routes";


Vue.use(VueRouter)

const router = new VueRouter({
    routes: routes,

})

Vue.component('app-header', require('./components/partials/Header.vue').default);


const app = new Vue({
    el: '#app',
    router
});
