import Home from "../components/Home";
import Login from "../components/auth/Login";
import AdminLogin from "../components/auth/AdminLogin";
import AdminDashboard from "../components/admin/AdminDashboard";

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
    }
]
