<template>
    <div class="container mt-5">
        <div class="row">
            <div class="col-12">

                <div class="card mt-3">
                    <div class="card-header clearfix">
                        <h3 class="float-start">All Bills</h3>
                    </div>

                    <div class="card-body" v-if="bills.length">
                        <table id="myTable" class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Billing Date</th>
                                <th>Amount(Tk)</th>
                                <th>Payment Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="bill in bills" :key="bill.id">
                                <td>{{ bill.id }}</td>
                                <td>{{ bill.date }}</td>
                                <td>Tk {{ bill.amount }}</td>
                                <td>
                                    <button class="btn btn-xs btn-primary" v-if="bill.status == 1">Paid</button>
                                    <button class="btn btn-xs btn-secondary" v-else>Due</button>
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
export default {
    name: "CustomerDashboard",
    data() {
        return {
            name: ''
        }
    },
    methods: {
        test() {

        }
    },
    computed: {
        bills(){
            return this.$store.getters.getMyBills;
        },

    },
    mounted(){

        this.$store.dispatch('loadMyBills');
    }
}
</script>

<style scoped>

</style>
