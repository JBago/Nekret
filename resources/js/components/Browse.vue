<template>
    <div class="container">
      <div class="box">
        <div v-bind:key="item.id" v-for="item in list">
          <prop-card :item="item"></prop-card>
        </div>
        <span v-show="list==false">{{emptyMessage}}</span>
      </div>
    </div>
</template>

<script>
import propCard from './PropCard.vue';
export default {
  data: function(){
    return {    
      list: [],
      emptyMessage: 'No properties found.'   
    }
  },
  created: function(){
      this.fetchProps();
  },
  components: { propCard },
  methods: {
      fetchProps(){
          this.axios.get('/api/properties').then((response) => {
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