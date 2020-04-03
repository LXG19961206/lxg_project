<template>
	<div>
	<div class="container">
		<webhead></webhead>
		<div class="row">
			<div class="col">
				
				<table class='table mt-5'>
					<tr>
						<th>订单号</th>
						<th style='width:10%' class='mr-2'></th>
						<th>商品</th>
						<th>描述</th>
						<th>单价</th>
						<th>数量</th>
						<th>总价</th>
						<th>时间</th>
					</tr>
					<tr v-for='(item,i) of paylist' :key='i'>
						<td class='main_font' v-text='new Date().getTime()+i+1'>{{}}</td>
						<td class='main_font'><img :src="item.imgsrc"  class='w-100' alt=""></td>
						<td class='main_font'
						:title='item.pname'
						>{{item.pname.slice(0,10)}}...</td>
						<td class='main_font'
						:title='item.details'
						>{{item.details.slice(0,15)}}...</td>
						<td class='main_font'>￥ {{item.price}}.00</td>
						<td class='main_font'>{{item.number}}</td>
						<td class='main_font'>￥ {{item.price*item.number}}.00</td>
						<td class='main_font'>{{item.buydate}}</td>
					</tr>
				</table>
				<div class='text-center row'>
					<div class="col-8"></div>
					<div class="col-4">
					<span class='float-right' id='payint'>
					  <span class=' price mr-4 '>¥{{total}}.00</span>
					  <button class='btn btn-success '
					  @click='show("paybox")'>立即支付</button>
					</span>

					</div>
				</div>
				
			</div>
		</div>
	</div>
	<div id="paybox">
		<div>
			<span class='main_font' @click='toggle("wechat")'>微信支付</span>
			<span class='main_font' @click='toggle("alipay")'>支付宝支付</span>
			<div>
				<img :src="src" alt="">
			</div>
			<button :class='cls'
			@click='finish()'
			>确认</button>
		</div>
	</div>
	<div id='award' class='p-1 text-center'>
		<br>
		<p class='main_font'>作者敲代码也是很幸苦的... <br>
		前端、后端、数据库、美工、产品经理、项目经理以及吃瓜群众都是他一个人...
		而且听说他既帅又萌...
		<br>
		要不...请他吃份炒饼补补脑子？
		<br><br>
		<button class='btn btn-sm btn-danger w-100'
		@click='hide'
		>好，我请 &nbsp;&nbsp; 我请还不行吗</button>
		</p>
	</div>
	</div>
</template>

<script>
import webhead from './head.vue'

export default{
	components:{
		webhead
	},
	data(){
		return {
			paylist:[],
			src:'img/wechatpay.png',
			cls:'btn btn-success pay_btn',
			total:0
		}
	},
	methods:{
		toggle(i){
		i=='wechat'?this.src='img/wechatpay.png':this.src='img/alipay.jpg'
		i=='wechat'?this.cls='btn btn-success pay_btn':this.cls='btn btn-primary pay_btn'
		},
		show(id){
			document.getElementById('award').style.display='block'
		},
		hide(){
			document.getElementById('award').style.display='none'
			document.getElementById('paybox').style.display='block'
		},
		finish(){
			var arr=[],arr2=[]
			for(var i=0;i<this.paylist.length;i++){
			arr[i]={'pid':this.paylist[i].pid,'uname':document.cookie.split('=')[1]}
			arr2[i]={'pid':this.paylist[i].pid,'uname':document.cookie.split('=')[1],
			'num':this.paylist[i].number}
			}
			console.log(arr2)
			this.axios.get('payfinish',{params:arr}).then(res=>{
				console.log(res)	
			})
			this.axios.get('paid',{params:arr2}).then(res=>{
				console.log(res)
				this.$router.push('index')
			})
			alert('付款成功')
			
			
		}
	},
	
	created(){
		var obj={"uname":document.cookie.split('=')[1]};
		this.axios.get('paymethod',{params:obj}).then(res=>{
			for(let i=0;i<res.data.length;i++){
				let dtlobj={pid:res.data[i].pid-1,
							uname:document.cookie.split('=')[1]}
				var number=res.data[i].num
				var buydate=res.data[i].buydate
				this.axios.get('details',{params:dtlobj}).then(res=>{
					var result=res.data[0]
					result.number=number
					result.buydate=buydate
					this.total+=result.price*result.number
					this.paylist.push(result)
				})
				
			}
			
			console.log(this.paylist)
		})	
	}
}
</script>

<style scoped>
#paybox>div>span{
	display: inline-block;
	padding: 15px 0;
	width: 150px;
	background-color:lightgray;
	cursor:pointer;
	text-align: center;
}
#paybox>div>span:hover{
	background-color: white;
	font-weight: 800;	
}
#paybox{
	position: fixed;
	top: 50%;
	left: 50%;
	transform:translateX(-50%) translateZ(0) translateY(-50%);
	display: none;
	z-index: 20;
}
#paybox>div img{
	width: 300px;
	height: 400px;	
}
.pay_btn{
	width: 300px !important;	
}
#award{
	border:1px solid black;
	width: 30%;
	position: fixed;;
	left: 35%;
	top: 35%;
	background-color: white;
	display: none;
	z-index: 30;
}
.price{
    color:rgb(255,159,0);
    font-weight: 800;
    font-size: 1.3rem;
    margin-top: 30px;
}

</style>
