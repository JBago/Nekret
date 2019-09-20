<template>
    <div class="section">
      <div id="card-container1" class="container">
        <div class="notification is-danger" v-if="error && !success">
          <p>There was an error, unable to complete registration.</p>
        </div>
        <div class="notification is-success" v-if="success">
          <p>Registration completed. You can now <router-link :to="{name:'login'}">sign in.</router-link></p>
        </div>
        <div class="card" v-if="!success">
          <div class="card-header">
            <p class="card-header-title">
              Register
            </p>
          </div>
        <div class="card-content" style="padding-bottom: 2.5rem;">
          <form id="register_form" autocomplete="off" @submit.prevent="register" method="post">
            <div class="field">
                <label for="name">Name</label>
                <div class="control">
                  <input type="text" id="name" class="input" v-model="name" required>
                </div>
            </div>
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
            <button id="send" hidden type="submit"></button>
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
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
        has_error: false,
        error: '',
        errors: {},
        success: false
      }
    },
    computed: {
      csrf_token() {
        let token = document.head.querySelector('meta[name="csrf-token"]')
        return token.content
      }
    },
    methods: {
      onSubmit() {
            document.getElementById('send').click();
      },
      register() {
        var app = this;
        this.axios.post('/api/auth/register',
          {
            username: app.name,
            email: app.email,
            password: app.password
          }) .then(function (response) {
            app.success = true;
            this.$router.push({name: 'login', params: {successRegistrationRedirect: true}});
          })
             .catch(function (error) {
            console.log(error.response.data.errors);
            app.has_error = true;
            app.error = error.response.data.error;
            app.errors = error.response.data.errors || {};
          })
      }
    }
  }
</script>

<style>
  #card-container1 {
    margin-top: 100px;
    max-width: 400px;
  }
</style>