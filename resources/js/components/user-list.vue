<template>
<div>
    <h3 class="title is-size-5">User List</h3>
    <div class="alert alert-danger" v-if="has_error">
        <p>Error, Unable to get User list.</p>
    </div>

    <table class="table">
      <thead>
        <tr >
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Date of creation</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" v-bind:key="user.id" style="margin-bottom: 5px;">
            <th>{{ user.id }}</th>
            <td>{{ user.username }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.created_at}}</td>
        </tr>
      </tbody>
    </table>

</div>
</template>

<script>
  export default {
    data() {
      return {
        has_error: false,
        users: null
      }
    },

    mounted() {
      this.getUsers()
    },

    methods: {
      getUsers() {
        this.$http({
          url: `api/users`,
          method: 'GET'
        })
            .then((res) => {
              this.users = res.data.users
            }, () => {
              this.has_error = true
            })
      }
    }
  }
</script>