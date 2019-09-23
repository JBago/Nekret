<template>
<div>
  <section class="section" >
    <div class="container box">
      <div class="columns">
        <div class="column">
          <figure class="image">
            <img :src="'/images/' + selectedObject.filename + '/' + selectedObject.cover">
          </figure>
        </div>
        <div class="column">
          <span class="is-size-4 has-text-weight-medium is-family-primary">
                  {{selectedObject.title}}
          </span><br><br><br>
          <div class="has-text-left">
            <span class="is-size-5 is-family-primary">
                  <br><br>
                  Owner:  {{selectedObject.user.username}}
                  <br>
                  Phone number: {{selectedObject.user.phone_number || 'N/A'}}
                  <br>
                  Description: {{selectedObject.description}}
                  <br>
            </span>
          </div> 
            <nav class="level is-mobile">
              <div class="level-item has-text-centered">
                <div>
                   <div @click="openReserve" class="button is-primary">Reserve</div>
                </div>
              </div>
              <div class="level-item has-text-centered">
              </div>
              <div class="level-item has-text-centered">
              </div>
              <div class="level-item has-text-centered">
                <div>
                  <p class="is-size-6 is-family-primary has-text-weight-bold">FAVORITE</p>
                </div>
              </div>
            </nav>        
        </div>
      </div>
    </div>
  </section>
  <reserveModul @closeReserve="closeReservation" v-if="$auth.check()" :visible="openReservation"></reserveModul>
</div>
</template>


<script>
import reserveModul from './reserveModul.vue';
export default {
  name: 'View',
  components: { reserveModul },
  data: function(){
    return {
        selectedObject: {},
        openReservation: 0
    }
  },
  watch: {	},
  created: function(){
    this.fetchData();
  },
  methods: {
          fetchData(){
          this.axios.get('/api/property/' + this.$route.params.id).then((response) => {
              this.selectedObject= response.data;
              console.log(response);
              console.log(this.selectedObject);
            })
          },
          openReserve(){
            if(this.$auth.check()){
              this.openReservation=1;
            }
            else{
               this.$router.push('/login');
            }
          },
          closeReservation(){
            this.openReservation=0;
          }
  }
}
</script>

<style>

</style>
