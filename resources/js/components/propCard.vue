<template>
    <div class="card" id="itemCard">
        <router-link :to="'/View/'+item.id"><div  style="z-index: 10;" class="is-overlay"></div></router-link>
        <div>
            <div id="cardName" class="card-content has-text-centered">
                <div  class="card-image" >
                    <figure class="image">
                        <img :src="item.cover">
                    </figure>
                </div>
                <span>
                  {{item.title}}</span><br>
                 <span>
                  {{item.price}} 
                </span>
            </div>
          </div>
        </div>
</template>

<script>
export default {
    name: "prop-card",
    data: function(){
    return {       
    }
    },
    created: function(){

    },
    components: { },
    methods: {
    },
    props:{
      item: Object
  }
}
</script>

<style>

</style>