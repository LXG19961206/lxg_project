<template>
	<div class="container">
		<webhead></webhead>
		<div></div>
		<div class="row  no-gutters mt-4" id='in_drawer'>
			<div class="col-3 mr-4 text-center" v-for='(item,i) of searchRes' :key='i'
			@click='todetails(item.pid-1)'>
				<div><img   :src="item.imgsrc" alt="">
				<img src="img/timg.jpg" class='search_img0' alt="">
				</div>
				<p class='mt-3 t-hover'><a href="" class='main_font2'>{{item.pname}}</a></p>	
			</div>
			<p class='main_font3' id='notFound' 
			v-show='!this.hasData'>很抱歉,您搜索的结果没有找到...</p>
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
			keyword:'',
			searchRes:[],
			hasData:false
		}
	},
	created(){
		//遇到了中文参数，需要解码，会获取到一段乱码
		if(window.location.href.split('?')[1].split('=')[0]=='pclass'){
			var pclass=decodeURIComponent(window.location.href.split('?')[1].split('=')[1])
			console.log(this.keyword);
			this.axios.get('search',{params:{pclass}}).then(res=>{
				this.searchRes=res.data
				res.data!=0?this.hasData=true:null
			})
		}
		else{
			var keyword=decodeURIComponent(window.location.href.split('?')[1].split('=')[1])
			console.log(this.keyword);
			this.axios.get('search',{params:{keyword}}).then(res=>{
				this.searchRes=res.data
				res.data!=0?this.hasData=true:null
			})
		}
		
	},
	methods:{
		todetails(i){
			this.$router.push(`details?pid=${i}`)
		}
	},
	watch:{
		searchRes(){
			console.log(this.searchRes)
		}
	}
}
</script>

<style>
#notFound{
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
	
}
</style>
