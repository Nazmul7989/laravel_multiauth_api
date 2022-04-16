import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

let customerAuth = localStorage.getItem('customerAuth')
let adminAuth = localStorage.getItem('adminAuth')

export const store = new Vuex.Store({

    state: {
        customers: {},
        bills: {},
        myBills:{},
        customerAuthentication: customerAuth,
        adminAuthentication: adminAuth,
        authCustomer: {},
        authAdmin: {},
    },
    getters: {

        getCustomers(state) {
            return state.customers;
        },
        getBills(state) {
            return state.bills;
        },
        getMyBills(state) {
            return state.myBills;
        },
        getCustomerAuthentication(state) {
            return state.customerAuthentication;
        },

        getAdminAuthentication(state) {
            return state.adminAuthentication;
        },
        getAuthCustomer(state) {
            return state.authCustomer;
        },
        getAuthAdmin(state) {
            return state.authAdmin;
        },

    },
    mutations: {

        SET_CUSTOMERS(state, data) {
            state.customers = data;
        },
        SET_BILLS(state, data) {
            state.bills = data;
        },
        SET_MY_BILLS(state, data) {
            state.myBills = data;
        },
        SET_CUSTOMER_AUTHENTICATION(state, data) {
            state.customerAuthentication = data;
        },
        SET_ADMIN_AUTHENTICATION(state, data) {
            state.adminAuthentication = data;
        },
        SET_AUTH_CUSTOMER(state, data) {
            state.authCustomer = data;
        },
        SET_AUTH_ADMIN(state, data) {
            state.authAdmin = data;
        },

    },
    actions: {

        //get customer data
        loadCustomers  (context) {

            let token = localStorage.getItem('admin_access_token');

            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }

             axios.get('/api/admin/customer',config).then((response) => {
                context.commit('SET_CUSTOMERS', response.data.customers)
            }).catch((error) => {
                console.log(error)
            })
        },

        //get all customer billing data
        loadBills  (context) {

            let token = localStorage.getItem('admin_access_token');

            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }

            axios.get('/api/admin/bill',config).then((response) => {
                context.commit('SET_BILLS', response.data.bills)

                setTimeout(() => {
                    $("#myTable").DataTable({
                        lengthMenu: [
                            [5, 10, 25, 50, -1],
                            [5, 10, 25, 50, "All"],
                        ],
                        pageLength: 5,
                    });
                });

            }).catch((error) => {
                console.log(error)
            })
        },

        //get specific customer billing data
        loadMyBills  (context) {

            let token = localStorage.getItem('customer_access_token');
            let user = localStorage.getItem('customer');
            let userData = JSON.parse(user);

            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }

            axios.get('/api/customer/my-bill/' + userData.id ,config).then((response) => {
                context.commit('SET_MY_BILLS', response.data.bills)

                setTimeout(() => {
                    $("#myTable").DataTable({
                        lengthMenu: [
                            [5, 10, 25, 50, -1],
                            [5, 10, 25, 50, "All"],
                        ],
                        pageLength: 5,
                    });
                });

            }).catch((error) => {
                console.log(error)
            })
        },

        //get authenticated customer data
         loadAuthCustomer  (context) {

            let token = localStorage.getItem('customer_access_token');
            let user = localStorage.getItem('customer');
            let userData = JSON.parse(user);

            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }

            axios.get('/api/customer/dashboard/'+userData.id,config).then((response) => {
                context.commit('SET_AUTH_CUSTOMER', response.data.customer)
                localStorage.setItem('customerAuth',true);
                context.commit('SET_CUSTOMER_AUTHENTICATION',true)

            }).catch((error) => {
                context.commit('SET_AUTH_CUSTOMER',null)
                localStorage.setItem('customerAuth',false);
                context.commit('SET_CUSTOMER_AUTHENTICATION',false)
            })
        },

        //get authenticated admin data
        loadAuthAdmin  (context) {

            let token = localStorage.getItem('admin_access_token');
            let admin = localStorage.getItem('admin');
            let adminData = JSON.parse(admin);

            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }

            axios.get('/api/admin/dashboard/'+adminData.id,config).then((response) => {
                context.commit('SET_AUTH_ADMIN', response.data.admin)
                localStorage.setItem('adminAuth',true);
                context.commit('SET_ADMIN_AUTHENTICATION',true)

            }).catch((error) => {
                context.commit('SET_AUTH_ADMIN',null)
                localStorage.setItem('adminAuth',false);
                context.commit('SET_ADMIN_AUTHENTICATION',false)
            })
        },

    }
});
