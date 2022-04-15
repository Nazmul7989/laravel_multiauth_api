import Home from "../components/Home";
import Login from "../components/auth/Login";
import AdminLogin from "../components/auth/AdminLogin";
import AdminDashboard from "../components/admin/AdminDashboard";
import CustomerIndex from "../components/admin/customer/CustomerIndex";
import BillIndex from "../components/admin/bill/BillIndex";
import CustomerDashboard
    from "../components/customer/dashboard/CustomerDashboard";

export const routes = [
    {
        path: '/',
        component: Home,
        name: 'home'
    },
    {
        path: '/login',
        component: Login,
        name: 'login'
    },
    {
        path: '/admin/login',
        component: AdminLogin,
        name: 'adminLogin'
    },
    {
        path: '/admin/dashboard',
        component: AdminDashboard,
        name: 'adminDashboard'
    },
    {
        path: '/customer/dashboard',
        component: CustomerDashboard,
        name: 'customerDashboard'
    },
    {
        path: '/customer/index',
        component: CustomerIndex,
        name: 'customer'
    },
    {
        path: '/bill/index',
        component: BillIndex,
        name: 'bill'
    }
]
