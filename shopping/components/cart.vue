<template>
    <div>
        <div id="cart">
          <p class='fw600 font_dark font_big'
          @click="goSomewhere('index')">——购物车——</p>
          <div  v-for='(item,i) in myCart' :key='i' :id="i">
            <div class="left">
              <input type="checkbox" class='center-y' v-model="number[i].isChecked"
              @change="select(i,$event)">
              <img :src="item.img" alt="">
            </div>
            <div class="right">
              <p class='p_title font_dark font_small text_left'>{{item.pname}}</p>
              <div style='height:5px;'></div>
              <div class='priceAndNumber'>
                <p class='p_price  text_left'>￥{{number[i].uPrice.toFixed(2)*number[i].number}}</p>
                <span class='number font_dark font_small'>
                  <span class='calc' @click='add(-1,i)'>-</span>
                  <span class='calcNum'>{{number[i].number}}</span>
                  <span class='calc' @click='add(1,i)'>+</span>
                </span>
              </div>
              <div class='accounts'>
                <button class='p_price' @click="account(i,$event)">我要结算</button>
                <p @click='remove(item.pid)'>不想要了</p>
              </div>
            </div>
          </div>

		</div>
    <div id='bottomBar'>
      <div class="bottomBar_left">
        <input type="checkbox" @change='select(-1,$event)'><span> 全选</span>
        <span>合计: <span style='color:#F08080'>￥{{total||0}}</span></span>
      </div>
      <div class="bottomBar_right">
        <p @click='account(-1)'>结算</p>
      </div>
    </div>
    </div>
</template>

<script>
  import login from '@/components/login'
  export default{
    created(){
    var uid=localStorage.getItem("uid");
    uid?null:this.$router.push('login')
		var obj={uid};
		this.axios.get('cart',{params:obj}).then(res=>{
			res.data.forEach(item=>{
        this.number.push({
          number:item.number,
          price:item.price,
          uPrice:item.price,
          isChecked:false
        })
        let obj={pid:item.pid}
        this.axios.get('product',{params:obj}).then(res=>{
          this.myCart.push(res.data[0])
        })
      })
		})
    console.log(this.myCart)
	},
    methods:{
    remove(pid){
      let obj={
        uid:localStorage.getItem("uid"),
        pid
      }
      this.$toast('该商品已经移除')
      this.axios.get('udtcart',{params:obj}).then(res=>{
        console.log(res)
      })
      location.reload();
    },
    goSomewhere(url){
      this.$router.push('class')
    },
    account(index){

      if(index!=-1)
      this.number[index].isChecked=true;
      var bool=this.number.some(item=>{
        return item.isChecked==true
      })
      if(!bool){return}
      index==-1?
      this.number.forEach((item,i)=>{
      if(!item)return
			if(item.isChecked){
				var obj={
					uid:localStorage.getItem("uid"),
					pid:this.myCart[i].pid,
					number:this.number[i].number,
					price:this.number[i].price
				}
				this.axios.get('pay',{params:obj}).then(res=>{
					console.log(res)
				})
			}
		})
		:this.axios.get('pay',{params:{
      uid:localStorage.getItem("uid"),
      pid:this.myCart[index].pid,
      number:this.number[index].number,
      price:this.number[index].price
    }}).then(res=>{
      console.log(res)
    })
    var routerToPay=()=>{
       this.$router.push('pay')
    }
    setTimeout(routerToPay,300)

      },
      calc(){
        this.total=0
        this.number.forEach(item=>{
          item.isChecked?this.total+=item.price*item.number:null

        })
      },
      select(prop,evt){
        if(prop==-1){
        evt.target.checked?
        this.number.forEach(item=>{item.isChecked=true;
        this.calc()})
        :this.number.forEach(item=>{item.isChecked=false;this.total=0})
        }else{
         this.calc()
        }

      },
      tolog(){
        this.$router.push('login')
      },
      add(num,index){
          if((this.number[index].number==1&&num==-1)||this.number[index].number==99)return
          this.number[index].number+=num;
          var obj={
            uid:localStorage.getItem("uid"),
            pid:this.myCart[index].pid,
            number:this.number[index].number,
            price:this.number[index].price
          }
          var _this=this
          this.calc()
          return ~function(){
          if(_this.timer)clearTimeout(_this.timer)
            _this.timer=setTimeout(function(){
             _this.axios.get('udtcart',{params:obj}).then(res=>{
               console.log(res)
             })
          },2000)}()
      }
    },
    data(){
      return {
        timer:null,
        number:[],
		    myCart:[],
        total:0
      }
    }
  }
</script>
<style scoped>
 .number{
  color:#999;
 }
 .number>.calc{
   display: inline-block;
   width:18px;
   height:18px;
   padding: 3px;
   border:1px solid #eee;
 }
 #cart>div{
   margin:auto;
   width:95%;
   display: flex;
   padding: 10px;
 }
 #bottomBar{
   position: fixed;
   width: 100%;
   height:50px;
   bottom: 0;
   background-color: #efefef;


   display: flex;
 }
 .bottomBar_left{
   overflow: hidden;
   width:60%;
   padding: 15px;
   box-sizing: border-box;
 }
 .bottomBar_left>input{
   float: left;
 }
 .bottomBar_left>span{
   float: left;
 }
 .bottomBar_left>span+span{
   float: right;
 }
 .bottomBar_right{
   height: 50px !important;
   width:40%;
   background: coral;
   padding: 15px 0;
   text-align: center;
   color:white;
 }
 .left{
   width:50%;
   position: relative;
 }
 .left [type="checkbox"]{
   position: absolute;
   top: 5%;
   left: 5%;
 }
 .left img{
   width:90%;
   border-radius:8%;
 }
 .right{
   width:50%;
   padding: 10px;
 }
.p_price{
  color:#F08080;
}
.priceAndNumber{
  display: flex;
  justify-content: space-between;
}
.accounts{
  display: flex;
  font-size: 14px;
  margin-top: 5px;
  justify-content: space-between;
}
.accounts>button{
   border:1px solid #efefef;
   padding: 3px;

}
.accounts>button:hover{
  border:0;
}
.accounts>button+p{
  color:#ddd;
  padding: 3px;
}

</style>
