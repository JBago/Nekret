<template>
<div>
  <section class="section" >
    <div class="container box">
      <div class="columns">
        <div class="column">
            <img :src="'/images/' + selectedObject.filename + '/' + selectedObject.cover">
        </div>
        <div class="column">
          <span class="is-size-4 has-text-weight-medium is-family-primary">
                  {{selectedObject.title}}
          </span><br>
          <div class="has-text-left">
            <span class="is-size-6 is-family-primary">
                  <br><br>
                  Location:  {{selectedObject.location.name}}
                  <br>
                  Owner:  {{selectedObject.user.username}}
                  <br>
                  Phone number: {{selectedObject.user.phone_number || 'N/A'}}
                  <br>
                  Description:
                  <br> 
                  {{selectedObject.description}}
                  <br>
                  <br>
            </span>
          </div> 
                <div>
                   <div @click="openReserve" class="button is-medium is-primary">Reserve</div>
                </div>
        </div>
        </div>
                <span>Pictures:</span>
          <div class="box">
                    <grid-layout
            :layout.sync="pictures"
            :col-num="4"
            :row-height="150"
            :is-mirrored="false"
            :is-draggable="false"
            :is-resizable="false"
            :vertical-compact="true"
            :margin="[10, 10]"
            :use-css-transforms="true" 
    >

        <grid-item v-for="item in pictures"
                   :x="item.x"
                   :y="item.y"
                   :w="item.w"
                   :h="item.h"
                   :i="item.i"
                   :key="item.i">
            <img @click="openPicture(item)" :src="item.img" style="display:flex;" />
        </grid-item>
    </grid-layout>
          </div>
    </div>
  </section>
  <reserveModul @closeReserve="closeReservation" v-if="$auth.check()" :unavailable="unavailableDates" :selectedObject="selectedObject" :visible="openReservation"></reserveModul>
      <div id="pictureModal" class="modal">
        <div @click="closePicture" class="modal-background"></div>
          <div class="modal-content">
            <p class="image is-4by3">
              <img :src="selectedPicture" alt="">
            </p>
          </div>
          <button  @click="closePicture" class="modal-close is-large" aria-label="close"></button>
      </div>
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
        pictures: [],
        openReservation: 0,
        selectedPicture: '',
        unavailableDates: {dates: []}
    }
  },
  watch: {	},
  created: function(){
    this.fetchData();
  },
  methods: {
          fetchData(){
          this.axios.get('/api/property/' + this.$route.params.id).then((response) => {
              this.selectedObject= response.data[0];
              for(var i=0;i<response.data[1].length;i++){
                this.pictures.push({"x":Math.floor((((i)/4)%1)*4),"y":Math.floor((i)/4),"w":1,"h":1,"i": (i).toFixed(0), "img": '/images/' + response.data[1][i].folder + '/' + response.data[1][i].name})
              };
              for(var i=0;i<response.data[2].length;i++){
              this.unavailableDates.dates.push(new Date(response.data[2][i].date));
              }
              console.log(this.unavailableDates);
              console.log(response.data)
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
          },
          openPicture(item){
            this.selectedPicture= item.img;
            document.getElementById('pictureModal').classList.add('is-active');
          },
          closePicture(){
            document.getElementById('pictureModal').classList.remove('is-active');
          }
  }
}
</script>

<style>

</style>
