<template>
<div>
    <div id="reserve" class="modal">
            <div @click="reserveClose" class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Make a reservation</p>
                    <button @click="reserveClose" class="delete" aria-label="close"></button>
                </header>
                <div class="modal-card-body">
                    <div class="level">
                        <div class="level-item">
                            <datepicker :inline="true" :disabledDates="unavailable" v-model="highlighted"></datepicker>
                        </div>
                    </div>
                </div>
                <footer class="modal-card-foot">
                    <button @click="onSubmit" class="button is-success">Reserve</button>
                    <button @click="reserveClose" class="button">Cancel</button>
                </footer>
            </div>
    </div>
</div>
</template>

<script>
import Datepicker from 'vuejs-datepicker';
export default {
    name: 'reservation',
    components: {
        Datepicker
    },
    watch: {
        'visible': function (newVal, OldVal) {
            if(newVal===1)  document.getElementById('reserve').classList.add('is-active');
            else if(newVal===0) document.getElementById('reserve').classList.remove('is-active');          
        }
    },
    data: function () {
        return {
            highlighted: null,
        }
    },
    props: {
        visible: Number,
        selectedObject: Object,
        unavailable: Object
    },
    computed: {},
    methods: {
        reserveClose() {
            this.visible=0;
            this.$emit('closeReserve');
            console.log(this.unavailable);
        },
        onSubmit() {
            console.log(this.highlighted);
            this.axios.post('/api/reservation/create',
            {
            date: this.highlighted,
            property_id: this.selectedObject.id,
            }) .then(function (response) {
            })
             .catch(function (error) {
            console.log(error.response.data.errors);
            })
        }
    }
}
</script>