<template>
	<div class="container">
		<webhead></webhead>
		<div id="container"></div>
	</div>
</template>

<script>
import webhead from './head.vue'

export default{
	components:{
		webhead
	},
	mounted(){
		var map = new BMap.Map("container");            // 创建Map实例
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 10);
		var local = new BMap.LocalSearch(map, {
			renderOptions: {map: map, panel: "r-result"}
		});
		local.search("深圳市绿联科技有限公司");
		
		
		var stCtrl = new BMap.PanoramaControl();  
		stCtrl.setOffset(new BMap.Size(20, 20));  
		map.addControl(stCtrl);
	}
}
</script>

<style>
	#container{
		width:100%;
		height:1000px;
	}
</style>
