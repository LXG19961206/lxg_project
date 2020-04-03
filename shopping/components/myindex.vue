<template style='overflow:auto'>
    <div id='box'  class='my_bg3'>
        <div id="topBar" class='verti_center'>
            <img src="../img/icon/ic_appbar_msg_white.png" alt="" style='left:2%'>
            <input type="" placeholder="爆米花" class='my_input search_input'>
            <img src="../img/icon/ic_appbar_share_white.png" alt="">
        </div>
        <div id='goodlist' style='over-flow:hidden' class='flex'>
            <div id="goodlist_left">
                <span class='gooditem font_white' >精选</span>
                <span class='gooditem font_white' @click='goSomewhere(0,`class`)'>彩妆护肤</span>
                <span class='gooditem font_white' @click='goSomewhere(1,`class`)'>食品生鲜</span>
                <span class='gooditem font_white' @click='goSomewhere(2,`class`)'>服装鞋靴</span>
                <span class='gooditem font_white' @click='goSomewhere(4,`class`)'>数码家电</span>
                <span class='gooditem font_white' @click='goSomewhere(3,`class`)'>个人护理</span>
                <span class='gooditem font_white' @click='goSomewhere(5,`class`)'>家居家纺</span>
            </div>
            <div id="goodlist_right" @click='goSomewhere(-1,`class`)'>
                <img src="../img/icon/icon_category_white.png" alt="" style='margin:14px 10px;width:28%;'>
            </div>
        </div>
        <div id='swiper_box'>
        <mt-swipe :auto="4000"  style='height:180px'>
            <mt-swipe-item>
                <img class='swiperimg' @click='goSomewhere(2,`class`)'
                src="../img/images/459adf11689c66dede749db1def67d49c3823b00a04944ebe16752b7ea630301.jpg" alt="">
            </mt-swipe-item>
            <mt-swipe-item>
                <img class='swiperimg' @click='goSomewhere(`product?class=2a`)'
                src="../img/images/2ebf909a96c2a1113c5f08dfa8723f1385918b4bf6830ac15adc3ff09779c7c1.jpg" alt="">
            </mt-swipe-item>
            <mt-swipe-item>
                <img class='swiperimg' @click='goSomewhere(`product?class=2a`)'
                src="../img/images/1aa15eb822dc024f4846283e7bbc59b7613e289d01cbeb727dec2be41b592eb6.jpg" alt="">
            </mt-swipe-item>
            <mt-swipe-item>
                <img class='swiperimg' @click='goSomewhere(`product?class=3d`)'
                src="../img/images/8ce76a85ab8e229b0bfecc4b25066efb9aff6de806c2ea261884e1975bb056d8.jpg" alt="">
            </mt-swipe-item>
        </mt-swipe>
        </div>
        <div class="flex menu">
            <div class="flex-item" @click='goSomewhere(2,`class`)'>
                <img src="../img/images/1a7a1e4d6d4276f4.jpg" alt="">
                <p class='font_dark'>每日上新</p>
            </div>
            <div class="flex-item" @click='goSomewhere(`product?class=2a`)'>
                 <img src="../img/images/48740336388.jpg" alt="">
                <p class='font_dark'>精选好物</p>
            </div>
            <div class="flex-item" @click='goSomewhere(`product?class=3b`)'>
                 <img src="../img/images/b092d9602323.jpg" alt="">
                <p class='font_dark'>超级返利</p>
            </div>
            <div class="flex-item" @click='goSomewhere(`product?class=4a`)'>
                 <img src="../img/images/b4fa1806ccbfaee.jpg" alt="">
                <p class='font_dark'>超级转卖</p>
            </div>
            <div class="flex-item" @click='goSomewhere(null)'>
                 <img src="../img/images/8f7fe1517f6.jpg" alt="">
                <p class='font_dark'>升级云店</p>
            </div>
        </div>
        <p class=' font_big font_bold'>——猜您喜欢——</p>
        <p class='font_dark font_normal'>GUESS YOU LIKE</p>
        <div class="goodsBox">

            <div class="goodsBox-item" v-for='(item,i) in products' :key='i'
            @click='goSomewhere(item.pid,`details`)'>
                <img :src='item.img' alt="" style='width:100%'>
                <div style='height:5px;'></div>
                <span class='goodSpan1'>精选</span>
                <span class='goodSpan2'>{{item.pname}}</span>
                <div style='height:5px;'></div>
                <span class='goodSpan3'>包邮</span>
                <span v-if='Math.random()>0.5?true:false' class='goodSpan4'>新品</span>
                <div style='width:100%;height:5px;'></div>
                <span class='goodSpan5'>￥{{item.price}}</span>
                <span class='goodSpan6'>￥{{item.price2}}</span>
            </div>

        </div>
        <div id='hotsale'>
            <p class=' font_big font_bold'>——精选热卖——</p>
            <p class='font_dark font_normal'>HOT SALE PRODUCTS</p>
            <img :src="item" alt="" v-for='(item,i) of hotSaleImg' :key='i'
            @click='goSomewhere(hotSaleUrl[i])'>
        </div>
        <index></index>
    </div>

