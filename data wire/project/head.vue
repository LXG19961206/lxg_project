<template>
	<div>
		<!-- 页面最顶部 -->
			<div class="row">
				<div class="col-4">
					<img src="img/1571977390.png" alt="">
				</div>
				<div class="col mt-3 bg-white">
					<a  class='main_font ml-4 ' href="javascript:;"
					@click='toSomewhere("index")'>网站首页</a>
					<a  class='main_font ml-4 ' href="javascript:;"
					@click='toSomewhere("introduce")'>公司简介</a>
					<a  class='main_font ml-4 ' href="javascript:;"
					@click='toSomewhere("product")'>产品展示</a>
					<a  class='main_font ml-4 ' href="javascript:;"
					@click='toSomewhere("news")'>新闻资讯</a>
					<a  class='main_font ml-4 ' href="javascript:;"
					@click='toSomewhere("download")'>下载中心</a>
					<a  class='main_font ml-4 ' href="javascript:;"
					@click='toSomewhere("helper")'>设置教程</a>
					<a class='ml-3' href="javascript:;">
					<img src="img/内网通截图20191211210040.png" alt="" @mouseover="show()">
					<input type="text"
					id='search_input' @mouseleave="show('shut')"
					style='display:none'
					@input='watchInput'
					placeholder="感兴趣的商品...">
					
					</a>
					<a href="javascript:;" class='login main_font ml-5'
					@click='toSomewhere("login","toggle")'>登录</a>
				</div>  
				
			</div>
		
	</div>
</template>

<script>
	export default{
		methods:{
			toSomewhere(route,type){
				if(type=='toggle'){
				document.querySelector('.login').innerHTML=='登录'?this.$router.push(`${route}`):this.$router.push('user')
				return
				}
				this.$router.push(`${route}`)
			},
			show(off){
				!off?document.getElementById('search_input').style.display='':
				document.getElementById('search_input').style.display='none'
			},
			watchInput(evt){
				document.getElementById('search_input').onkeydown=(e)=>{
					e&&e.keyCode==13?(()=>{
						this.$router.push(`search?keyword=${evt.target.value}`)
					})():null
				}
			}
		},
		mounted(){
			function getCookie(key){
			  var arr1 = document.cookie.split('; ');
			  for (var i=0; i<arr1.length; i++) {
			    var arr2 = arr1[i].split('=');
			    if ( arr2[0] == key ) {
			      return decodeURI(arr2[1]);
			    }
			  }
			}
			document.querySelector('.login').innerHTML=getCookie('uname')==undefined?'登录':'欢迎你，'+getCookie('uname')
			
		}
		
	}
</script>

<style scoped>
#search_input{
	background-color: #0DAF2A;
	padding: 5px 10px ;
	position: absolute;
	top: 100%;
	right:10%;
	outline: none;
	border:0;
	color:white;
	z-index: 100;
}

#search_input:hover{
	background-color: #8EE426;
	border:0;
	outline: none;
	padding:5px 10px;
	position: absolute;
}
</style>
