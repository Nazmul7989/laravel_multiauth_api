<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3>Welcome to Dashboard</h3>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    name: "Dashboard",
    data() {
        return {
            name: ''
        }
    },
    methods: {
        test() {

        }
    },
    components: {},
    watch: {
        $route(to, from) {
            //add $ sign before route
        }
    },
    mounted() {

    },
    created() {

    },
}
</script>

<style scoped>

</style>
