<template>
    <div class="container">
      <div class="box" style="padding: 1rem; margin-top: 100px; margin-bottom: 100px">
        <div v-bind:key="item.id" v-for="item in list">
          <prop-card :item="item" :route="'/Modify/' + item.id"></prop-card>
        </div>
        <span v-show="list==false">{{emptyMessage}}</span>
      </div>
    </div>
</template>

<script>
import propCard from './propCard.vue';
export default {
  data: function(){
    return {    
      list: [],
      emptyMessage: 'You have no properties.'   
    }
  },
  created: function(){
      this.fetchProps();
  },
  components: { propCard },
  methods: {
      fetchProps(){
          this.axios.get('/api/myProperties').then((response) => {
              this.list= response.data;
          })
      }
  },
  props:{

  }
}
</script>

<style>

</style>