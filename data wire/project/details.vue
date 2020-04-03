<template>
	<div id="box bg-gray">
		<div class="container">
		<webhead></webhead>
		<div class="row mb-5">
			<img src="img/1572941699.jpg" class='w-100 ' alt="">
		</div>
		<div class='row bg-white no-gutters mt-5'>
			
			<div class="col-5">
				<img :src="pdetails.imgsrc" class='w-75 ' alt="">
			</div>
			<div class="col-5 mt-1 p-2 mb-3" >
				<h4>{{pdetails.pname}}</h4>
				<span class='mt-5'>
					<img src="img/time.jpg" alt="" class="smicon">
					{{pdetails.viewnum}}
					<img src="img/view.jpg" alt="" class="smicon">
					{{pdetails.updtime.slice(0,10)}} {{pdetails.updtime.slice(11,19)}}
				</span>
				
				<p class='mt-3 main_font'>{{pdetails.details}}</p>
				
				<span class='main_font mr-5'>型号：{{pdetails.pro_model}}</span>
				<span class='main_font mr-5'>品牌：{{pdetails.pro_brand}}</span>
				<hr>
				<span class='main_font mr-5'>类型：{{pdetails.pro_type}}</span>
				<span class='main_font mr-5'>{{pdetails.pro_capacity==''?'':`参数：${pdetails.pro_capacity}`}}</span>
				<hr>
				<button class='btn btn-danger mt-3' @click='toTmall'>天猫购买</button>
				<button class='btn btn-success mt-3 ml-3' @click='add_to_cart($event)'>加入购物车
				</button>
				
				</div>
				<img src="img/cart.png" alt="" id="cart" :style='my_cart' @click='toUCart'>
				
				<button id='num' class='badge badge-pill badge-success'
				style='outline: none;border:0;'>{{number}}</button>
			</div>
		</div>
	</div>
</template>

<script>
	import webhead from './head.vue'
	
	export default{
	methods:{
		toUCart(){
			this.$router.push('cart')
		},
		toTmall(){
			window.open('https://greenconnection.tmall.com/')
		},
		add_to_cart(e){
			if(document.querySelector('.login').innerHTML=='登录'){
				alert('请您先登录')
				this.$router.push('login')
			}else{
				var uname=document.cookie.split('=')[1]
				var str=window.location.href;
				var pid=(str.split('?')[1]).split('=')[1];
				var obj={
					uname,pid
				}
				var url='cart'
				this.axios.get(url,{params:obj}).then(res=>{
					console.log(res)
				})
			}
			var num=document.getElementById('num')
			var x=e.clientX,y=e.clientY
			console.log(x,y)
			this.my_cart='transform:rotate(15deg) translate(10px);'
			this.number+=1
			setTimeout(()=>{
				this.my_cart=''
			},300)
			this.number==0?num.style.display='none':num.style.display='block'
		 }
	},
	data(){
		return {
			pid:'',
			pdetails:'',
			my_cart:'',
			number:0
		}
	},
	
	created(){
		var uname=document.cookie.split('=')[1]
		
		var str=window.location.href;
		this.pid=(str.split('?')[1]).split('=')[1];
		console.log(this.pid,typeof(this.pid));
		var url='details';
		var obj={'pid':this.pid}
		this.axios.get(url,{params:obj}).then(res=>{
			this.pdetails=res.data[0]
			console.log(this.pdetails)
			this.pdetails.pro_brand='UGREEN绿联'
		})
		var obj2={uname}
		this.axios.get('cartnum',{params:obj2}).then(res=>{
			for(var i=0;i<res.data.length;i++)
			{
				this.number+=res.data[i].num
			}
			console.log(this.number)
		})
	},
	components:{
		webhead
	}
	
		
	}
</script>

<style scoped>
	.smicon{
		width: 15px;
		height: 15px;
	}
	#cart{
		width:90px;
		position:absolute;
		bottom:10%;
		right:10%;
		transition:0.1s
	}
	#num{
		position: absolute;
		bottom: 10%;
		right: 10%;
		
	}

</style>
