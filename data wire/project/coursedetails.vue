<template>
	<div class="container">
		<webhead></webhead>
		<div id="coursebox row " class='mt-5 ml-5'>
			<div class="col-2"></div>
			<div class='col-9 justify-content-end'>
			<h2>{{details.ctitle}}</h2>
			<img src="img/a1.png" alt="">
			<span class='main_font3'>{{details.cview}}&nbsp;
			&nbsp;&nbsp;<img src="img/a2.png" alt="">{{details.cdate}}
			 &nbsp;<img src="img/a3.png" alt="">绿联
			</span>
			<div></div>
			<div id='course'>	
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
				cid:'',
				details:{}
			}
		},
		created(){
			var str=window.location.href;
			this.cid=(str.split('?')[1]).split('=')[1];
			console.log(this.cid)
			var url='coursedetails'
			var obj={
				'cid':Number(this.cid)+1
			}
			this.axios.get(url,{params:obj}).then(res=>{
				this.details=res.data[0];
				console.log(this.details)
				var content=res.data[0].cContent.split('。')
				var arr=[]
				for(var i=0;i<content.length;i++){
					i<content.length-1?
					arr.push(`<p class='main_font'>${content[i]}。</p>`)
					:arr.push(`<p class='main_font'>${content[i]}</p>`)
				}
				document.querySelector('#course').innerHTML=arr.join('')
			})
		},
		components:{
			webhead
		}
	}
</script>

<style>
</style>
