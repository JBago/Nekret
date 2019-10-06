<template>
    <div class="section">
      <div id="card-container" class="container">
        <div class="card">
            <div class="card-header">
              <p class="card-header-title">
                Log In
              </p>
            </div>
            <div class="card-content">
                <div class="notification is-danger" v-if="has_error">
                    <p>Error, not able to connect. Try again.</p>
                </div>
                <form autocomplete="off" @submit.prevent="login" method="post">
                    <input type="hidden" name="_token" :value="csrf_token">
                    <div class="field">
                        <label for="email">E-mail</label>
                        <div class="control">
                          <input type="email" id="email" class="input" placeholder="user@example.com" v-model="email" required>
                        </div>
                    </div>
                    <div class="field">
                        <label for="password">Password</label>
                        <div class="control">
                        <input type="password" id="password" class="input" v-model="password" required>
                        </div>
                    </div>
                    <button hidden id='send' type="submit">Log In</button>
                </form>
            </div>
            <footer class="card-footer">
              <button @click="onSubmit" class="button is-info card-footer-item" style="height: auto; border-radius: 0; padding: 0.6rem">
                <span class="has-text-weight-medium" style="font-size: 1.15rem">Submit</span>
              </button>
            </footer>
        </div>
      </div>
    </div>
</template>

<script>
  export default {
    data() {
      return {
        email: null,
        password: null,
        has_error: false
      }
    },
    computed: {
      csrf_token() {
        let token = document.head.querySelector('meta[name="csrf-token"]')
        return token.content
      }
    },
    mounted() {
      //
    },

    methods: {
      onSubmit() {
        document.getElementById('send').click();
      },
      login() {
        // get the redirect object
        var redirect = this.$auth.redirect()
        var app = this
        this.$auth.login({
          url: '/api/auth/login',
          params: {
            email: app.email,
            password: app.password
          },
          success: function() {
            // handle redirection
            const redirectTo = redirect ? redirect.from.name :
            this.$auth.user().role === 2 ? 'admin' : 'home'
            console.log(this.$auth.user().role);
            this.$router.push({name: redirectTo});
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

<style>
  #card-container {
    margin-top: 100px;
    max-width: 400px;
  }
</style>