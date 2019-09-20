<template>
<div>
    <div id="login" class="modal">
            <div @click="loginClose" class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Log In</p>
                    <button @click="loginClose" class="delete" aria-label="close"></button>
                </header>
                <form id="login_form" method="POST" @submit.prevent="login" aria-label="Login" class="modal-card-body">
                    <input type="hidden" name="_token" :value="csrf_token">
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
                    <button @click="onSubmit" class="button is-success">Login</button>
                    <button class="button">Cancel</button>
                </footer>
            </div>
    </div>
</div>
</template>

<script>
export default {
    name: 'login',
    watch: {
        'visible': function (newVal, OldVal) {
            if(newVal===1)  document.getElementById('login').classList.add('is-active');
            else if(newVal===0) document.getElementById('login').classList.remove('is-active');          
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
    computed: {
      csrf_token() {
        let token = document.head.querySelector('meta[name="csrf-token"]')
        return token.content
      }
    },
    methods: {
        loginClose() {
            this.visible=0;
            this.$emit('closeLogin');
        },
        onSubmit() {
            document.getElementById('login_form').submit();
        },
        login() {
        // get the redirect object
        var redirect = this.$auth.redirect()
        var app = this
        this.$auth.login({
          params: {
            email: app.email,
            password: app.password
          },
          success: function() {
            // handle redirection
            const redirectTo = redirect ? redirect.from.name : this.$auth.user().role === 2 ? 'admin.dashboard' : 'dashboard'
            this.$router.push({name: redirectTo})
          },
          error: function() {
            app.has_error = true
          },
          rememberMe: true,
          fetchUser: true
        })
      }
    }
}
</script>