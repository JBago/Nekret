<template>
  <div id="app">
    <div class="navbar is-fixed-top"></div>
    <div id="nav" class="navbar container is-fixed-top">   
      <div id="navbarBasicExample"  class="navbar-menu navbar-menu-custom ">
        <div class="navbar-start">
          <router-link to="/"  class="navbar-item nav-item-custom">
            <span class="is-family-primary">HOME</span>
          </router-link>
          <router-link  v-if="$auth.check()" to="/create" class="navbar-item nav-item-custom">
            <span class="is-family-primary">Add Property</span>
          </router-link>
          <router-link  v-if="$auth.check()" to="/properties" class="navbar-item nav-item-custom">
            <span class="is-family-primary">My Properties</span>
          </router-link>
           <router-link to="/browse" class="navbar-item nav-item-custom">
            <span class="is-family-primary">Browse</span>
          </router-link>
        </div>
        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <router-link v-if="!$auth.check()" to="/login">
              <a  class="button is-light">
                Log in
              </a>
              <router-link v-if="!$auth.check()"  to="/register">
                <a class="button is-info">
                  <strong>Sign up</strong>
                </a>
              </router-link>
              </router-link>
              <a  class="button is-light" href="#" @click.prevent="logout()" v-if="$auth.check()">
                Logout
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <router-view />
    <footer class="footer">
      <div class="content has-text-centered">
        <p>
            Julijan Bago
        </p>
  </div>
</footer>
  </div>
</template>

<script>
//import Login from '../components/Login.vue'
export default {
  components: {
    //Login
  },
  data: function () {
    return {
      loginVisible: 0
    }
  },
  created: function () {
    //this.read();
  },
  methods: {
    read() {
    this.axios.get('/api/user').then(({ data }) => {
      console.log(data);
    });
    },
    logout() {
        this.$auth.logout({
          url: '/api/auth/logout',
        })
    }
  }
    
}
</script>

<style>
  .nav-item-custom:focus{
    background-color: transparent !important;
    color: initial !important;
  }
</style>