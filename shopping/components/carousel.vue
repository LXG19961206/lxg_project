<template>
	<div class='swiper-box'>
		<ul style='transform:translateX(0%);'>
			<!-- 此为轮播项 -->
			<li>
				<img src="./1.jpg" alt="" >
			</li>
			<li>
				<img src="./2.jpg" alt="">
			</li>
			<li>
				<img src="./3.jpg" alt="">
			</li>
			<li>
				<img src="./1.jpg" alt="">
			</li>
		</ul>
		<!-- 此为控制播放的小圆点，小圆点数量应该是根据图片数量动态生成的，所以这div里面先是空的 -->
		<div class="swiperList"></div>
		<!-- 此为控制方向两个箭头 -->
		<span data-target='-1' class='control left'>&lt;</span>
		<span data-target='1' class='control right'>&gt;</span>
	</div>
</template>

<script>
	export default{
		mounted(){
			~function (){
				//首先创建了一个类似jq的$,方便我们后续的DOM操作,将querySelectorAll的类数组变成数组并且返回出去,
				//如果数组长度只有1,那就返回第一项
				let $=(selector=>{
					selector=Array.from(document.querySelectorAll(selector))
				    return selector.length==1?selector[0]:selector
				})
				//使用dom找到页面上这些元素,分别用变量保存起来
				let swiper=$('.swiper-box'),ul=$('.swiper-box>ul'),lis=$('.swiper-box>ul>li'),
					imgs=$('li>img'),list=$('.swiperList'),controlors=$('.control')
				//ul的宽度不是写死的,应该是有多少图片,宽度就是百分之几百
				ul.style.width=`${imgs.length}00%`
				//先动态生成小圆点,并插入到页面里
				list.innerHTML=new Array(imgs.length-1).fill(`<span></span>`).join('')
				//给每个小圆点上面都绑定自定义属性,同时第一个小圆点默认是激活的
				let spans=$('.swiperList>span')
				spans.forEach((item,i)=>{item.setAttribute('data-toggle',i)
					i==0?item.className='active':null})
				//在外部声明一个变量保存现在获取焦点的图片是哪一张
				let num=0
				//写一个方法，让轮播图自动播放
				let carousel=(direction)=>{
					//设置一个形参direction,只有当后退箭头调用这个函数的时候,才会进行传参
					//我们这个轮播图其实是一份三张图片的轮播图，但是为了实现无缝切换，我们在第三张的末尾添加了第四张图片，
					//这个第四张图片其实是第一张的副本
					//每次我们执行这个函数的时候，先判断下，目前焦点是不是在最后一张上，如果是让它无动画地切到第一张
					!direction&&num==imgs.length-1?(()=>{
						ul.style.transition=`0s all`
						ul.style.left=`0`
						num=1
						//注意这一部分要写在定时器里,因为如果不这样,在最后一张图片上的焦点还未来的及切换到第一张上面就直接跳到
						//第二张了,写在定时器里的东西,即便执行是0秒后执行,也是异步操作,会在同步进程处理完毕后才开始执行
						setTimeout(function(){
							ul.style.transition=''
							ul.style.left=`${num*-100}%`
						},0)
					})():
					direction==-1&&num==0?(()=>{
						ul.style.transition=`0s all`
						num=imgs.length-1
						ul.style.left=`${num*-100}%`
						//注意这一部分要写在定时器里,因为如果不这样,在最后一张图片上的焦点还未来的及切换到第一张上面就直接跳到
						//第二张了,写在定时器里的东西,即便执行是0秒后执行,也是js异步操作
						setTimeout(function(){
							num--
							spans[num].className='active'
							ul.style.transition=''
							ul.style.left=`${num*-100}%`
						},0)
					})():
					(()=>{
					//如果不是继续播放下一张即可
						num+=(direction||1)
						ul.style.transition=''
						ul.style.left=`${num*-100}%`
					})()
					//然后再让对应的小原点亮起来就可以了，需要注意的是最后一张（也就是第一张的副本成为焦点时,第一个小圆点亮）
					spans.forEach((item,i)=>{
						i==num?item.className='active':item.className='';
						num==imgs.length-1&&!direction?spans[0].className='active':null
					})
				}
				//把我们写好的东西放在定时器里面,让轮播图自动执行播放
				let timer=setInterval(carousel,2000)
				//当我们的容器被鼠标经过时,轮播图是不能运动的
				swiper.onmouseover=()=>clearInterval(timer)
				swiper.onmouseleave=()=>timer=setInterval(carousel,2000)
				swiper.onclick=(evt)=>{
					evt.target.dataset.toggle?(()=>{
						num=evt.target.dataset.toggle-1;
						carousel()
					})():evt.target.dataset.target==1?(()=>{
						carousel()
					})():evt.target.dataset.target==-1?(()=>{
						carousel(-1)
					})():null
				}
			}()
		}
	}
	
</script>

<style>
	*{
		margin: 0;
		padding: 0;
	}
	.swiper-box{
		width: 80%;
		overflow: hidden;
		position: relative;
		margin: auto;
		min-height:452px;
	}
	.swiper-box>ul{
		position: absolute;
		transition: 0.5s all;
		left: 0;
		top: 0;
		display: flex;
	}
	.swiper-box>ul>li{
		list-style: none;
	}
	ul>li>img{
		width: 100%;	
	}
	.swiperList{
		position: absolute;
		bottom: 20px;
		width: 100%;
		text-align: center;
	}
	.swiperList>span{
		display: inline-block;
		width: 14px;
		padding-bottom: 14px;
		background-color: #ccc;
		margin: 10px;
		border-radius: 10px;	
	}
	.active{
		background-color: #fff !important;
	}
	.control{
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		width: 4%;
		height:40px;
		line-height: 40px;
		background-color: rgba(0,0,0,0.7);
		font-size: 30px;
		color:#fff;	
	}
	.left{
		left: 0;
	}
	.right{
		right: 0 !important;
	}
</style>
