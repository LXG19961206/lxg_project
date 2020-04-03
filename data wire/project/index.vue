<template>
    <div>
       <div class='container'>
		<webhead></webhead>
		<!-- 轮播图部分 -->
			<div class="carousel text-center " data-ride='carousel' id='round'>
				<div class="carousel-inner">
					<div class="carousel-item active" >
						<img src="img/1572491324.jpg" id='i1' class='w-100' alt="">
					</div>
					<div class="carousel-item ">
						<img src="img/1538991161.jpg" id='i2' class='w-100' alt="">
					</div>
					<div class="carousel-item " >
						<img src="img/1574819184.jpg" id='i3' class='w-100' alt="">
					</div>
					<div class="carousel-item " >
						<img src="img/1574819271.jpg" id='i4' class='w-100' alt="">
					</div>
			<a data-slide='prev' href="#round" class='carousel-control-prev'><span class='carousel-control-prev-icon'></span></a>
			<a data-slide='next' href="#round" class='carousel-control-next'><span class='carousel-control-next-icon'></span></a>
			<ul class='carousel-indicators'>
				<li data-slide-to='0' data-target='#round' class='active'></li>
				<li data-slide-to='1' data-target='#round'></li>
				<li data-slide-to='2' data-target='#round'></li>
				<li data-slide-to='3' data-target='#round'></li>
			</ul>	
				</div>
			</div>
		<!-- 进行轮播下的内容 -->
		<div class="row ">
			<div class="col text-center">
				<p class='h3 mt-5 t-hover'>我们为您推荐的产品</p>
				<p class='main_font font-weight-light mt-4 t-hover'>以实际使用场景为出发点，为您设计简而美的产品</p>
			</div>
		</div>
		<!-- 一层推荐商品的抽屉 -->
		<div class="row  no-gutters" id='in_drawer'>
			<div class="col mr-4 text-center" v-for='(item,i) of index_pro' :key='i'
			@click='todetails(i)'>
				<div><img  class='img' :src="item.imgsrc" alt="">
				<img src="img/timg.jpg" class='search_img0' alt="">
				</div>
				<p class='mt-3 t-hover'><a href="" class='main_font2'>{{item.pname}}</a></p>	
			</div>
		</div>
		<!-- 然后我们加入视频楼层,这个楼层的背景色 -->
		<div class="row no-gutters mt-5">
			<div class="col text-center text-center ">
				<h2 class='h3 t-hover'>精致生活 快充相伴</h2>
				<p class='main_font font-weight-light mt-4 t-hover'>尽情享受这个美好时刻</p>
				<video class='t-hover' @click='video_play'  :src="video_src"></video>
			</div>
		</div>
		<!-- 然后我们加入用户关心的内容 -->
		<div class="row mt-4">
			<div class="col text-center ">
				<h2 class='h3 t-hover'>您可能关心的内容</h2>
				<p class='main_font font-weight-light mt-4 t-hover'>我们提供数码周边解决方案,解决您的数码生活难题</p>
			</div>
		</div>
		<div class="row mt-4 ">
			<div class="col-4 mb-5" v-for='(item,i) of news' :key='i'
			@click='goDetails(i)'>
				<img class='w-100 img' :src="item.news_mainimg" alt="">
				<div class="row no-gutters mt-3">
					<div class='col-3 '>
					<div class="border-right mt-2 ml-2">
						<h5>{{(item.news_date.slice(0,4))}}</h5>
						<h6>{{(item.news_date.slice(5))}}</h6>
					</div></div>
					<div class="col-9 ">
						<div class='ml-2'>
						<a href="" class='big_a t-hover'>{{item.news_title}}</a>
						<p class='t-hover main_font  mt-3'>{{(item.news_content).slice(0,50)}}...</p>
						<span class='main_font mr-2'>标签:</span>
						<a href="" class='main_font big_a'>{{item.news_tags0}}</a>&nbsp;
						<a href="" class='main_font big_a'>{{item.news_tags1}}</a>&nbsp;
						<a href="" class='main_font big_a'>{{item.news_tags2}}</a>

						</div>
					</div>
				</div>
			</div>	
		</div>
		
		
		</div>	
		<div class="row sec_footer_bgc ml-1 pb-4">
		<div id='foot_head' class="col-12  text-center">
			<table class='mt-3'></table>
			<h3 class='text-white mt-5 t-hover'>与我们联系</h3>
			<p class='small_font mt-2 t-hover'>您若有建议或产品使用中的问题，可通过以下方式与我们取得联系</p>
		</div>
		
		<div class="col-6 t-hover ml-5 mt-4" id='foot_content'>
			<h6 class='text-white mb-4 font-weight-light'>深圳市绿联科技有限公司</h6>
			<div class='t-hover mb-2'>
				<img src="img/1.png" alt="">
				<span class='small_font mt-2'> 地址：广东省深圳市龙华新区龙城工业区绿联办公楼</span>
			</div>
			<div class='mb-2'>
				<img src="img/2.png" alt="">
				<span class='small_font mt-2'>  电话：0755-28066995  / 4000668398</span>
			</div>
			<div class='mb-2'>
				<img src="img/3.png" alt="">
				<span class='small_font mt-2'> 传真：0755-28066815</span>
			</div>
			<div class='mb-2'>
				<img src="img/4.png" alt="" >
				<span class='small_font mt-2' id='email'> 邮编：518131</span>
			</div>
			<div>
				<img class='t-hover ml-2 mt-2' src="img/big.png" alt="">
				<img class='t-hover ml-2 mt-2' src="img/weibo.png" alt="">
				<img class='t-hover ml-2 mt-2' src="img/wechat.png" alt="">
			</div>
		</div>
		
		<div class="col t-hover ml-5 mt-4" id='foot_content'>
			<input class='my_input small_font' placeholder="姓名" type="text">
			<input class='my_input small_font' placeholder="电话" type="text">
			<input class='my_input small_font' placeholder="e-mail" type="text">
			<textarea placeholder='留言内容 ' class='my_input small_font'></textarea>
			<span class='small_font'>验证码</span><br>
			<button class='w-75 btn btn-success mt-3 ml-3'
			@click='commit'
			>提交内容</button>
		</div>
	</div>
	<div class=" fir_footer_bgc ml-1  pb-3">
		<span class='d-inline-block w-100 text-center mt-4'>
			<span class='small_font'>友情链接</span>
			<a class='small_font2 ml-2'  href="">手机数据线</a>
			<a class='small_font2 ml-2'  href="">网站制作</a>
			<a class='small_font2 ml-2'  href="javascript:;"
			@click="goSomewhere(`map`)">网站地图</a>
			<a class='small_font2 ml-2'  href="">微信地图</a>
			<a class='small_font2 ml-2'  href="">TOM科技</a>
		</span>
			<span class='d-inline-block w-100 text-center mt-2'>
				<a class='small_font2 ml-2'  href="">iphone11快充</a>
				<a class='small_font2 ml-2'  href="">手机配件</a>
				<a class='small_font2 ml-2'  href="">移动电源</a>
				<a class='small_font2 ml-2'  href="">视频专区</a>
			</span> 
			<p class='small_font text-center mt-2'>数据线,HDMI线,移动电源,车充,蓝牙,数码配件专业品牌-UGREEN绿联！
				<a class='small_font2' href="">粤ICP备12028978号-1</a>
			</p>
			<p class='text-center mt-2'>
				<a class='btn btn-black small_font' href="">简体中文</a>
			</p>
			<p class='text-center small_font mt-2'>Powered by 
				<a class=' small_font2' href="">UGREEN绿联</a>
			</p>
	</div>
	
	</div>	
	

