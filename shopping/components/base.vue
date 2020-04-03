<template>
  <div>
    <div class="index" style='margin-top:30px;' >
    <div class="myTab" >
      <div class="myTab-item" @click.stop="gosomewhere('myindex')">
        <img :src="imgUrl[0][0]" alt="" class='tabicon'>
        <p class='title' :style="'color:'+color[0][0]">主页</p>
      </div>
      <div class="myTab-item" @click="gosomewhere('class')">
        <img :src="imgUrl[1][0]" alt="" class='tabicon'>
        <p class='title' :style="'color:'+color[1][0]">分类</p>
      </div>
      <div class="myTab-item" @click="gosomewhere('cart')">
        <img :src="imgUrl[2][0]" alt="" class='tabicon'>
        <p class='title' :style="'color:'+color[2][0]">购物车</p>
      </div>
      <div class="myTab-item" @click="gosomewhere('center')">
        <img :src="imgUrl[3][0]" alt="" class='tabicon'>
        <p class='title' :style="'color:'+color[3][0]">个人中心</p>
      </div>
    </div>
  </div>
  </div>
</template>

<script>

export default {
  components:{

  },
  created(){
    this.url.forEach((item,i)=>{
      if(item==window.location.href.split('#/')[1]
      ||item==window.location.href.split('#/')[1].split('?')[0]){
        [this.imgUrl[i][0],this.imgUrl[i][1]]=[this.imgUrl[i][1],this.imgUrl[i][0]];
        [this.color[i][0],this.color[i][1]]=[this.color[i][1],this.color[i][0]]

      }
    })
  },
  data(){
    return {
      imgUrl:[
        [require('../img/tabBar/tabbar_n_0.png'),require('../img/tabBar/tabbar_h_0.png')],
        [require('../img/tabBar/tabbar_n_1.png'),require('../img/tabBar/tabbar_h_1.png')],
        [require('../img/tabBar/tabbar_n_2.png'),require('../img/tabBar/tabbar_h_2.png')],
        [require('../img/tabBar/tabbar_n_3.png'),require('../img/tabBar/tabbar_h_3.png')]
      ],
      url:[
        'myindex'||'index','class','cart','center'
      ],
      color:[
        ['','#fb3180'],
        ['','#fb3180'],
        ['','#fb3180'],
        ['','#fb3180']
      ]
    }
  },
  methods:{
    gosomewhere(url){
      if(url==window.location.href.split('#/')[1]) return
      this.$router.push(url)
  }
  }}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
*{
  margin: 0;
  padding: 0;
}
.tabicon{
  width:40%;
}
.myTab{
  display: flex;
  justify-content: space-between;
  position: fixed;
  bottom: 0;
  width:100%;
  background: #fff;
}
.myTab>div{
  text-align: center;
  font-size: 15%;
}
.myTab>div img{
  width:60%;
  margin-bottom: -4px;
}
</style>
