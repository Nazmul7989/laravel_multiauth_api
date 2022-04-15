import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
    state: {
        posts: {},
    },
    getters: {

        getPosts(state) {
            return state.posts;
        },

    },
    mutations: {

        SET_POSTS(state, data) {
            state.posts = data;
        },

    },
    actions: {

        loadPosts(context) {
            axios.get('/post').then((response) => {
                context.commit('SET_POSTS', response.data)
            }).catch((error) => {
                console.log(error)
            })
        },

    }
});
