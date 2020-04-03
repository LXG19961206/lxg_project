<template>
  <div>
    <p class='font_dark fw600 font_big'>——待评价——</p>
      <div class='sendBox' v-for='(item,i) in goodMsg' :key='i' :id="'sendBox'+i" >
        <div class="sendBox_top">
          <p>优品速购</p>
          <p>等待用户评价</p>
        </div>
        <div class="sendBox_middle w-100">
          <img :src="item.img" alt="" class='w-25'>
          <div>
            <p class='font_small'>{{item.pname}}</p>
          </div>
        </div>
        <div class="sendBox_bottom por">
          <div class='spanBox'>
            <span @click='show(item.pid)'>我要评价</span>
          </div>
        </div>
        <div style='height:20px'></div>
        <div class='border'></div>
      </div>
      <div class="commiting poa" style='display: none;'>
        <p id='plzCom' class='font_small'>请给出您的评价</p>
        <div class='starBox'>
          <img src="../img/icon/icon_shopping_collect.png" alt="" @click='rank(1)'>
          <img src="../img/icon/icon_shopping_collect.png" alt="" @click='rank(2)'>
          <img src="../img/icon/icon_shopping_collect.png" alt="" @click='rank(3)'>
          <img src="../img/icon/icon_shopping_collect.png" alt="" @click='rank(4)'>
          <img src="../img/icon/icon_shopping_collect.png" alt="" @click='rank(5)'>
        </div>
        <textarea  border='0' v-model="rankObj.commit"
        name="" id="" cols="30" rows="5" placeholder="说说您的感想...">
        </textarea>
        <span class='btn' @click='submit'>提交</span>
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
     methods:{
      show(i){
        document.querySelector('.commiting').style.display='';
        this.pid=i;
      },
      submit(){
        let $=this.rankObj
        if(!$.uid||!$.pid||!$.star||!$.commit||!$.iscommit){
          this.$toast('请先完成评价')
          return
        }else{
          this.axios.get('finishSold',{params:this.rankObj}).then(res=>{
            console.log(res)
          })
          location.reload()
        }
      },
      rank(num){
        this.rankObj.star=num;
        this.rankObj.iscommit=true;
        this.rankObj.uid=localStorage.getItem("uid");
        this.rankObj.pid=this.pid;
        document.getElementById('plzCom').innerHTML=this.myRank[num-1]
        var arr=Array.from(document.querySelectorAll('.starBox>img'))
        arr.forEach(item=>item.src=require('../img/icon/icon_shopping_collect.png'))
        for(let item=0;item<5;item++){
           if(item<=num-1)
           arr[item].src=require('../img/icon/1206691.png')
        }
      }
     },
     data(){
       return {
         pid:'',
         goodMsg:[],
         myRank:['非常不满意','不满意','一般','满意','非常满意'],
         rankObj:{
           star:'',
           uid:'',
           pid:'',
           commit:'',
           iscommit:''
         }
       }
     },
     created(){
       var obj={uid:localStorage.getItem("uid")};
       this.axios.get('finishSold',{params:obj}).then(res=>{
         res.data.forEach(item=>{
           if(!item.iscommit){
           let obj={pid:item.pid};
           this.axios.get('product',{params:obj}).then(res=>{
             this.goodMsg.push({
               pid:res.data[0].pid,
               pname:res.data[0].pname,
               img:res.data[0].img,
               price:res.data[0].price,
               id:new Date().getTime()
             })
           })}
         })

       })
       console.log(this.goodMsg)
     },
}
</script>

<style scoped>


  .btn{
    padding: 10px 20px;
    background-color: #F44336;
    color:white;
    margin-top: 20px;
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
  .spanBox{
    clear: both;
    text-align: right;
    margin-right: 5px;
    margin-top: 5px;
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
  .commiting{
    width: 90%;
    top:20%;
    left:5%;
    height: 300px;
    background: #fff;
    border-radius: 10%;
    border:1px solid #ddd;
  }
  .commiting>p{
    margin-top: 15px;
    color:crimson;
  }
  .starBox{
    margin-top: 10px;
    display: flex;
    justify-content: space-around;
    padding: 15px;
    box-sizing: border-box;
  }
  .starBox>img{
    width:44px;
    height:44px;
  }
  textarea::placeholder{
    font-size: 15px;
  }
  .commiting>textarea{
    width:90%;
    margin:10px auto;
    border:0 !important;
    font-size: 15px;
    background-color: rgba(0,0,0,0.025);
    padding: 10px;
    box-sizing: border-box;
    outline: none;
  }
  .commiting>textarea:hover{
    border:0 !important;
  }
</style>
