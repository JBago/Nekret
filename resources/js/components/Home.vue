<template>
  <div id="home">
    <section id="hero" class="hero is-info is-medium">
      <div id="banner" class="hero is-medium is-overlay">
        <figure class="image">
          <img src="../assets/banner.jpg" style="object-fit: cover;">
        </figure>
      </div>
      <div class="hero-body">
        <div class="section">
        <div class="container has-text-centered">
          <h1 class="title">
            Welcome
          </h1>
          <h2 class="subtitle">
            <strong>Find</strong> and <strong>Rent</strong> accomodations across the globe.
          </h2>
          <br>
          <div class="buttons is-centered">
            <router-link to="/login"><span class="button is-rounded is-medium">Log In</span></router-link>
            <router-link to="/register"><span class="button is-success is-rounded is-medium">Sign Up</span></router-link>
          </div>
        </div>
        </div>
      </div>
    </section>
    <section class="section">
      <div class="container columns">
        <div class="column">
          <nav class="level">
            <div class="level-item has-text-centered">
              <span class="icon is-large has-text-info">
                  <i class="mdi mdi-48px mdi-airplane-takeoff" style="position: relative; top: -0.2rem"></i>
              </span>
              <h1 class="title">  
                Traveling somewhere?
              </h1>  
            </div>
          </nav>
        <h2 class="subtitle is-4 has-text-centered">Find a place to stay at your favorite destinations.</h2>
        </div>
          <div class="column">
           <nav class="level">
            <div class="level-item has-text-centered">
              <span class="icon is-large has-text-info">
                  <i class="mdi mdi-48px mdi-city-variant-outline" style="position: relative; top: -0.2rem"></i>
              </span>
              <h1 class="title">  
                More than 100 cities!
              </h1>  
            </div>
          </nav>
        <h2 class="subtitle is-4 has-text-centered">Top quality accomodations in all major locations.</h2>
        </div>
      </div>
    </section>
    <section id="hero" class="hero is-warning is-medium has-text-centered">
      <div class="hero-body">
        <h1 class="title">
            Lorem Ipsum
        </h1>
      </div>
    </section>
    <section class="section">
      <div class="container">
        <div class="content">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed scelerisque mattis dolor, pellentesque sagittis mauris maximus vel. Vestibulum quis hendrerit nisi. Duis vitae eleifend sapien, quis pretium arcu. Mauris quam eros, efficitur id lectus in, euismod ultrices magna. Nulla eget ipsum convallis mi pellentesque ultricies. Curabitur sit amet ligula dui. Nullam condimentum maximus metus, ut pretium nunc lobortis non. Phasellus et consequat turpis. Integer quam libero, porta in auctor eu, tempor sit amet nunc. Suspendisse mauris ex, consequat a condimentum sed, viverra id arcu. Fusce semper tortor at sapien egestas, et laoreet lacus condimentum.
          <br>
          Fusce finibus, sapien ultricies facilisis pulvinar, leo magna fringilla ante, vel euismod odio purus elementum neque. Nunc at tellus id magna posuere viverra. Vivamus vitae velit venenatis, congue ipsum et, lobortis lectus. Aliquam quis massa varius, blandit eros sit amet, semper purus. Sed porta elementum felis, at maximus leo ultrices vel. Sed faucibus risus ac consectetur dapibus. Nullam metus augue, pharetra quis nisi vel, dapibus tristique metus. Nam tincidunt enim vel ligula tempor mollis. Vestibulum elementum dui sollicitudin luctus eleifend. Suspendisse at turpis nec massa pretium vestibulum.
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: "Home",
};
</script>

<style>
  #banner{
    position: absolute;
    top: 52px;
    height: 542px;
    width: 100%;
    opacity: 0.45;
  }
  figure{
   width:100%; /*container-width*/
   overflow:hidden; /*hide bounds of image */
   margin:0;   /*reset margin of figure tag*/
  }
  figure img{
   display:block; /*remove inline-block spaces*/
   height: 100%;
  }
  @media screen and (max-width: 364px){
    #banner{
   /*add to other styles*/
    opacity: 0;
  }
  }
  @media screen and (max-width: 520px){
  #banner{
   /*add to other styles*/
    height: 375px;
  }
  }
  @media screen and (max-width: 622px){
  figure img{
   /*add to other styles*/
   width:300%;
  }
  figure{
   width: 200%;
   margin: 0 -100%
  }
  }
  @media screen and (min-width: 521px){
    #banner{
      height: 350px;
    }
  }
  @media screen and (min-width: 769px){
    figure img{
      margin: -10% 0;
    }
    #banner{
      height: 542px;
    }
    figure{
     width: 200%;
     margin: 0 -100%
    }
  }
  @media screen and (min-width: 964px){
    figure img{
      margin: 0;
    }
    figure{
     width: 100%;
     margin: 0
    }
  }
  @media screen and (min-width: 1216px){
    figure img{
      margin:-5% 0;
    }
  }
  @media screen and (min-width: 1408px){
    figure img{
      margin:-10% 0;
    }
  }
</style>
