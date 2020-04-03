<template>
    <div class="container">
    <webhead></webhead>
    <div>
        <div class="row mt-4 border p-3" v-for='(item,i) of usercart' :key='i' style='position:relative'>
            
           <div class="col-2">
               <input style='position:absolute;top:10%;left:5%;' 
			   v-model="item.buyornot"
			   @change='getTotal(i)'
			   :id="'check'+i"
			   type="checkbox" class='checkbox mr-3 mb-5'>
                <img :src="item.pimg" alt="" class='w-75 ml-4'>
            </div>
            <div class="col-5">
                <p class='main_font4'>{{item.pname}}</p>
                <p class='main_font'>{{item.pdetails.slice(0.20)}}</p>
                <p class='main_font'>数量:
                <button  class='badge  badge-light border-0' style='font-size:15px'
                id='subicon'
				
                @click='sub($event,i)'>－</button>
                <input  style='text-align:center;width:30px;border:0;outline:none' type="text"
                maxlength='3'
                :id="'numinput'+i"
                v-model='item.number'
                @change="change('numinput'+i,i)">
                <button  class='badge  badge-light border-0' style='font-size:15px'
                id='addicon'
				@change='getTotal()'
                @click='add($event,i)'>＋</button>
				&nbsp;&nbsp;
				<span>单价：￥{{item.price}}</span>
                </p>
            </div>
            <div class="col-3 price ml-4" :id='"price"+i'>¥ {{item.price*item.number}}</div>
            <div class="co1-1 buyOrDrop" >
                <button class='btn btn-success mt-4 buyint'
                @click='buySomeone(i)'
                >立即购买</button>
                <br class='mb-5'>
                <a class='mt-5 drop'
				href='javascript:;'
				@click='rmcart(i)'
				>我不想要了...</a>
            </div>
        </div>
		<div id="totalprice_box" class='mt-3 row'>
			<div class="main_font col">
				全选：<input type="checkbox"
				@change='selectAll($event)'>
			</div>
			<div class="col">
			<button class='btn btn-danger float-right ml-3'
			:disabled="ablepurchase"
			@click='pay'
			>进行结算</button>
			<button class='btn btn-primary float-right'
			disabled="disabled"
			>总价：￥{{total}}.00元</button>
			</div>
		</div>
    </div>
	
    </div>
</template>
<script>
import webhead from './head.vue'
export default {
   methods:{
       buySomeone(index){
           this.usercart[index].buyornot=true
           this.pay();
       },
       pay(){
		   let arr=[];
		   for(let i=0;i<this.usercart.length;i++){
			   if(this.usercart[i].buyornot){
				  arr.push({
					  'pid':this.usercart[i].pid,
					  'num':this.usercart[i].number,
                      'uname':document.cookie.split('=')[1],

				  })
			   }
		   }
		   this.axios.get('pay',{params:{arr}}).then(res=>{
                setTimeout(()=>{
                    this.$router.push('pay')
                },300)
		   })
		   
	   },
	   selectAll(evt){
			for(let j=0;j<this.usercart.length;j++){
				this.usercart[j].buyornot=evt.target.checked
				this.getTotal()
			}
	   },
	   getTotal(){
			   this.total=0
			   for(let i=0;i<this.usercart.length;i++){
			   if(this.usercart[i].buyornot==true){
			   this.total+=this.usercart[i].price*(this.usercart[i].number)}   
		   }
		   this.total>0?this.ablepurchase=false:this.ablepurchase=true
	   },
	   rmcart(i){
		   console.log(i)
		   var pid=this.usercart[i].pid
		   var uname=document.cookie.split('=')[1]
		   var obj={
			   pid,
			   uname}
		   var bool=confirm('您真的忍心移除宝宝嘛 >_< ~~~')
		   if(bool){
		   this.axios.get('rmcart',{params:obj}).then(res=>{
			   console.log(res)
			   location.reload();
		   })}
	   },
	   sub(evt,i){
         if(this.usercart[i].number>1)this.usercart[i].number--
		 else return
		  this.getTotal(i)
		  this.change("numinput"+i,i)
	  },
       add(evt,i){
         if(this.usercart[i].number<999)this.usercart[i].number++
		 else return
		 this.getTotal(i)
			this.change("numinput"+i,i) 
       },
       change(id,i){
			
             if(document.getElementById(id).value<1)document.getElementById(id).value=1
             document.getElementById(`price${i}`).innerHTML=`¥ ${this.usercart[i].number*this.usercart[i].price}`
			 this.getTotal(i)
			 
                    let pid=this.usercart[i].pid
                    let uname=document.cookie.split('=')[1]
                    let newnum=document.getElementById(id).value
                    var obj={'pid':pid,
                            'uname':uname,
                            'num':newnum }
						
        if(this.timer!==undefined){
             clearTimeout(this.timer)
           }
        this.timer=setTimeout(()=>{
		
            this.axios.get('udtcart',{params:obj}).then(res=>{
                console.log(res)
            })
        },2500)
       }
       
   },
   data(){
       return {
        usercart:[],
        timer:undefined,
        numinput:'numinput',
        price:'price',
		total:0,
        ablepurchase:true
       }
   },
   components:{
        webhead
    },
    created(){
        var uname=document.cookie.split('=')[1]
        console.log(uname)
        var obj={uname}
        this.axios.get('cartnum',{params:obj}).then(res=>{
            for(let i=0;i<res.data.length;i++){
                let pid=res.data[i].pid
                let num=res.data[i].num
                let obj={pid:pid-1}
                console.log(pid+'有'+num+'个')
                this.axios.get('details',{params:obj}).then(res=>{
                    
                let cartobj={
                    'pid':pid,
                    'number':num,
                    'pname':res.data[0].pname,
                    'pimg':res.data[0].imgsrc,
                    'pdetails':res.data[0].details,
                    'price':res.data[0].price,
					'buyornot':false
                }

                this.usercart.push(cartobj)
                })
				}   
        })
    }
}
</script>
<style scoped>
.drop{
    color:darkgray !important;
    font-size: 10px !important;
    margin-top: 50px;
    position: absolute;
    bottom: 10%;
    margin-left: 10px;
    cursor: pointer;
}
.drop:hover{
    color:rgb(17,122,55) !important;
    text-decoration: underline;
}

.buyOrDrop{
    position: relative;
}

.price{
    color:rgb(255,159,0);
    font-weight: 800;
    font-size: 1.3rem;
    margin-top: 30px;
}
#totalprice_box{
	padding: 10px 0;
	background-color: rgba(100,240,55,0.15);
	bottom: 0;
}
</style>
