<template>
  <div id="ifBox">
    <div v-if='switchPages[0]'>
      <p class='fw600 font_big'>——已发货——</p>
      <div class='sendBox' v-for='(item,i) in goodSend' :key='i' :id="'sendBox'+i" >
        <div class="sendBox_top">
          <p>优品速购</p>
          <p>卖家已发货</p>
        </div>
        <div class="sendBox_middle w-100">
          <img :src="item.img" alt="" class='w-25'>
          <div>
            <p class='font_small'>{{item.pname}}</p>
          </div>
        </div>
        <div class="sendBox_bottom por">
          <p>共{{item.number}}件商品 &nbsp;合计:￥{{item.number*item.price}}</p>
          <br>
          <div class='spanBox'>
            <span @click='help(`延长物流`)'>延长物流</span>
            <span @click='details(i)'>查看物流</span>
            <span @click='cancel(`确认收货`,item.pid)'>确认收货</span>
          </div>
        </div>
        <div class="sendMsg poa" @click='details()' style='display: none;'>
          <p><span class='date'>{{(Number(new Date().getMonth())+1)+'-'+(Number(new Date().getDate())-3)}}</span>
          您的快件已由<span>{{item.city1}}</span>发往<span>{{item.city2}}</span>中转站</p>
          <div style='height:10px'></div>
          <p>您的快件已经到达<span>{{item.city2}}</span></p>
          <div style='height:10px'></div>
          <p><span class='date'>{{(Number(new Date().getMonth())+1)+'-'+(Number(new Date().getDate())-2)}}</span><span>{{item.city2}}</span>已发出</p>
          <div style='height:10px'></div>
          <p>您的快件已到达<span>{{item.city3}}</span>中转站</p>
          <div style='height:10px'></div>
          <p><span class='date'>{{(Number(new Date().getMonth())+1)+'-'+(Number(new Date().getDate())-1)}}</span><span>{{item.city3}}</span>已发出</p>
          <div style='height:10px'></div>
          <p><span class='date'>{{(Number(new Date().getMonth())+1)+'-'+(Number(new Date().getDate()))}}</span>包裹到达<span>{{item.city4}}</span></p>
        </div>
        <div style='height:20px'></div>
        <div class='border'></div>
        </div>
      </div>
      <div v-else>
        <p class='fw600 font_big'>——待发货——</p>
        <div class='sendBox' v-for='(item,i) in notSend' :key='i' :id="'sendBox'+i" >
          <div class="sendBox_top">
            <p>优品速购</p>
            <p>等待卖家发货</p>
          </div>
          <div class="sendBox_middle w-100">
            <img :src="item.img" alt="" class='w-25'>
            <div>
              <p class='font_small'>{{item.pname}}</p>
            </div>
          </div>
          <div class="sendBox_bottom por">
            <p>共{{item.number}}件商品 &nbsp;合计:￥{{item.number*item.price}}</p>
            <br>
            <div class='spanBox'>
              <span @click='help(`催发货`)'>催促卖家</span>
              <span @click='cancel(`退货`),item.pid'>退货</span>
            </div>
          </div>
          <div style='height:20px'></div>
          <div class='border'></div>
        </div>
      </div>
      <index></index>
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
        goodSend:[],
        notSend:[],
        cityName:'',
        switchPages:false
      }
    },
    methods:{
      help(msg){
        this.$toast(`已帮助您${msg}`)
      },
      cancel(msg,pid){
          this.$messagebox.confirm(`您确实要${msg}吗`).then(()=>{
              var obj={
                  uid:localStorage.getItem("uid"),
                  pid
              }
              this.axios.get('beforeArrive',{params:obj}).then(res=>{
                console.log(res)
                location.reload()
              })
          })
      },
      details(index){
        new Array(this.goodSend.length).fill('').forEach((item,i)=>{
          document.querySelector(`#sendBox${i} .sendMsg`).style.display='none'
        })

        var $=document.querySelector(`#sendBox${index} .sendMsg`)
        if($)$.style.display='block'
      }
    },
    created(){
      window.location.href.split('#/')[1]=='beforeArrive'?
      this.switchPages=[true,false]:
      this.switchPages=[false,true]
      let obj={uid:localStorage.getItem("uid")};
      this.axios.get('beforeArrive',{params:obj}).then(res=>{
        this.cityName=res.data.arr
        res.data.result.forEach((item,i)=>{
          if(i%2==0&&i%3!=0){
            this.axios.get('product',{params:{
             pid:item.pid
            }}).then(res=>{
              this.goodSend.push({
                pid:res.data[0].pid,
                pname:res.data[0].pname,
                number:item.number,
                price:item.price,
                img:res.data[0].img,
                city1:this.cityName[Math.floor(Math.random()*41)],
                city2:this.cityName[Math.floor(Math.random()*41)],
                city3:this.cityName[Math.floor(Math.random()*41)],
                city4:this.cityName[Math.floor(Math.random()*41)],
                date:Date.now()+`${i}`
              })
            })
          }else{
            this.axios.get('product',{params:{
             pid:item.pid
            }}).then(res=>{
              this.notSend.push({
                pname:res.data[0].pname,
                number:item.number,
                price:item.price,
                img:res.data[0].img,
                city1:this.cityName[Math.floor(Math.random()*41)],
                city2:this.cityName[Math.floor(Math.random()*41)],
                city3:this.cityName[Math.floor(Math.random()*41)],
                city4:this.cityName[Math.floor(Math.random()*41)],
                date:Date.now()+`${i}`
              })
            })

          }
        })
      })
      console.log(this.goodSend)
    },
  }
</script>

<style scoped>
*{
  margin: 0;
  padding: 0;
}
.sendBox{
  clear: both;
  position: relative;
  box-sizing: border-box;
  padding: 10px;
}
.sendBox_top{
  padding: 5px;
  background-color: #fff;
}
.sendBox_top p{
  float: left;
  font-size: 18px;
  font-weight: 600;
}
.sendBox_top p+p{
  float: right;
  color:#FF7F50;
  font-family: "arial narrow";
}
.sendBox_top p+p::after{
  content:'';
  display: block;
  clear:both;
}
.sendBox_middle{
  clear: both;
  display: flex;
  background-color: rgba(0,0,0,0.025);
}
.sendBox_middle img{
  width:25%;
}
.sendBox_middle p{
  margin-left: 3px;
  padding: 5px;
  text-align:left;
}

.sendBox_bottom p{
  float: right;
  margin: 5px;
  font-weight: 600;
}
.sendBox_bottom p::after{
  content:'';
  clear: both;
  display: block;
  height:5px;
}

.spanBox{
  clear: both;
  text-align: right;
  margin-right: 5px;
}
.spanBox span{
  margin-top: 5px;
  border:1px solid #aaa;
  padding: 5px;
  height:30px;
  line-height: 30px;
  border-radius: 15px;
  box-sizing: border-box;
  font-weight: 600;
}
.spanBox span:hover{
  border:1px solid #FF7F50;
  color:#FF7F50;
}
.border{
  height:1px;
  background-color: #bbb;
}
.sendMsg{
  width: 80%;
  background-color: #fff;
  top:10%;
  left: 50%;
  transform: translate(-50%);
  margin: auto;
  border-radius: 10%;
  overflow-y: auto;
  padding: 15px;
}
.sendMsg p{
  text-align: center;
}
.sendMsg span{
  color:#FF7F50;
  margin: 0 5px;
}
.date{
  float: left;
  color:#CCC !important;
  padding: 3px;
  border:1px solid #999;
  border-radius: 10%;
}
</style>
