<template>
<div>
    <div id="reserve" class="modal">
            <div @click="reserveClose" class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Make a reservation</p>
                    <button @click="reserveClose" class="delete" aria-label="close"></button>
                </header>
                <form id="reserve_form" method="POST" @submit.prevent="reserve" aria-label="reserve" class="modal-card-body">
                    <div class="field">
                      <label class="label">E-Mail</label>
                      <div class="control">
                        <input name='email' v-model="email" class="input" type="text">
                      </div>
                    </div>
                    <div class="field">
                      <label class="label">Password</label>
                      <div class="control">
                        <input name="password" v-model="password" class="input" type="password">
                      </div>
                    </div>
                </form>
                <footer class="modal-card-foot">
                    <button @click="onSubmit" class="button is-success">reserve</button>
                    <button class="button">Cancel</button>
                </footer>
            </div>
    </div>
</div>
</template>

<script>
export default {
    name: 'reservation',
    watch: {
        'visible': function (newVal, OldVal) {
            if(newVal===1)  document.getElementById('reserve').classList.add('is-active');
            else if(newVal===0) document.getElementById('reserve').classList.remove('is-active');          
        }
    },
    data: function () {
        return {
            email: '',
            password: '',
        }
    },
    props: {
        visible: Number
    },
    computed: {},
    methods: {
        reserveClose() {
            this.visible=0;
            this.$emit('closeReserve');
        },
        onSubmit() {
            document.getElementById('reserve_form').submit();
        },
        reserve() {
      }
    }
}
</script>