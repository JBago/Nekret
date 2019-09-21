<template>
<div>
  <section class="section" >
    <div class="container box">
      <div class="columns">
        <div class="column">
          <figure class="image">
            <img :src="selectedObject.cover">
          </figure>
        </div>
        <div class="column">
          <span class="is-size-4 has-text-weight-medium is-family-primary">
                  {{selectedObject.title}}
          </span><br><br><br>
          <div class="has-text-left">
            <span class="is-size-5 is-family-primary">
                  Release Date: {{fixDate(selectedObject.releaseDate)}}
                  <br><br>
                  Country:  {{selectedObject.releaseCountry}}
                  <br><br>
                  Rating:  {{selectedObject.rating}}/10
            </span>
          </div> 
            <nav class="level is-mobile">
              <div class="level-item has-text-centered">
                <div>
                  <p class="is-size-6 is-family-primary has-text-weight-bold">LIKE</p>     
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
</div>
</template>


<script>
export default {
  name: 'View',
  data: function(){
    return {
        selectedObject: {}
    }
  },
  watch: {	},
  created: function(){},
  components: {  },
  methods: {

  }
}
</script>

<style>

</style>
