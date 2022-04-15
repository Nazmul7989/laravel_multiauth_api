<template>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header py-2 text-center">
                        <h3>Admin Login</h3>
                    </div>

                    <div class="card-body">
                        <form method="POST">

                            <div class="row mb-3">
                                <label for="email">Email Address</label>

                                <div class="col-12">
                                    <input id="email" type="email" v-model="form.email" class="form-control" name="email"  required autocomplete="email" autofocus>
                                    <div v-if="form.errors.has('email')" v-html="form.errors.get('email')" />

                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="password">Password</label>

                                <div class="col-12">
                                    <input id="password" type="password" v-model="form.password" class="form-control" name="password" required autocomplete="current-password">
                                    <div v-if="form.errors.has('password')" v-html="form.errors.get('password')" />
                                </div>
                            </div>


                            <div class="row mb-0">
                                <div class="col-12 offset-md-4">
                                    <button type="submit" @click.prevent="login" :disabled="form.busy" class="btn btn-primary">
                                        Login
                                    </button>


                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import Form from 'vform'

export default {
    name: "AdminLogin",
    data: () => ({
        form: new Form({
            email: '',
            password: ''
        })
    }),
    methods: {
        async login() {
            await this.form.post('/api/admin/login').then((response)=>{

                localStorage.setItem('admin_access_token',response.data.access_token);
                localStorage.setItem('admin',JSON.stringify(response.data.admin));
                this.$router.push({name:'adminDashboard'})


            }).catch((error)=>{
                console.log(error)
            })
        }
    },
}
</script>

<style scoped>

</style>
