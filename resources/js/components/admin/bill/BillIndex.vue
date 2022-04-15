<template>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12">

                <div class="card mt-3">
                    <div class="card-header clearfix">
                        <h3 class="float-start">All Bills</h3>
                        <button  @click.prevent="createModal" class="btn btn-success btn-sm float-end">Create Bill</button>

                        <div class="modal fade"  tabindex="-1"  aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title text-success" v-if="modalShow"> Create New Bill </h3>
                                        <h3 class="modal-title text-success"  v-if="!modalShow"> Edit Bill</h3>
                                        <button @click="formResetByCloseBtnHeader" type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="user_id" class="col-form-label">Bill for Customer</label>
                                                <select v-model="form.user_id" name="user_id" id="user_id" class="form-control">
                                                    <option value="" selected>Select Customer</option>
                                                    <option v-for="customer in customers" :key="customer.id" :value="customer.id">{{ customer.name }}</option>
                                                </select>
                                                <div class="text-danger" v-if="form.errors.has('user_id')" v-html="form.errors.get('user_id')" />
                                            </div>
                                            <div class="form-group py-3">
                                                <label for="date">Billing Date</label>
                                                <input id="date" type="date" v-model="form.date" class="form-control" name="date"  required>
                                                <div v-if="form.errors.has('date')" v-html="form.errors.get('date')" />
                                            </div>
                                            <div class="form-group">
                                                <label for="amount">Bill Amount</label>
                                                <input id="amount" type="text" v-model="form.amount" class="form-control" name="amount" required>
                                                <div v-if="form.errors.has('amount')" v-html="form.errors.get('amount')" />
                                            </div>

                                            <div class="modal-footer">
                                                <button @click="formResetByCloseBtnFooter" type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                                                <button v-if="modalShow" type="button" @click.prevent="createBill" class="btn btn-success">Create</button>
                                                <button v-if="!modalShow"  type="button" @click.prevent="updateBill" class="btn btn-success">Update</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body" v-if="bills.length">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Customer</th>
                                <th>Billing Date</th>
                                <th>Amount(Tk)</th>
                                <th>Payment Status</th>
                                <th style="width: 300px">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="bill in bills" :key="bill.id">
                                <td>{{ bill.id }}</td>
                                <td>
                                    <span v-if="bill.user">{{ bill.user.name }}</span>
                                    <span v-else>{{ bill.user_id}}</span>
                                </td>
                                <td>{{ bill.date }}</td>
                                <td>Tk {{ bill.amount }}</td>
                                <td>
                                    <button class="btn btn-xs btn-primary" v-if="bill.status == 1">Paid</button>
                                    <button class="btn btn-xs btn-secondary" v-else>Due</button>
                                </td>
                                <td style="width: 150px">
                                    <button title="Change Bill Status" @click.prevent="updateBillStatus(bill.id)" class="btn btn-info btn-xs">Change Status</button>
                                    <button title="Edit" @click.prevent="editModal(bill)"  class="btn btn-success btn-xs">Edit</button>
                                    <button title="Delete" @click.prevent="deleteBill(bill.id)" class="btn btn-danger btn-xs">Delete</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row text-center my-5" v-else>
                        <div class="col-12">
                            <h5 >No Bill Found</h5>
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
    name: "BillIndex",
    data(){
        return{
            form: new Form({
                id: '',
                user_id: '',
                date: '',
                amount: '',

            }),
            modalShow: true,
        }
    },
    methods: {

        createModal(){
            this.modalShow = true;
            $('.modal').modal('show')
        },
        createBill(){
            let token = localStorage.getItem('admin_access_token');
            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }
            this.form.post('/api/admin/bill/store',config).then((response)=>{
                //Load post again after creating new post
                this.$store.dispatch('loadBills')
                this.modalShow = true
                //close the modal after submittng the form
                $('.modal').modal('hide')
                //Show success notification
                Toast.fire({
                    icon: 'success',
                    title: 'Bill created successfully'
                })
                //Clear form after submitting
                this.resetForm()
            }).catch((error)=>{
                console.log(error)
            })
        },
        editModal(bill){
            this.modalShow = false
            //show the edit modal
            $('.modal').modal('show');
            //show post in modal
            this.form.id = bill.id
            this.form.name = bill.name
            this.form.email = bill.email
            this.form.password = bill.password

        },
        updateBill(){
            let token = localStorage.getItem('admin_access_token');
            let config = {
                headers: {
                    'Accept' : 'application/json',
                    "Authorization" : `Bearer ${token}`,
                }
            }
            this.form.post('/api/admin/bill/update/' + this.form.id,config ).then((response)=>{
                //Load post again after creating new post
                this.$store.dispatch('loadBills')
                this.modalShow = true
                //close the modal after submittng the form
                $('.modal').modal('hide')
                //Show success notification
                Toast.fire({
                    icon: 'success',
                    title: 'Bill updated successfully'
                })
                //Clear form after submitting
                this.resetForm()
            }).catch((error)=>{
                console.log(error)
            })
        },
        deleteBill(id){

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
                    axios.delete('/api/admin/bill/delete/' + id ,config).then((response)=>{
                        //Reloading the posts after deleting the post
                        this.$store.dispatch('loadBills')
                    }).catch((error)=>{
                        console.log(error)
                    })
                    Swal.fire(
                        'Deleted!',
                        'Bill deleted successfully.',
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
            this.form.user_id = ''
            this.form.date = ''
            this.form.amount = ''
        },
    },
    computed: {
        bills(){
            return this.$store.getters.getBills
        },
        customers(){
            return this.$store.getters.getCustomers
        }
    },
    mounted(){

        this.$store.dispatch('loadBills')
        this.$store.dispatch('loadCustomers')

        this.resetForm()
    }
}
</script>

<style scoped>
</style>
