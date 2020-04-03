<template>
    <div class=' bg-light text_left' >
        <div id="top" class='my_bg1'></div>
        <img src="../img/icon/ic_appbar_msg_white.png" alt="" class='m-3'>
        <div class='m-a bg-white spread' id='spread0' style='width:90%;'>
            <div style='display: flex;'>
              <img src="../img/icon/ic_default_user_avatar_brand.png" alt="" id='header'>
              <span class='fw600 font_normal' id='regOrLogin'>{{'欢迎您,'+userData.uname||'登录/注册'}}</span>
            </div>
            <div class='flex-3 ' style='top:120px;'>
                <div>
                    <p  class='fw600'>{{number[0].toFixed(2)}}</p>
                    <span class='font_dark'>钱包余额(元)</span>
                </div>
                <div>
                    <p class='fw600'>{{number[1].toFixed(2)}}</p>
                    <span class='font_dark'>累积已省(元)</span>
                </div>
                <div>
                    <p class='fw600'>{{number[2].toFixed(2)}}</p>
                    <span class='font_dark'>购物津贴(元)</span>
                </div>
            </div>
        </div>
        <div class='spread bg-white m-a' style='width:90%;margin-top:6px;padding:10px 0'>
            <p class='mx-4 fw600'>我的订单</p>
            <div class='flex-4' id='purch-menu'>
              <div @click="goSomewhere('pay')">
                <img src="../img/icon/icon_personal_dfk.png" alt="">
                <p class='font_small'>待付款</p>
              </div>
              <div @click="goSomewhere('beforeSend')">
                <img src="../img/icon/icon_personal_dfh.png" alt="">
                <p class='font_small'>待发货</p>
              </div>
              <div @click="goSomewhere('beforeArrive')">
                <img src="../img/icon/icon_personal_dsh.png" alt="">
                <p class='font_small'>待收货</p>
              </div>
              <div @click="goSomewhere('afterSold')">
                <img src="../img/icon/icon_personal_dpj.png" alt="">
                <p class='font_small'>待评价</p>
              </div>
              <div @click="goSomewhere()">
                <img src="../img/icon/icon_personal_return.png" alt="">
                <p class='font_small'>售后</p>
              </div>
            </div>
        </div>
        <div style='height:15px'></div>
        <div class="spread bg-white m-a " style='width:90%;'>
          <p class='mx-4 fw600'>我的服务</p>
          <div class='flex-4' style='' id='my_serve'>
            <div @click="goSomewhere()">
              <img src="../img/icon/icon_home_yhq.png" alt="">
              <p class='font_small'>购物红包</p>
            </div>
            <div @click="goSomewhere('cart')">
              <img src="../img/icon/icon_home_wdzj.png" alt="">
              <p class='font_small'>我的足迹</p>
            </div>
            <div @click="goSomewhere('cart')">
              <img src="../img/icon/icon_home_wdsc.png" alt="">
              <p class='font_small'>我的收藏</p>
            </div>
            <div @click="goSomewhere()">
              <img src="../img/icon/icon_home_shdz.png" alt="">
              <p class='font_small'>收货地址</p>
            </div>
            <div @click="goSomewhere()">
              <img src="../img/icon/icon_home_wdzd.png" alt="">
              <p class='font_small'>我的推荐人</p>
            </div>
            <div @click="goSomewhere()">
              <img src="../img/icon/icon_home_kfzx.png" alt="">
              <p class='font_small'>客服中心</p>
            </div>
          </div>
        </div>
    <index style='z-index:100'></index>
    </div>
</template>
<script>
import index from '@/components/base'
export default {
    components:{
      index
    },
data(){
    return {
     number:[10000,0,0],
     mydata:'',
     userData:'',
     headerUrl:[
       'http://image.biaobaiju.com/uploads/20180303/17/1520067610-heSMRGmdls.jpg',
       'https://www.biaobaiju.com/uploads/thumb/20191227/30bfa04174f5a0487ef860293cc56063_300_300_1.jpg',
       'https://www.biaobaiju.com/uploads/thumb/20191102/16/1572683434-hLzqjDAWeR_300_300_1.jpg',
       'http://pic.ik123.com/uploads/allimg/190402/12-1Z402111335.jpg'
     ]
    }
},
created(){

  let obj={uid:localStorage.getItem("uid")};
  this.axios.get('beforearrive',{params:obj}).then(res=>{
    res.data.result.forEach((item,i)=>{
      if(i<5){
        this.number[0]-=item.number*item.price;
        this.number[0]<0?this.number[0]+=3000:null;
        this.number[1]=item.number*item.price*0.39;
        this.number[2]=item.number*item.price*0.11;
      }
    })
  })
  this.axios.get('user',{params:obj}).then(res=>{
    this.userData=res.data[0]
  })
  setTimeout(()=>{
    document.querySelector('#header').src=this.headerUrl[Math.floor(Math.random()*5)]
  },800)
},
methods:{
    goSomewhere(url){
      if(!url){
        this.$toast('该功能还在开发中')
        return
      }
      this.$router.push(url)
    }
}
}
</script>
<style scoped>
#header{
  width:30%;
  border-radius: 50%;
}
#top{
    width:100%;
    height:200px;
    position: absolute;
    top: 0;
    z-index:-1;
    border-radius: 0 0 15% 15%;
    opacity: 0.4;
}
.spread{
    z-index: 10;
    border-radius: 20px;
    position: relative;
    padding: 10px;
    box-sizing: border-box;
}
#header{
   margin: 5%;
}
#regOrLogin{
display: inline;
margin-top:10%;
}
#purch-menu{
  justify-content: space-around;
  padding: 0 10px;
  box-sizing: border-box;
}
#my_serve{
  flex-wrap: wrap;
  justify-content: space-around;
}
#my_serve>div{
  width:25%;
  padding: 0 !important;
}#my_serve>div img{
  width:60%;
}

</style>
