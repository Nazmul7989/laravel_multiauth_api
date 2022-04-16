import Home from "../components/Home";
import Login from "../components/auth/Login";
import AdminLogin from "../components/auth/AdminLogin";
import AdminDashboard from "../components/admin/AdminDashboard";
import CustomerIndex from "../components/admin/customer/CustomerIndex";
import BillIndex from "../components/admin/bill/BillIndex";
import CustomerDashboard
    from "../components/customer/dashboard/CustomerDashboard";
import {store} from "../store/store";

export const routes = [
    {
        path: '/',
        component: Home,
        name: 'home'
    },
    {
        path: '/login',
        component: Login,
        name: 'login',
        beforeEnter: (to,from,next) => {
            if(store.state.customerAuthentication === true){
                return next({
                    name: 'customerDashboard'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/customer/dashboard',
        component: CustomerDashboard,
        name: 'customerDashboard',
        beforeEnter: (to,from,next) => {
            if(store.state.customerAuthentication === false || store.state.customerAuthentication == null){
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/admin/login',
        component: AdminLogin,
        name: 'adminLogin',
        beforeEnter: (to,from,next) => {
            if(store.state.adminAuthentication === true){
                return next({
                    name: 'adminDashboard'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/admin/dashboard',
        component: AdminDashboard,
        name: 'adminDashboard',
        beforeEnter: (to,from,next) => {
            if(store.state.adminAuthentication === false || store.state.adminAuthentication == null){
                return next({
                    name: 'adminLogin'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/customer/index',
        component: CustomerIndex,
        name: 'customer',
        beforeEnter: (to,from,next) => {
            if(store.state.adminAuthentication === false || store.state.adminAuthentication == null){
                return next({
                    name: 'adminLogin'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/bill/index',
        component: BillIndex,
        name: 'bill',
        beforeEnter: (to,from,next) => {
            if(store.state.adminAuthentication === false || store.state.adminAuthentication == null){
                return next({
                    name: 'adminLogin'
                })
            }else {
                next()
            }
        }
    },

]
