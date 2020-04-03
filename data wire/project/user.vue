<template>
	<div class="container">
		<webhead></webhead>
		
		<table class='table table-hover main_font w-50 text-center m-auto'>
			<tr >
				<th colspan="2" class='text-center border-0'>用户信息</th>
			</tr>
			<tr class='effect-tr'>
				<td>用户编号：</td>
				<td>{{userData.uid}}</td>
			</tr>
			<tr class='effect-tr'>
				<td>用户昵称：</td>
				<td>{{userData.uname}}</td>
			</tr>
			<tr class='effect-tr'>
				<td>用户性别：</td>
				<td>{{userData.gender==1?'男':userData.gender==0?'女':'未知'}}</td>
			</tr>
			<tr class='effect-tr'>
				<td>用户邮箱：</td>
				<td>{{userData.e_mail}}</td>
			</tr>
			<tr class='effect-tr'>
				<td>用户手机：</td>
				<td>{{userData.phone}}</td>
			</tr>
			<tr class='effect-tr'>
				<td>用户注册时间：</td>
				<td>{{userData.reg_time==null?'不详':userData.reg_time.slice(0,10)}}</td>
			</tr>
			<tr class='effect-tr'>
				<td >用户级别：</td>
				<td  id='rank'></td>
			</tr>
			<tr class='effect-tr'>
				<td>我的购物车</td>
				<td><a href="javascript:;"
				@click='toMyCart'
				>查看我的购物车</a></td>
			</tr>
			<tr class='effect-tr'>
				<td>我的消费记录</td>
				<td><a href="javascript:;"
				@click='toMyPayHistory'
				>查看我的已购商品</a></td>
			</tr>
			<tr>
				<td colspan="2"><button class="ml-5s btn btn-danger"
				@click='exit'
				>退出登录</button></td>
			</tr>
			
		</table>
	</div>
</template>

<script>
import webhead from './head.vue'
export default{
	methods:{
		toMyCart(){
			this.$router.push('cart')
		},
		toMyPayHistory(){
			this.$router.push('paidlist')
		},
		exit(){
			var bool=confirm('您真的要退出登录吗？')
			if(bool){
				function clearCookie(name) {
					function setCookie(key,value,t){
					  var myDate=new Date()
					  myDate.setDate(myDate.getDate()+t)
					  document.cookie=key+"="+value+ ";expires="+myDate.toGMTString();
					}setCookie('uname', "", -1); 
				}clearCookie('uname')
				this.$router.push('index')
			}
			
		}
	}
	,data(){
	   return {
		   userData:{}
	   }
	},
	components:{
		webhead
	},
	mounted(){
		var uname=document.querySelector('.login').innerHTML.split('，')[1]
		console.log(uname,typeof(uname))
		var obj={'uname':uname};
		var url='user';
		this.axios.get(url,{params:obj}).then(res=>{
			this.userData=res.data[0]
			console.dir(this.userData)
			for(var i=0;i<res.data[0].grade;i++)
			{
				document.querySelector('#rank').innerHTML+=' ★'
			}
		})
	}
}
</script>

<style scoped>
	table>.effect-tr:nth-child(2n){
		background-color: lightyellow;
	}
	table{
		position: absolute;
		top: 20%;
		left: 50%;
		transform: translate(-50%);
	}
	
</style>
