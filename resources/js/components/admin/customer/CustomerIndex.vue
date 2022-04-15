<template>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12">

                <div class="card mt-3">
                    <div class="card-header clearfix">
                        <h3 class="float-start">All Customers</h3>
                        <button  @click.prevent="createModal" class="btn btn-success btn-sm float-end">Create Customer</button>

                        <div class="modal fade"  tabindex="-1"  aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title text-success" v-if="modalShow"> Create New Customer </h3>
                                        <h3 class="modal-title text-success"  v-if="!modalShow"> Edit Customer</h3>
                                        <button @click="formResetByCloseBtnHeader" type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Customer Name</label>
                                                <input type="text" v-model="form.name" class="form-control" id="name">
                                                <div class="text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email Address</label>
                                                <input id="email" type="email" v-model="form.email" class="form-control" name="email"  required autocomplete="email" autofocus>
                                                <div v-if="form.errors.has('email')" v-html="form.errors.get('email')" />
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input id="password" type="password" v-model="form.password" class="form-control" name="password" required autocomplete="current-password">
                                                <div v-if="form.errors.has('password')" v-html="form.errors.get('password')" />
                                            </div>
                                            <div class="form-group">
                                                <label for="address" class="col-form-label">Address</label>
                                                <input type="text" v-model="form.address" class="form-control" id="address">
                                                <div class="text-danger" v-if="form.errors.has('address')" v-html="form.errors.get('address')" />
                                            </div>
                                            <div class="modal-footer">
                                                <button @click="formResetByCloseBtnFooter" type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                                <button v-if="modalShow" type="button" @click.prevent="createPost" class="btn btn-success">Create</button>
                                                <button v-if="!modalShow"  type="button" @click.prevent="updatePost" class="btn btn-success">Update</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body" v-if="customers.length">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th style="width: 150px">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="customer in customers" :key="customer.id">
                                <td>{{ customer.id }}</td>
                                <td>{{ customer.name }}</td>
                                <td>{{ customer.email }}</td>
                                <td>{{ customer.address }}</td>
                                <td style="width: 150px">
                                    <button @click.prevent="editModal(customer)"  class="btn btn-success">Edit</button>
                                    <button @click.prevent="deletePost(customer.id)" class="btn btn-danger">Delete</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row text-center my-5" v-else>
                        <div class="col-12">
                            <h5 >No Customer Found</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Form from 'vform'
import Swal from "sweetalert2";
export default {
    name: "UserIndex",
    data(){
        return{
            form: new Form({
                id: '',
                name: '',
                email: '',
                password: '',
                address: ''
            }),
            users: [],
            modalShow: true,
        }
    },
    methods: {

        createModal(){
            this.modalShow = true;
            $('.modal').modal('show')
        },
        createPost(){
            let token = localStorage.getItem('admin_access_token');
            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }
            this.form.post('/api/admin/customer/store',config).then((response)=>{
                //Load post again after creating new post
                this.$store.dispatch('loadCustomers')
                this.modalShow = true
                //close the modal after submittng the form
                $('.modal').modal('hide')
                //Show success notification
                Toast.fire({
                    icon: 'success',
                    title: 'Customer created successfully'
                })
                //Clear form after submitting
                this.resetForm()
            }).catch((error)=>{
                console.log(error)
            })
        },
        editModal(customer){
            this.modalShow = false
            //show the edit modal
            $('.modal').modal('show');
            //show post in modal
            this.form.id = customer.id
            this.form.name = customer.name
            this.form.email = customer.email
            this.form.password = customer.password
            this.form.address = customer.address
        },
        updatePost(){
            let token = localStorage.getItem('admin_access_token');
            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }
            this.form.post('/api/admin/customer/update/' + this.form.id,config ).then((response)=>{
                //Load post again after creating new post
                this.$store.dispatch('loadCustomers')
                this.modalShow = true
                //close the modal after submittng the form
                $('.modal').modal('hide')
                //Show success notification
                Toast.fire({
                    icon: 'success',
                    title: 'Customer updated successfully'
                })
                //Clear form after submitting
                this.resetForm()
            }).catch((error)=>{
                console.log(error)
            })
        },
        deletePost(id){

            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                width: 400,
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {

                    let token = localStorage.getItem('admin_access_token');
                    let config = {
                        headers: {
                            'Accept' : 'application/json',
                            "Authorization" : `Bearer ${token}`,
                        }
                    }
                    axios.delete('/api/admin/customer/delete/' + id ,config).then((response)=>{
                        //Reloading the posts after deleting the post
                        this.$store.dispatch('loadCustomers')
                    }).catch((error)=>{
                        console.log(error)
                    })
                    Swal.fire(
                        'Deleted!',
                        'Customer deleted successfully.',
                        'success'
                    )
                }
            })
        },
        formResetByCloseBtnHeader(){
            this.resetForm()
        },
        formResetByCloseBtnFooter(){
            this.resetForm()
        },
        resetForm(){
            this.form.id = ''
            this.form.name = ''
            this.form.email = ''
            this.form.password = ''
            this.form.address = ''
        },
    },
    computed: {
        customers(){
            return this.$store.getters.getCustomers
        }
    },
    mounted(){

        this.$store.dispatch('loadCustomers')

        this.resetForm()
    }
}
</script>

<style scoped>
</style>