</template>
<script>
import index from '@/components/base'
export default {
    created(){
      this.axios.get('product').then(res=>{
        let length=res.data.length
        for(let i=0;i<length;i++){
         if(this.products.length>20)break
         this.products.push(res.data[Math.floor(Math.random()*length)])
        }
        console.log(this.products)
      })
    },
    components:{
      index
    },
    methods:{
      goSomewhere(url,where){
        if(url===null){
          this.$toast('移动端尚未开放该功能')
          return
        }
        where=='class'?this.$router.push(`class?group=${url}`):where=='details'?
        this.$router.push(`details?pid=${url}`):
        this.$router.push(url)
      }
    },
    data(){
        return{
            products:[],
            hotSaleImg:[
            require('../img/images/1208f16b88f6f6b4ef4abd9b15a66e3c2a877ef494c95b43e8da90648a0bcdc8.jpg'),
            require('../img/images/459adf11689c66dede749db1def67d49c3823b00a04944ebe16752b7ea630301.jpg'),
            require('../img/images/1aa15eb822dc024f4846283e7bbc59b7613e289d01cbeb727dec2be41b592eb6.jpg'),
            require('../img/images/11dba3b310eb3ca1f9b8096888debee2d169ba45903da3e2f2753ee908506c26.jpg'),
            require('../img/images/e8c87849155e33a64a4a619224b7e7cc044194988375bd25556fc23cd1643261.jpg')
            ],
            hotSaleUrl:[
              'product?class=0c','class?group=-1','product?class=2b','product?class=3d',
              'product?class=3e'
            ]
        }
    }
}
</script>

<style scoped>
p{
    margin: 0;
    padding: 0;
}
.swiperimg{
    width:100%;
}
.my_bg1{
     background: linear-gradient(to right, #d53369, #cbad6d);
}
.my_bg2{
    background: linear-gradient(to right, #a1ffce, #faffd1);
}
.my_bg3{
    background: linear-gradient(to right, #eecda3, #ef629f);
}
#box{
    height:300px;
    border-radius:0 0 77% 5%;
}
.my_input{
    width:75%;
    background-color: #fff;
    outline: none;
    border:0;
    height:30px;
    border-radius: 15px;
    text-indent:50px;
    margin-top: 15px;
    position: relative;
    top: -5px;
}
.my_input::placeholder{
    text-indent:50px;
}
.search_input{
    background-image: url(../img/icon/ic_appbar_search_black.png);
    background-repeat: no-repeat;
    background-size: 25px;
    background-position: 5% center;
}
#topBar>img{
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    right: 2%;

}
#topBar{
    position: relative;
    padding: 7px;
}
#goodlist_left{
    width: 80%;
    display: flex;
    white-space: nowrap;
    overflow: auto;
}
#goodlist_left::-webkit-scrollbar {display:none}
.gooditem{
    font-size: 16px;
    width: 25%;
    display: inline-block;
    margin: 5px 10px;
    padding: 5px;

}
.gooditem:hover{
   font-size: 18px;
    border-bottom: 2px solid white;
    border-radius: 0 0 50% 30%;
}
.font_white{
    color:white;
    font-family: yehei;
}
.font_dark{
    color:#666;
    font-family: yahei;
    font-size: 14px;
    font-weight: 600;
}
.flex{
    display: flex;
    justify-content: space-around;
    width:100%;
}
.flex>div{
    width:17%;
    text-align: center;
    padding:0 !important;
}
.flex>.goodsBox_item{
    width: 50%;
}
.goodsBox{
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}
.goodsBox-item{
    width: 50%;
    text-align: left;
    border:1px solid #efefef;
    box-sizing: border-box;
    padding: 10px;
}
.goodSpan1{

    color:white;
    display: inline-block;
    border-radius: 7px;
    background-color:crimson;
    padding:1px 5px;
}
.goodSpan2{
  font-size: 14px;
}
.goodSpan3,.goodSpan4{
    border:crimson 1px solid;
    color:crimson;
    font-size: 13px;
    padding: 4px;
}
.goodSpan5{
    color:crimson;
    font-size: 18px;
    margin-top: 10px;
}
.goodSpan6{
    color:#999;
    font-size: 17px;
    margin-top: 10px;
    text-decoration: line-through;
}
.menu>div>img{
    width:100%;
}
.menu p{
  font-size:13px;
}
#hotsale>img{
    width:95%;
    margin:5px auto;

}
.font_big{
    font-size: 19px;
}
.font_small{
    font-size: 14px;
}
.font_normal{
    font-size: 16px;
}
.font_bold{
    font-weight: 600;
}

</style>
