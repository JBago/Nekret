<template>
    <div class="section">
      <div class="container">
        <div class="notification is-danger" v-if="has_error && !success">
          <p>There was an error, unable to update property.</p>
        </div>
        <div class="notification is-success" v-if="success">
          <p>Property updated successfully.</p>
        </div>
        <div class="card" v-if="!success">
          <div class="card-header">
            <p class="card-header-title">
              Modify Property
            </p>
          </div>
        <div class="card-content" style="padding-bottom: 2.5rem;">
          <div class="columns">
          <div class="column">
            <div id="cover-box" class="box">
                <img  :src="selectedObject.cover" style="object-fit: scale-down">
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
          <form id="create_form" autocomplete="off" @submit.prevent="modify" method="post">
            <div class="field">
                <label for="name">Name:</label>
                <div class="control">
                  <input type="text" id="name" class="input" v-model="selectedObject.title" required>
                </div>
            </div>
                <label for="price">Price:</label>
            <div class="field has-addons">
                <div class="control" style="width:20%">
                  <input type="text" id="price" class="input"  v-model.number="selectedObject.price" required>
                </div>
            </div>
            <div class="field">
                <label for="name">Location:</label>
                <div class="control">
                  <input type="text" id="location" class="input" v-model="selectedObject.location.name" required>
                </div>
            </div>
            <div class="field">
                <label for="description">Description:</label>
                <div class="control">
                  <textarea class="textarea" id="description"  v-model="selectedObject.description"></textarea>
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
            <img :src="item.img" style="display:flex; object-fit: cover; max-height: 100%" />
        </grid-item>
    </grid-layout>
          </div>
        </div>

        <footer class="card-footer">
          <button @click="del" class="button is-danger card-footer-item" style="height: auto; border-radius: 0; padding: 0.6rem">
            <span class="has-text-weight-medium" style="font-size: 1.15rem">Delete</span>
          </button>
          <button @click="onSubmit" class="button is-info card-footer-item" style="height: auto; border-radius: 0; padding: 0.6rem">
            <span class="has-text-weight-medium" style="font-size: 1.15rem">Update</span>
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
        selectedObject: {
            title: '',
            price: '',
            location: {
                name: ''
            },
            description: '',
            cover: null
        },
        has_error: false,
        error: '',
        errors: {},
        success: false,
        layout: [],
        w: 1,
        h: 1,
      }
    },
    created: function () {
      this.fetchData();  
    },
    methods: {
      onSubmit() {
            document.getElementById('send').click();
      },
      modify() {
        var app = this;
        let photosArray= [];
        for(let k=0; k<this.layout.length;k++){
          if(this.layout[k].img!=null){
            photosArray.push(this.layout[k].img)
          }
        }
        this.axios.put('/api/properties/update/' + app.selectedObject.id,
          {
            title: app.selectedObject.title,
            price: app.selectedObject.price,
            description: app.selectedObject.description,
            location: app.selectedObject.location.name,
            cover: app.selectedObject.cover,
            photos: photosArray
          }) .then(function (response) {
            app.success = true;
          })
             .catch(function (error) {
            console.log(error.response.data.errors);
            app.has_error = true;
          })
      },
      del(){
          this.axios.delete('/api/properties/' + this.$route.params.id).then((response) => {
              console.log(response);
              app.success = true;
              this.$router.push({name: 'myproperties'});
            })
        },
       fetchData(){
          this.axios.get('/api/property/' + this.$route.params.id).then((response) => {
              this.selectedObject= response.data[0];
              this.selectedObject.cover = '/images/' + response.data[0].filename + '/' + response.data[0].cover;
              var i=0;
              for(i;i<response.data[1].length;i++){
                this.layout.push({"x":Math.floor((((i)/4)%1)*4),"y":Math.floor((i)/4),"w":1,"h":1,"i": (i).toFixed(0), "img": '/images/' + response.data[1][i].folder + '/' + response.data[1][i].name})
              };
              this.layout.push({"x":Math.floor((((i)/4)%1)*4),"y":Math.floor((i)/4),"w":1,"h":1,"i": (i).toFixed(0), "img": null})
              console.log(this.selectedObject);
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
                resolve;
                } 
              });
        },
        uploadCover(){
          const image = event.target.files[0];
          const that = this;
          const reader = new FileReader();
          reader.readAsDataURL(image);
          reader.onload = event =>{
            that.selectedObject.cover = event.target.result;
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