</template>
<script>
import webhead from './head.vue'

export default {
	components:{
		webhead
	},
	data(){
		return {
			index_pro:{},
			video_src:'',
			video_status:false,
			news:[],
		}
	},
    created(){
		var url='index';
         //创建obj请求时数据
         //发送阿贾克斯请求
         this.axios.get(url).then(res=>{
	     console.log(res);
		 this.index_pro=res.data[0].slice(0,4);
		 this.video_src=res.data[1][0].video_src;
		 console.log(this.video_src);
		 this.news=res.data[2].slice(0,6);
		 console.log((res.data[2][0].news_date).slice(0,4))
		 console.log(this.news);
		})
	},
	beforeMount(){
		document.getElementById('email').innerHTML='emil'
	},
	methods:{
		todetails(i){
			this.$router.push(`details?pid=${i}`)
		},
		goSomewhere(url){
			this.$router.push(url)
		},
		video_play(e){
			!this.video_status?e.target.play():e.target.pause()
			this.video_status=!this.video_status
		},
		goDetails(router){
			this.$router.push(`newsdetails?newsid=${router}`)	
		},
		commit(){
			if(document.querySelector('.login').innerHTML=='登录'){
				alert('请您先登录')
				this.$router.push('login')
			}
			if(!document.querySelector("[placeholder='姓名']").value)
			{
				
			}
		}
	}
}
</script>
<style scoped>

</style>