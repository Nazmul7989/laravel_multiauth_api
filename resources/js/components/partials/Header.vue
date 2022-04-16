<template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container">
            <router-link :to="{name: 'home'}" class="navbar-brand" href="#">Navbar Logo</router-link>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0" v-if="authCustomer">
                    <li class="nav-item">
                        <router-link :to="{name: 'home'}" active-class="active" exact class="nav-link" >Home</router-link>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            {{ customer.name }}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><router-link :to="{name: 'customerDashboard'}" class="dropdown-item">Dashboard</router-link></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><button type="submit" @click.prevent="customerLogout" class="dropdown-item">Logout</button></li>
                        </ul>
                    </li>

                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0" v-else-if="authAdmin">
                    <li class="nav-item">
                        <router-link :to="{name: 'home'}" active-class="active" exact class="nav-link" >Home</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link :to="{name: 'customer'}" active-class="active" exact class="nav-link" >Customer</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link :to="{name: 'bill'}" active-class="active" exact class="nav-link" >Bill</router-link>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            {{ admin.name }}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><router-link :to="{name: 'adminDashboard'}" class="dropdown-item">Dashboard</router-link></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><button type="submit" @click.prevent="adminLogout" class="dropdown-item">Logout</button></li>
                        </ul>
                    </li>

                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0" v-else>
                    <li class="nav-item">
                        <router-link :to="{name: 'home'}" active-class="active" exact class="nav-link" >Home</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link :to="{name: 'login'}" active-class="active" exact class="nav-link" >Login</router-link>
                    </li>

                </ul>

            </div>
        </div>
    </nav>
</template>

<script>
export default {
    name: "Header",
    data() {
        return {
            name: ''
        }
    },
    methods: {
        customerLogout(){


            Toast.fire({
                icon: 'success',
                title: 'Logout successfully'
            })

            this.$store.commit("SET_AUTH_CUSTOMER", null)
            this.$store.commit("SET_CUSTOMER_AUTHENTICATION", false)
            localStorage.removeItem('customer_access_token')
            localStorage.removeItem('customer')
            localStorage.removeItem('customerAuth')
            this.$router.push({name: 'home'})

        },
        adminLogout(){


            Toast.fire({
                icon: 'success',
                title: 'Logout successfully'
            })

            this.$store.commit("SET_AUTH_ADMIN", null)
            this.$store.commit("SET_ADMIN_AUTHENTICATION", false)
            localStorage.removeItem('admin_access_token')
            localStorage.removeItem('admin')
            localStorage.removeItem('adminAuth')
            this.$router.push({name: 'home'})

        }
    },
    computed: {
        authCustomer(){
            return this.$store.getters.getCustomerAuthentication;
        },
        authAdmin(){
            return this.$store.getters.getAdminAuthentication;
        },
        customer(){
            return this.$store.getters.getAuthCustomer;
        },
        admin(){
            return this.$store.getters.getAuthAdmin;
        }
    },
    mounted() {

        let customer_token = localStorage.getItem('customer_access_token');
        let admin_token = localStorage.getItem('admin_access_token');

        if (customer_token){
            this.$store.dispatch('loadAuthCustomer');
        }
        if (admin_token){
            this.$store.dispatch('loadAuthAdmin');
        }
    }

}
</script>

<style scoped>

</style>
