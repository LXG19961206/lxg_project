<template>
	<div class='container '>
	<webhead></webhead>
	<div class="row">
		<div class="col-4"></div>
		<div id="login_box" class='bg-white col-5'>
			<p class='h6 mb-4'>账号密码登录</p>
			<input 
			v-model='uname'
			type="text" class='my_input main_font4 ' placeholder="用户名">
			<input 
			v-model='upwd'
			type="password" class='my_input main_font4' placeholder='请输入您的密码'>
			<span class='check d-block'>
				<input type="text" class='my_input main_font4' 
				v-model="checkvalue"
				@focus='show()'
				
				placeholder='请输入验证码'>
				<div class='checkbox d-inline-block' style='display:none;'>
					{{checkcode.split('').join()}}
				</div>
			</span>
			<button class='btn btn-dark w-100 mb-3'
			@click='check()'>登录</button>
			<br>
			<a href="javascript:;" class='fa-underline main_font'
			@click='toReg'
			>没有账户？点击此处注册</a>
		</div>
	</div>
	</div>
</template>

<script>
import webhead from './head.vue'

export default{
	data(){
		return {
			uname:'',
			upwd:'',
			checkcode:'',
			checkcodebox:[1,2,3,4,5,6,7,8,9,0,'a','b','c','d','e','f','g','h','i','j'],
			checkvalue:'',
			bool:false
		}
	},
	components:{
		webhead
	},
	mounted(){
		document.querySelector('.login').style='display:none'
	},
	methods:{
		toReg(){
			function clearCookie(name) {     
				function setCookie(key,value,t){
				  var myDate=new Date()
				  myDate.setDate(myDate.getDate()+t)
				  document.cookie=key+"="+value+ ";expires="+myDate.toGMTString();
				}setCookie('uname', "", -1); 
			}clearCookie('uname')
			this.$router.push('reg')
		},
		show(){
			this.checkcode=''
			document.querySelector('.checkbox').style='opacity:1'
			for(let i=0;i<4;i++){
				this.checkcode+=this.checkcodebox[Math.floor(Math.random()*20)]
				console.log(this.checkcode)
			}
		},
		check(){
			this.bool=false;
			this.checkcode.toLowerCase()==this.checkvalue.toLowerCase()?this.bool=true:this.bool=false;
			if(this.bool){
			var obj={
				uname:this.uname,
				upwd:this.upwd,
			}	
			var url='login'
			this.axios.get(url,{params:obj}).then(res=>{
				console.log(res)
				res.data.length!==0?this.bool=true:this.bool=false;
				if(this.bool){
				this.$router.push(`/index?uname=${res.data[0].uname}`);
				
				alert('恭喜您登陆成功')
				function setCookie(key,value,t){
				  var myDate=new Date()
				  myDate.setDate(myDate.getDate()+t)
				  document.cookie=key+"="+value+ ";expires="+myDate.toGMTString();
				}setCookie('uname',res.data[0].uname,1)
				
				}
			})}else{
				alert('验证码有误')
				this.checkvalue=''
				return
			}
			
			
		}
		
	}
}
</script>

<style scoped>
input{
	color:black;
	width: 15rem;
}
#login_box{
	text-align: center;
	position: absolute;
	top: 25%;
	left:40%;
	width: 17rem;
}
.check{
	position: relative;
}
.checkbox{
	position: absolute;
	right: 0;
	bottom: 0;
	background-color: #333;
	width: 100px;
	height: 30px;
	opacity: 0;
	color:#EBEBEB;
	font-weight: 800;
	font-style: italic;
}
input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {
  font-size: 12px;
}
</style>
