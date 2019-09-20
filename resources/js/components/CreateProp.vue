<template>
    <div class="section">
      <div class="container">
        <div class="notification is-danger" v-if="error && !success">
          <p>There was an error, unable to create property.</p>
        </div>
        <div class="notification is-success" v-if="success">
          <p>Property created successfully.</p>
        </div>
        <div class="card" v-if="!success">
          <div class="card-header">
            <p class="card-header-title">
              Add Property
            </p>
          </div>
        <div class="card-content" style="padding-bottom: 2.5rem;">
          <div class="columns">
          <div class="column">
            <div id="cover-box" class="box">
                <img  :src="cover" style="object-fit: scale-down">
            </div>
          <div class="file is-info">
            <label class="file-label">
              <input @change="uploadCover" class="file-input" type="file" name="resume">
              <span class="file-cta">
                <span class="file-icon">
                  <i class="mdi mdi-upload"></i>
                </span>
                <span class="file-label">
                  Choose a cover...
                </span>
              </span>
            </label>
            </div>
          </div>
          <div class="column">
          <form id="create_form" autocomplete="off" @submit.prevent="create" method="post">
            <div class="field">
                <label for="name">Name:</label>
                <div class="control">
                  <input type="text" id="name" class="input" v-model="name" required>
                </div>
            </div>
                <label for="price">Price:</label>
            <div class="field has-addons">
                <div class="control" style="width:20%">
                  <input type="text" id="price" class="input"  v-model.number="price" required>
                </div>
                <div class="control"><a class="button is-info is-static">€</a></div>
                
            </div>
            <div class="field">
                <label for="description">Description:</label>
                <div class="control">
                  <textarea class="textarea" id="description"  v-model="description"></textarea>
                </div>
            </div>
            <button id="send" hidden type="submit"></button>
          </form>
          </div></div>
          <span>Pictures:</span>
          <div class="box">
                    <grid-layout
            :layout.sync="layout"
            :col-num="4"
            :row-height="150"
            :is-mirrored="false"
            :is-draggable="false"
            :is-resizable="false"
            :vertical-compact="true"
            :margin="[10, 10]"
            :use-css-transforms="true" 
    >

        <grid-item v-for="item in layout"
                   :x="item.x"
                   :y="item.y"
                   :w="w"
                   :h="h"
                   :i="item.i"
                   :key="item.i">
            <div class="file is-info is-boxed" style="height:100%" v-show="!item.img">
              <label class="file-label">
              <input class="file-input" multiple type="file" accept="image/*" @change="uploadImage(item.i)">
                <span class="file-cta" style="height:100%; padding: 3rem">
                  <span class="file-icon">
                    <i class="mdi mdi-24px mdi-image-plus"></i>
                  </span>
                    <span class="file-label">
                    Choose a file…
                  </span>
                </span>
              </label>
            </div>
            <img :src="item.img" style="display:flex;" />
        </grid-item>
    </grid-layout>
          </div>
        </div>

        <footer class="card-footer">
          <button @click="onSubmit" class="button is-info card-footer-item" style="height: auto; border-radius: 0; padding: 0.6rem">
            <span class="has-text-weight-medium" style="font-size: 1.15rem">Create</span>
          </button>
        </footer>
      </div>
    </div>
  </div>
</template>
<script>
  import VueGridLayout from 'vue-grid-layout';
  export default {
    components: {
           GridLayout: VueGridLayout.GridLayout,
           GridItem: VueGridLayout.GridItem
       },
    data() {
      return {
        name: '',
        price: '',
        description: '',
        has_error: false,
        error: '',
        cover: null,
        errors: {},
        success: false,
        layout: [
	        {"x":0,"y":0,"w":1,"h":1,"i":"0", "img": null}
        ],
        w: 1,
        h: 1,
        refresh:0
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
      create() {
        var app = this;
        let photosArray= [];
        for(let k=0; k<this.layout.length;k++){
          if(this.layout[k].img!=null){
            photosArray.push(this.layout[k].img)
          }
        }
        this.axios.post('/api/properties/create',
          {
            title: app.name,
            user_id: app.$auth.user().id,
            price: app.price+'€',
            description: app.description,
            location_id: 2,
            filename: app.filename,
            cover: app.cover,
            photos: photosArray
          }) .then(function (response) {
            app.success = true;
          })
             .catch(function (error) {
            console.log(error.response.data.errors);
            app.has_error = true;
            app.error = error.response.data.error;
            app.errors = error.response.data.errors || {};
          })
      },
       uploadImage(i){
          const images = event.target.files;
          var that=this;
          const num = parseInt(i);
          var promise = Promise.resolve();
          for(let j=0; j<images.length;j++){
            promise.then(()=> this.pFileReader(images[j], num, j));
          };
          promise.then(() => console.log('all done...'));
        },  
        pFileReader(file, num, j){
        return new Promise((resolve, reject) => {
                var that=this;
                const reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = event =>{
                that.layout[num+j].img= event.target.result;
                  that.layout.push({"x":Math.floor((((num+j+1)/4)%1)*4),"y":Math.floor((num+j+1)/4),"w":1,"h":1,"i": (num+j+1).toFixed(0), "img": null});
                } 
              });
        },
        uploadCover(){
          const image = event.target.files[0];
          const that = this;
          const reader = new FileReader();
          reader.readAsDataURL(image);
          reader.onload = event =>{
            that.cover = event.target.result;
            that.refresh++;
          } 
        }
      }
    }
</script>

<style>
  #card-container {
    margin-top: 100px;
  }
  #cover-box{
    width: 100%;
    height: 80%;
  }
</style>