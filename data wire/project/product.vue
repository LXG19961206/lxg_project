<template>
    <div class="container">
		<webhead></webhead>
		<div class="row">
			<img class='w-100' src="img/1572941699.jpg" alt="">
		</div>
		
			<div class="row text-center  bg-gray">
				<ul class="col  m-0 p-0 mt-2">
					<li class='my-0 p-0'><p class='main_font'>全部</p></li>
					<li class='my-0 p-0'>
						<p class='main_font' @click='goSomewhere("a")'>手机配件</p>
						<div class="drawer">
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("a1")'>USB TYPE C</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("a2")'>MFi苹果手机数据线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("a3")'>安卓手机数据线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("a4")'>OTA系列</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("a5")'>手机支架</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("a6")'>钢化膜</a>
						</div>
					</li>
					<li class='my-0 p-0'>
						<p class='main_font'  @click='goSomewhere("b")'>智能充电</p>
						<div class="drawer">
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("b1")'>PD快充</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("b2")'>移动电源</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("b3")'>USB充电器</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("b4")'>QC2.0/3.0快充</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("b5")'>无线充电器</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("b6")'>智能排插</a>
						</div>
					</li>
					<li class='my-0 p-0'>
						<p class='main_font'  @click='goSomewhere("c")'>苹果配件</p>
						<div class="drawer">
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("c1")'>Lightning配件</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							 @click='goSomewhere("c2")'>MINI Displayport配件</a>
						</div>
					</li>
					<li class='my-0 p-0'>
						<p class='main_font'  @click='goSomewhere("d")'>电脑配件</p>
						<div class="drawer">
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d1")'>TPYE-c配件</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d2")'>USB延长线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d3")'>USB HUB集线器</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d4")'>USB外置网卡</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d5")'>USB外置显卡</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d6")'>读卡器</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d7")'>蓝牙适配器</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d8")'>网线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d9")'>工控配件</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d10")'>硬盘盒</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("d11")'>其他配件</a>
						</div>
					</li>
					<li class='my-0 p-0'>
						<p class='main_font' @click='goSomewhere("e")'>车载配件</p>
						<div class="drawer">
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("e1")'>车载支架</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("e2")'>车充</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("e3")'>AUX音频线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("e4")'>车载香薰</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("e5")'>其他配件 </a>
						</div>
					</li>
					<li class='my-0 p-0'>
						<p class='main_font' @click='goSomewhere("f")'>影音配件</p>
						<div class="drawer">
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f1")'>转接线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f2")'>音频线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f3")'>视频线</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f4")'>蓝牙发射/接收器</a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f5")'>USB声卡 </a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f6")'>HDMI高清线 </a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f7")'>HDMI转换器/分配器 </a>
							<a class='d-block  li_hover a_of_ul' href='javascript:;'
							@click='goSomewhere("f8")'>DVI/DP/VGA配件 </a>
						</div>
					</li>
					<li class='my-0 p-0'><p class='main_font'
					@click='goSomewhere("g")'>居家生活配件</p></li>
				</ul>
			
		</div>
		<div class="row mt-5">
			<div class="col-3 text-center ml-3 mb-3" v-for='(item,i) of product' 
			:key='i'
			 @click='details(i)'>
				<div class='imgbox'><img  class='img w-100' :src="item.imgsrc" alt=""></div>
				<p class='mt-3 t-hover'><a href="#" class='main_font2'>{{item.pname}}</a></p>	
			</div>
		</div>	
		<div class=" fir_footer_bgc ml-1  pb-3">
			<span class='d-inline-block w-100 text-center mt-3'>
				<a class='small_font2 ml-2'  href='javascript:;'>iphone11快充</a>
				<a class='small_font2 ml-2'  href='javascript:;'>手机配件</a>
				<a class='small_font2 ml-2'  href='javascript:;'>移动电源</a>
				<a class='small_font2 ml-2'  href='javascript:;'>视频专区</a>
			</span> 
			<p class='small_font text-center mt-2'>数据线,HDMI线,移动电源,车充,蓝牙,数码配件专业品牌-UGREEN绿联！
				<a class='small_font2' href='javascript:;'>粤ICP备12028978号-1</a>
			</p>
			<p class='text-center mt-2'>
				<a class='btn btn-black small_font' href='javascript:;'>简体中文</a>
			</p>
			<p class='text-center small_font mt-2'>Powered by 
				<a class=' small_font2' href='javascript:;'>UGREEN绿联</a>
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
	methods:{
		details(i){
			console.log(i)
			this.$router.push(`/details?id=${i}`)
		},
		goSomewhere(url){
			this.$router.push(`search?pclass=${url}`)
		}
	},
	data(){
		return{
		product:''
		}
	},
	created(){
		var url='index'
		this.axios.get(url,{params:{}}).then(res=>{
			this.product=res.data[0]
			console.log(this.product)
		})
	}
}
</script>

<style>
.imgbox{
	width: 255px;
	height: 255px;
	overflow: hidden;
}
</style>
