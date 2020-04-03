<template>
    <div>
		
        <div class='container'>
        <webhead></webhead>
		
		<div class="row">
			<img class='w-100' src="UGREEN绿联官网_手机配件_数据线_移动电源_充电宝_数码配件_files/1493197887.jpg" alt="">
		</div>
		<div class='row bg-gray p-3'>
			<div class="col-2"></div>
			<div class="col">	
				<ul class='list-unstyled row justify-content-around m-0 p-0'>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;">全部</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;">iphone11快充</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;">技术支持</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;">公司动态</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;">业界资讯</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;">产品评测</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;">设置教程</a></li>
				</ul>              
			</div>
			<div class="col-2"></div>
		</div>
		<table class='my_table' id='my_table1' style='position:fixed;top:25%;right:8%;z-index:10'>
			<tr><td>为您推荐</td></tr>
			<tr>
				<td><a class='aOfTable' href="javascript:;">iPhone11如何实现快速充电</a></td>
			</tr>
			<tr>
				<td><a class='aOfTable' href="javascript:;">国行任天堂Switch发布，入手别忘了带上这些游戏必备配件</a></td>
			</tr>
			<tr>
				<td><a class='aOfTable' href="javascript:;">iPhone11与iPhonexs电池容量和充电速度对比</a></td>
			</tr>
			<tr>
				<td><a class='aOfTable' href="javascript:;">USB TYPE C拆解以及USB3.1规范详解</a></td>
			</tr>
			<tr>
				<td><a class='aOfTable' href="javascript:;">品牌维权通告</a></td>
			</tr>
			 
		</table>
		
		<div class='row mt-3'>
		
		<div class="col-10 bg-white mt-4 " v-for='(item,i) of courselist' :key='i'
		@click='goDetails(i)'
		>
			<div class="row  border-bottom">
				<div class='col-3'><img :src="item.cimg" alt="" class="w-100 mb-2"></div>
				<div class="col-7 mb-4">
					<h5>{{item.ctitle}}</h5>
					<p class='main_font3'>
					{{item.cdetails}}
					</p>
					<span class='main_font3'>阅读：{{item.cview}}&nbsp;
					<img src="img/a1.png" alt="">
					&nbsp;发布日期&nbsp;<img src="img/a2.png" alt="">{{item.cdate}}
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
	components:{
		webhead
	},
	data(){
		return {
			courselist:{}
		}
	},
	methods:{
		goDetails(router){
			this.$router.push(`coursedetails?cid=${router}`)
		}
	},
	created(){
		var url='course';
		this.axios.get(url).then(res=>{
			console.log(res)
			this.courselist=res.data
		})
	}
}
</script>
