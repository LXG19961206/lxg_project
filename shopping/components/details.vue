<template>
    <div stlye='overflow:hidden;'>
    <div class='outer_box'>
        <div class="img_box" :style="`transform:translate(-${swiper}px)`" οndragstart="return false">
            <img :src="detailsMsg.img" alt="" class='det_img' ><img :src="detailsMsg.img2" alt="" class='det_img' stlye><img :src="detailsMsg.img3" alt="" class='det_img' style>
        </div>
    </div>
        <div class='switch_point' @click='switchImg($event)'>
                <span data-toggle='0' :style="`background:${point_color[0]}`"></span>
                <span data-toggle='1' :style="`background:${point_color[1]}`"></span>
                <span data-toggle='2' :style="`background:${point_color[2]}`"></span>
        </div>
        <div class='noreg-flex'>
            <div id="left" class='w-75'>
                <p class='det_pname font_dark text_left m-2'>{{detailsMsg.pname}}</p>
                <div class='text_left m-2'>
                    <span class='goodSpan3'>包邮</span>
                    <span class='goodSpan3'>云仓</span>
                </div>
            </div>
            <div id='right' class='w-25 por'>
                <div class='m-4   font_small'>
                    <img src="../img/icon/ic_appbar_share_black.png" alt="" >
                    <p>分享</p>
                </div>
            </div>
        </div>
        <div class='m-2'></div>
        <div class='text_left'>
            <span class='m-2 font_small'>工厂价：<span class='font_small goodSpan5'>￥{{detailsMsg.price}}</span></span>
            <span class='goodSpan3 circle2 bg-danger opa7 mx-2'>立省{{detailsMsg.price2-detailsMsg.price}}元</span>
            <div class='m-2'></div>
            <span class='m-2 font_small'>市场价： <span class='font_small goodSpan6 '>￥{{detailsMsg.price2}}</span></span>
            <span class='font_light flr font_small mx-3'>热销{{detailsMsg.price*6}}件</span>
        </div>
        <div class='font_small text_left m-2'>
            <span >数量：
                <span class='calc' @click='add(-1)'>-</span>
                <span class='calcNum'>{{number}}</span>
                <span class='calc' @click='add(1)'>+</span>
            </span>
        </div>
        <div style='height:50px'></div>
        <div id="botBar" >
            <div class='w-50 flex-3 fll' >
                <div class='reset' @click="goSomewhere('class')">
                    <img src="../img/icon/ic_shop_info.png" alt="">
                    <p class='font_small'>店铺</p>
                </div>
                <div class='reset' @click="goSomewhere('cart')">
                    <img src="../img/icon/icon_shopping_cart.png" alt="">
                    <p class='font_small'>购物车</p>
                </div>
                <div class='reset' @click="goSomewhere('center')">
                    <img src="../img/icon/icon_shopping_collect.png" alt="">
                    <p class='font_small'>喜欢</p>
                </div>
            </div>
            <div class='flr w-50 por'>
                <div class='m-2' id='capsule'>
                    <span>立即购买</span><span
                    @click='toCart'>加购物车</span>
                </div>
            </div>
        </div>

    </div>
</template>
<script>

export default {
   methods:{
       goSomewhere(router){
         this.$router.push(router)
       },
       toCart(){
         this.$toast('加入成功,谢谢您的支持')
         this.cart.uid=localStorage.getItem("uid");
         this.cart.number=this.number;
         this.cart.pid=this.detailsMsg.pid;
         this.cart.price=this.detailsMsg.price;
         this.axios.get('cart',{params:this.cart}).then(res=>{
           console.log(res)
         })
         var routerToCart=()=>{
            this.$router.push('class')
         }
         setTimeout(routerToCart,300)

       },
       add(num){
           if(this.number==1&&num==-1)return
           this.number+=num;
       },
       switchImg(e){
           if(e.target.dataset.toggle){
            this.swiper=window.screen.width *e.target.dataset.toggle
            for(var i=0;i<3;i++){
                this.point_color[i]='#aaa'
            } this.point_color[e.target.dataset.toggle]='#fff'
            }

       }

   },
   data(){
       return{
           number:1,
           detailsMsg:'',
           swiper:0,
           point_color:[
               '#fff','#aaa','#aaa'
           ],
           cart:{
             pid:null,
             number:null,
             uid:null,
             price:null
           }
       }
   },
   created() {
    var pid=window.location.href.split('?')[1].split('=')[1]
    var obj={pid}
    this.axios.get('product',{params:obj}).then(res=>{
        this.detailsMsg=res.data[0]

    })
   },
}
</script>
<style scoped>

    .outer_box{
        position: relative;
        overflow: hidden;
        width:100%;
    }
    .det_img{
        width:calc(100%/3);
        height:375px;

    }
    .img_box{
        width: 300%;
        display: flex;
        transition: 0.5s all;
        overflow: auto;
    }
    .switch_point{
        position: absolute;
        top:320px;
        right:10%;
        z-index: 20;
    }
    .switch_point>span{
        display: inline-block;
        background-color: #efefef;
        width: 12px;
        height:12px;
        margin-right: 3px;
        border-radius: 50%;
    }
    .calc{
        display: inline-block;
        padding: 5px;
        width:20px;
        height:20px;
        background-color: #efefef;
        line-height: 24px;
        text-align: center;
    }
    .calcNum{
        display: inline-block;
        padding: 5px 8px;
        border:1px solid #ccc;
    }
    #botBar{
        position: fixed;
        bottom: 0;
        width: 100%;
    }
    #topBar>div>div{
        width:calc(100%/3);
    }
    #botBar img{
        width: 24px;
        height:24px;
        margin-bottom: -6px;
    }
    #capsule{
        width: 80%;
        height:32px;
        border-radius: 16px;
        background-color:lightcoral;
        color:white;
        font-size: 15px;
    }
    #capsule>span{
        display: inline-block;
        width: 52%;
        height:32px;
        line-height: 32px;
        border-radius:16px 0 0 16px;
    }
     #capsule>span:last-child{
        display: inline-block;
        width: 48%;
        border-radius:0 16px 16px 16px ;
        background-color:crimson;
    }
</style>
