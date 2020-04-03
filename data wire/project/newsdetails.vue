<template>
	<div class="container">
		<webhead></webhead>
		<div id="newsbox row " class='mt-5 ml-5'>
			<div class="col-2"></div>
			<div class='col-9 justify-content-end'>
			<h2>{{details.news_title}}</h2>
			<img src="img/a1.png" alt="">
			<span class='main_font3'>{{details.news_view}}&nbsp;
			&nbsp;&nbsp;<img src="img/a2.png" alt="">{{details.news_date}}
			 &nbsp;<img src="img/a3.png" alt="">绿联
			</span>
			<div></div>
			<img :src="details.news_mainimg" alt="" class='mb-5 w-75 mt-5'>
			<div id='news'>
				
			</div>
			
			</div>
		</div>
	</div>
</template>

<script>
import webhead from './head.vue'
export default{
	data(){
		return {
			nid:'',
			details:{}
		}
	},
	components:{
		webhead
	},
	created(){
		var str=window.location.href;
		this.nid=(str.split('?')[1]).split('=')[1];
		console.log(this.nid)
		var url='newsdetails'
		var obj={
			'newsid':Number(this.nid)+1
		}
		this.axios.get(url,{params:obj}).then(res=>{
			console.log(res.data[0])
			this.details=res.data[0]
			var news_details=this.details.news_details.split('。')
			console.log(news_details)
			var arr=[]
			for(var i=0;i<news_details.length;i++){
				var item=news_details[i]
				i<news_details.length-1?arr.push(`<p class='main_font'>${item}。</p>`)
				:arr.push(`<p class='main_font'>${item}</p>`)
			}
			document.querySelector('#news').innerHTML=arr.join('');
			
		})
	}
}
</script>

<style scoped>

</style>
