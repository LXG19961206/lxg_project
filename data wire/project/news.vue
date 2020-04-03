<template>
    <div>
        <table class='my_table' id='my_table0'>
		<tr><td>为您推荐</td></tr>
		<tr v-for='(item,i) of news_info' :key='i' @click='goDetails(i)'>
			<td><a class='aOfTable' href="javascript:;">{{item.news_title}}</a></td>
		</tr>
	</table>
	<div class='container'>
		<webhead></webhead>
		<div class="row text-center mt-4">
			<div class="col-12 mb-3">
				<img src="img/1493197887.jpg" class='w-100' alt="">
			</div>
			<div class="col">
				<a class='main_font mr-3' href="">全部</a>
				<a class='main_font mr-3' href="">iphone11快充</a>
				<a class='main_font mr-3' href="">技术支持</a>
				<a class='main_font mr-3' href="">公司动态</a>
				<a class='main_font mr-3' href="">业界资讯</a>
				<a class='main_font mr-3' href="">产品评测</a>
				<a class='main_font mr-3' href="">设置教程</a>
			</div>
		</div>
			<div class='row mt-3'>
			
			<div class="col-10 bg-white mt-4 mb-3" v-for='(item,i) of news' :key='i'
			@click='goDetails(i)'
			>
				<div class="row  border-bottom">
					<div class='col-3'><img :src="item.news_mainimg" alt="" class="w-100"></div>
					<div class="col-7 mb-4">
						<h5>{{item.news_title}}</h5>
						<p class='main_font3'>
						{{item.news_content}}
						</p>
						<span class='main_font3'>阅读：{{item.news_view}}&nbsp;
						<img src="img/a1.png" alt="">
						&nbsp;发布日期&nbsp;<img src="img/a2.png" alt="">{{item.news_date}}
						 &nbsp;<img src="img/a3.png" alt="">绿联
						</span>
					</div>
				</div>
			</div>
			</div>		
	</div>
    </div>
</template>
<script>
	import webhead from './head.vue'
	export default{
		methods:{
			goDetails(router){
				this.$router.push(`newsdetails?newsid=${router}`)
			}
		},
		data(){
			return {
				news:{},
				news_info:''
			}
		},
		components:{
			webhead
		},
		created(){
			var url='news'
			this.axios.get(url).then(res=>{
				
				this.news=res.data
				console.log(this.news)
				this.news_info=res.data.slice(0,8)
			})
		}
	}
</script>
