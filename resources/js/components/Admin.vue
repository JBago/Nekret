<template>
    <div class="container position">
        <div class="card">
            <div class="card-header">
              <p class="card-header-title">
                Admin Dashboard
              </p>
            </div>
            <div class="card-content">
                <userList></userList>
            </div>
        </div>
    </div>
</template>

<script>
  import userList from './user-list.vue'
  export default {
    mounted() {
      //
    },
    components: {
      userList
    }
  }
</script>

<style >
.position{
  margin: 30px auto;
}
</style>