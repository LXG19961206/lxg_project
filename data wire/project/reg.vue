<template>
	<div class='container '>
	<webhead></webhead>
	<div class="row">
		<div class="col-4"></div>
		<div id="reg_box" class='bg-white col-5'>
			<p class='h6 mb-4'>新用户注册</p>
			<input
			@blur.prevent='notnull($event,"用户名")'
			v-model='uname'
			type="text" class='my_input main_font4 ' placeholder="请输入用户名">
			<span></span>
			<input 
			v-model='upwd'
			@blur='notnull($event,"密码")'
			type="password" class='my_input main_font4' placeholder='请输入您的密码'>
			<span></span>
			<input type="password" class='my_input main_font4' 
			v-model='upwd2'
			@blur='notnull($event,"密码")'
			placeholder='请再次输入您的密码'>
			<span></span>
			<input 
			@blur='notnull($event,"邮箱")'
			v-model="email"
			type="text" class='my_input main_font4 ' placeholder="请输入您的邮箱">
			<span></span>
			<input
			@blur='notnull($event,"手机")'
			v-model="phone"
			 type="text" class='my_input main_font4 ' placeholder="请输入您的手机">
			 <span></span>
			<span class='check d-block'>
				<input type="text" class='my_input main_font4' 
				v-model="checkvalue"
				@focus='show()'
				placeholder='请输入验证码'>
				<div class='checkbox d-inline-block' style='display:none;'>
					{{checkcode.split('').join()}}
				</div>
			</span>
			<button :disabled="!promise" class='btn btn-dark '
			@click='check()' style='width:15rem'>注册</button>
			<input class='mt-3' type="checkbox" v-model="promise"><span>我同意本网站的协议</span>
		</div>
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
			uname:'',
			upwd:'',
			upwd2:'',
			email:'',
			phone:'',
			checkvalue:'',
			checkcode:'',
			checkcodebox:[1,2,3,4,5,6,7,8,9,0,'a','b','c','d','e','f','g','h','i','j'],
			bool:false,
			promise:true
		}
	},
	methods:{
		check(){
			this.bool=false;
			this.checkcode.toLowerCase()==this.checkvalue.toLowerCase()?this.bool=true:this.bool=false;
			if(this.bool){
				if(this.uname!=''&&this.upwd!=''&&this.upwd2!=''&&this.emil!=''&&this.phone!=''){
					var obj={
						'uname':this.uname,
						'upwd':this.upwd,
						'e_mail':this.email,
						'phone':this.phone
					};
					var url='reg'
					this.axios.get(url,{params:obj}).then(res=>{
						if(res.data==1){
							alert('注册成功，即将跳转到主页')
							function setCookie(key,value,t){
							  var myDate=new Date()
							  myDate.setDate(myDate.getDate()+t)
							  document.cookie=key+"="+value+ ";expires="+myDate.toGMTString();
							}setCookie('uname',this.uname,1)
							this.$router.push('/index')
						}else{
							alert('注册失败，请尝试重新注册')
						}
					})
				}else{
					alert('请将内容填写完整')
					return
				}
			}else{
				alert('验证码有误')
				this.checkvalue=''
				return
			}	
		},
		show(){
			this.checkcode=''
			document.querySelector('.checkbox').style='opacity:1'
			for(let i=0;i<4;i++){
				this.checkcode+=this.checkcodebox[Math.floor(Math.random()*20)]
				console.log(this.checkcode)
			}},
		notnull(evt,val){
		if(evt.target.placeholder=='请输入用户名'){
			if(!/^\w{3,12}$/.test(this.uname)){
			alert('用户名输入错误')
			this.uname=''}}
		
		else if(evt.target.placeholder=='请输入您的密码'){
			if(!/^\w{6,12}$/.test(this.upwd))
			{alert('密码格式有误')
			this.upwd=''}}
		
		else if(evt.target.placeholder=='请再次输入您的密码'){
			if(this.upwd!==this.upwd2){alert('两次密码不一致')
			this.upwd=this.upwd2='';}	
		}
		
		else if(evt.target.placeholder=='请输入您的邮箱'){
			if(!/[a-zA-Z0-9]{6,24}@\w+\.\w+/.test(this.email)){
				alert('邮箱格式错误')
				this.email=''
			}
		}
		
		else if(evt.target.placeholder=='请输入您的手机'){
			if(!/\d{11}/.test(this.phone)){
				alert('手机格式错误')
				this.phone=''
			}
		}
			
		}
		
	}
}
</script>

<style scoped>
input:not([type="checkbox"]){
	color:black;
	width: 15rem;
}
#reg_box{
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
