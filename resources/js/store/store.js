import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
    state: {
        customers: {},
    },
    getters: {

        getCustomers(state) {
            return state.customers;
        },

    },
    mutations: {

        SET_CUSTOMERS(state, data) {
            state.customers = data;
        },

    },
    actions: {
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

    }
});
