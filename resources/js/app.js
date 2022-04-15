require('./bootstrap');

import Vue from 'vue'
import VueRouter from 'vue-router'
import {routes} from "./router/routes";
import {store} from "./store/store";
import Swal from 'sweetalert2';
import 'sweetalert2/src/sweetalert2.scss';

//sweet alert
const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
})
window.Toast = Toast



Vue.use(VueRouter)

const router = new VueRouter({
    routes: routes,
    scrollBehavior(){
        return{
            x: 0,
            y: 0

        }
    },

})

Vue.component('app-header', require('./components/partials/Header.vue').default);


const app = new Vue({
    el: '#app',
    router,
    store
});
