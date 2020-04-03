<template>
  <div >
    <div class="payBox">
      <div class="box_top">
        <p>请输入支付密码</p>
      </div>
      <div class="box_middle">
        <ul>
          <li><span></span></li>
          <li><span></span></li>
          <li><span></span></li>
          <li><span></span></li>
          <li><span></span></li>
          <li><span></span></li>
        </ul>
        <br>
        <p class='flr m-4 font_light'>忘记密码</p>
        <br>
      </div>
      <div class="box_bottom" @click='payInput($event)'>
        <div>1</div>
        <div>2</div>
        <div>3</div>
        <div>4</div>
        <div>5</div>
        <div>6</div>
        <div>7</div>
        <div>8</div>
        <div>9</div>
        <div></div>
        <div>0</div>
        <div>删除</div>
      </div>
    </div>
    <div id="paylist">
          <div height='30'></div>
          <p class='fw600 font_dark font_normal'
          @click='goSomeWhere(`center`)'>——待付款——</p>
          <div  v-for='(item,i) in payData' :key='i' :id="i">
            <div class="left">
              <img :src="item.img" alt="">
            </div>
            <div class="right">
              <p class='p_title font_dark font_small text_left'>
              {{item.pname.slice(0,20)}}...&nbsp;&nbsp;&nbsp;x{{item.number}}</p>
              <div style='height:5px;'></div>
              <div class='priceAndNumber'>
                <p class='p_price  text_left'>￥{{item.price*item.number}}</p>

              </div>
              <div class='accounts'>
                <button class='p_price'
                @click='toPay(i)'>我要付款</button>
                <p>取消订单</p>
              </div>
            </div>
          </div>
          <div id='bottomBar'>
            <div class="bottomBar_left">
              <span>合计: <span style='color:#F08080'>￥{{total}}</span></span>
            </div>
            <div class="bottomBar_right">
              <p @click='toPay(-1)'>付款</p>
            </div>
          </div>

    </div>
  </div>
</template>

<script>
  export default{
    created(){
      this.axios.get('pay',{params:{uid:localStorage.getItem("uid")}}).then(res=>{
        this.baseData=res.data
        res.data.forEach(item=>{
          let obj={pid:item.pid};
          this.axios.get('product',{params:obj}).then(res=>{
             this.total+=res.data[0].price*item.number
             this.payData.push({
               number:item.number,
               price:res.data[0].price,
               img:res.data[0].img,
               pname:res.data[0].pname
             })
          })
        })
      console.log(this.payData)
      })
    },
    methods:{
      goSomeWhere(url){
        this.$router.push(url)
      },
      toPay(index){
      if(this.baseData.length==0)return
      var $=document.querySelector.bind(document)
      $('#bottomBar').style.display='none'
      $('.payBox').style.display='block'
      this.payArray=[]
      index==-1?
      this.baseData.forEach(item=>this.payArray.push(item)):
      this.payArray.push(this.baseData[index])
      console.log(this.payArray)
      },
      payInput(evt){
        var spans=document.querySelectorAll('.box_middle span')
        var item=evt.target.innerHTML
        if(item=='')return;
        if(item=='删除'){
          this.password.pop();
          spans[this.password.length].style.display='none'
        }
        (Number(item)>=0&&Number(item)<=9)
        ?this.password.push(item)
        :null

        this.password.forEach((item,i)=>{
          if(i>5) return
          spans[i].style.display='block'
        })
        if(this.password.length==6){
          if(this.password.toString()==this.check){
            this.$toast('付款成功')
            let obj={arr:this.payArray};
            this.axios.get('payment',{params:obj}).then(res=>{
              console.log(res)
            })
            this.$router.push('index')
          }else{
            this.$toast('密码错误')
            this.password=[];
            new Array(6).fill('1').forEach((item,i)=>
            spans[i].style.display='none'
            )
          }
        }
      }
    },
    data(){
      return {
        check:'1,2,3,4,5,6',
        password:[],
        payData:[],
        baseData:[],
        total:0,
        payArray:[]
      }
    }
  }
</script>

<style scoped>
#app{
  background-color: rgba(0,0,0,0.025);
}
.payBox{
  position: fixed;
  width: 100%;
  bottom: 0;
  margin: 0;
  padding: 0;
  background: #fff;
  display: none;
  z-index: 100;
}
.payBox>.box_top{
  font-size: 18px;
  font-weight: 600;
  text-align: center;
  padding:15px;
  margin: auto;
  border-bottom: 1px solid #ccc;
  margin-bottom: 20px;
}
.box_middle{
  position: relative;
}
.payBox ul{
  display: flex;
  justify-content:space-around;
  width:90%;
  padding: 0;
  margin: auto;
}
.payBox ul>li{
  list-style: none;
  border:1px solid #ccc;
  width:calc(100%/6);
  height:60px;
  position: relative;
}
.payBox ul>li>span{
  display: inline-block;
  width:25px;
  height:25px;
  border-radius: 50%;
  background-color: #000;
  position: absolute;
  left: 50%;
  top:50%;
  transform: translate(-50%,-50%);
  display: none;
}
ul>li:first-child{
  border-radius:15% 0 0 15% ;
}
ul>li:last-child{
  border-radius:0 15% 15% 0 ;
}
.box_bottom{
  display: flex;
  flex-wrap: wrap;
  width: 100%;
}
.box_bottom>div{
  width:calc(100%/3);
  height:60px;
  padding: 10 0px;
  border:0.5px solid #bbb;
  border-top: 0;
  border-right: 0;
  box-sizing: border-box;
  color:#111;
  font-size: 25px;
  font-weight: 600;
  line-height: 60px;
}
.box_bottom>div:first-child,.box_bottom>div:nth-child(2),.box_bottom>div:nth-child(3){
  border-top:0.5px solid #bbb;
}
.box_bottom>div:last-child,.box_bottom>div:nth-child(10){
  background-color: #ddd;
}
.box_bottom>div:first-child,.box_bottom>div:nth-child(4),.box_bottom>div:nth-child(7),
.box_bottom>div:nth-child(10){
  border-left: 0;
}

#paylist>div{
   margin:auto;
   width:95%;
   display: flex;
   padding: 10px;
 }
 #bottomBar{
   position: fixed;
   width: 100%;
   padding: 0 !important;
   bottom: 0;
   background-color: #efefef;
   display: flex;

 }
 .bottomBar_left{

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

</style>
