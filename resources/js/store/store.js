import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
    state: {
        customers: {},
        bills: {},
    },
    getters: {

        getCustomers(state) {
            return state.customers;
        },
        getBills(state) {
            return state.bills;
        },

    },
    mutations: {

        SET_CUSTOMERS(state, data) {
            state.customers = data;
        },
        SET_BILLS(state, data) {
            state.bills = data;
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

        //get billing data
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
            }).catch((error) => {
                console.log(error)
            })
        },

    }
});
