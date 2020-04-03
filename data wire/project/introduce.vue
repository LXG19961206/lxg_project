<template>
    <div>
        <div class='container' >
		<webhead></webhead>
		<div class="row">
			<img src="img/1572941793.jpg" alt="" class="w-100">
		</div>
		
		<div class='row bg-gray p-3'>
			<div class="col-3"></div>
			<div class="col">	
				<ul class='list-unstyled row justify-content-around m-0 p-0'>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;"  @click='toSomeWhere(1)'>公司简介</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;"  @click='toSomeWhere(2)'>发展经历</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;"  @click='toSomeWhere(3)'>联系我们</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;"  @click='toSomeWhere(4);job()'>工作机会</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;"  @click='toSomeWhere(5)'>服务网络</a></li>
					<li class='m-0 t-hover'><a class='main_font' href="javascript:;"  @click='toSomeWhere(6)'>获取物资</a></li>
				</ul>              
			</div>
			<div class="col-3"></div>
		</div>
		<div id="part1">
			<div class="row">
				<p class='px-5 pt-5 main_font2 my_lineheight'>
					深圳市绿联科技有限公司（UGREEN GROUP LTD）成立于2012年，是一家集研发、设计、生产、销售于一体的国家级高新技术企业，<br>致力于为用户提供全方位<a class='main_font2 my_lineheight' href="">数码配件</a>解决方案。公司以追求用户体验为出发点，推出了一系列独具绿联风格的优秀产品。产品以“UGREEN绿联”品牌背书行销大部分国家和地区，并且在亚洲、欧美市场赢得了良好口碑。<br>
					
					<br>绿联的产品涵盖了手机配件、电脑配件、影音配件、车载配件、居家生活配件及工控配件等品类，产品远销海内外，深受用户好评！
				</p>
			</div>
			<hr>
			<div class="row">
				<div class="col-7 p-5">
					<h4 class='mb-5'>企业文化</h4>
					<p class='main_font2'>使命：为用户创造价值， 提升员工幸福感，为社会发展做贡献；</p>
					<p class='main_font2'>愿景：成为一个有价值、有温度的全球性品牌；</p>
					<p class='main_font2'>价值观：以用户为中心，真诚、敬业；</p>
					<p class='main_font2 mb-5'>经营理念：通过不断优化，逐步建成一个高效有生命力的组织，争取和创造机会为用户提供有价值的产品和服务，从而获取合理的回报。</p>
					<h4 class='mb-5'>品牌理念</h4>
					<p class='main_font2'>More For You/多点精彩</p>
				</div>
				<div class="col-5">
					<img class='w-75 mt-5' src="img/1558080891132960.jpg" alt="">
				</div>
			</div>
			<hr>
			<div class="row px-4 pt-4">
				<img class='w-100 mb-4'  src="img/1536220608326167.png" alt="">
				<div class="col-10">
					<h4 class='mb-4 '>UGREEN绿联团队</h4>
					<p class='main_font2'>绿联团队是一批具有全球视野的新时代人才梯队。团队成员主要由产品、研发、设计、营销、服务人才组成，</p>
					<p class='main_font2'>设计精英，也有来自互联网和跨境贸易的营销服务人才。开放、热情、进取，绿联人注重产品，以开放的心态对新技术、新趋势的学习，保持对产品研发的投入，</p>
					<p class='main_font2'>既有来自传统制造业的研发、对团队人才的投入。</p>
				</div>
				<div class="col-8">
					<p class='main_font2'>绿联人以中国智造为使命，立志为全球用户提供高品质、优良设计、合理价格的产品和优秀服务，</p>
					<p class='main_font2'>让UGREEN绿联在全球范围内成为用户信赖和推崇的创新数码配件品牌。</p>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-5">
					<img class='mt-3 w-100' src="img/1558080913850189.jpg" alt="">
				</div>
				<div class="col-6 mt-5">
					<h4 class='mt-2'>产品设计</h4>
					<p class='main_font2 mt-5'>UGREEN绿联在手机、电脑、影音、车载配件等品类为用户提供创新解决方案
					<a href="">（了解UGREEN绿联产品）</a>。</p>
					<p class='main_font2'>绿联始终以用户为中心，坚持简约、易用的设计原则，</p>
					<p class='main_font2'>推出一系列符合用户需求和实际使用场景的数码产品。</p>
					<p class='main_font2'>绿联在重视用户体验的基础上，对产品外观设计和功能拓展进行优化升级，</p>
					<p class='main_font2'>为用户提供全方位的数码解决方案。</p>
				</div>
			</div>
		</div>
		<div >
			<div class="container" id="part2" style='display: none;'>
				<div>
				<h3 class='mt-5'>2019年</h3>
				<p>我们在路上。</p>
				<hr>
				</div>
				
				
				<div>
				<h3 class='mt-4'>2018年</h3>
				<p>UGREEN绿联布局KA渠道，<br>与行业客户建立起了良好关系！<br>绿联组建自身知识产权体系，落实了多个项目；<br>同时在跨品类产品开发上取得良好开局，<br>在丰富了产品线的同时，品牌竞争力得到大幅提升。</p>
				<hr>
				</div>
				
				
				
				<div>
				<h3 class='mt-4'>2017年</h3>
				<p>UGREEN绿联推出移动电源等系列重磅品类，<br>完成现有产品的优化升级；<br>同时优化线下经销店铺形象，<br>加快了品牌化进程。</p>
				<hr>
				</div>
				
				
				<div>
				<h3 class='mt-4'>2016年</h3>
				<p>UGREEN绿联在产品研发、<br>设计上实现迭代升级，<br>进一步优化了供应链体系，<br>并持续深耕细分品类。</p>
				<hr>
				</div>
				
				
				<div>
				<h3 class='mt-4'>2015年</h3>
				<p>UGREEN绿联品牌全球化布局、本地化经营的战略取得极大进展。</p>
				<hr>
				</div>
				
				
				<div>
				<h3 class='mt-4'>2014年</h3>
				<p>绿联展开品牌的全球性布局，<br>以UGREEN绿联为品牌依托，<br>入驻亚马逊多国站、阿里速卖通、ebay、wish等平台，<br>业务扩展到全球100多个国家和地区。</p>
				<hr>
				</div>
				
				
				<div>
				<h3 class='mt-4'>2013年</h3>
				<p>UGREEN绿联发展线下经销网络，<br>形成了线上、线下多渠道用户覆盖。</p>
				<hr>
				</div>
				
				
				<div>
				<h3 class='mt-4'>2012年</h3>
				<p>深圳市绿联科技有限公司成立，<br>同时，UGREEN绿联品牌入驻国内各大主流电商平台。</p>
				<hr>
				</div>
			</div>
			<div class="container mt-3" id="part3" style='display: none'>
				<div class="row">
					<div class="col-3 mr-5">
						<img src="img/re0.png" alt="">
						<p class='ml-1'>
							若您是个人用户，可登录<a href="">天猫</a>或<a href="">京东</a>购买；
							
							还可添加微信咨询所在城市的门店购买：
							
							微信（手机同号）：18320893352
							
							还可在绿联公众号购买：
							<br>
							<img src="img/re00.png" alt="">
						</p>
					</div>
					<div class="col-3 mr-5">
						<img src="img/re1.png" alt="">
						<p class='main_font'>若您需大宗采购、礼品订制，或想成为经销商，请联系：</p>
						<p><span class='font-weight-bold'>北区</span>（京/津/冀/晋/蒙/辽/吉/黑/苏/皖/鲁/豫/鄂/陕/甘/青/宁/新）<br>联系人：舒先生<br>手机：13823510927（微信同号）<br>QQ：3002670786 <br> 邮件：shuning@ugreen.com</p>
					</div>
					<div class="col-3">
						<img src="img/re2.png" alt="">
						<p>若您想与我们开展国际渠道合作请联系：<br>联系人：过先生<br>微信（手机同号）：18626326530<br>Q  Q：610949581<br>电话：0755-28066530<br>邮件：partner@ugreen.com<br>咨询请加QQ群：1018216357</p>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-12">
						<img src="img/re3.png" alt="">
						<p>
							绿联的发展离不开供应链支持，<br>
							
							若您有优质芯片、方案资源，或有供应服务，请加QQ群：372969132。
							
							<br>您还可通过以下方式与我们取得联系：
						</p>
					</div>
					<div class="col-4">
						<p class='font-weight-bold m-0'>电源类工程师</p>
						<p>联系人：蓝先生<br>邮件：lanhongjun@ugreen.com</p>
					</div>
					<div class="col-4">
						<p class='font-weight-bold m-0'>数码电子工程师</p>
						<p>联系人：肖先生<br>邮件：xiaozhengwen@ugreen.com</p>
					</div>
					<div class="col-4">
						<p class='font-weight-bold m-0'>影音数码配件、无线传输设备</p>
						<p>联系人：吴先生<br>邮件：eric@ugreen.com</p>
					</div>
					<div class="col-4 mt-5">
						<p class='font-weight-bold m-0'>数码充电、电源转换器</p>
						<p>联系人：朱先生<br>邮件：zhuzequan@ugreen.com</p>
					</div>
					<div class="col-4 mt-5">
						<p class='font-weight-bold m-0'>手机支架、壳膜、生活家居配件</p>
						<p>联系人：曹小姐<br>邮件：caoyurong@ugreen.com</p>
					</div>
					<div class="col-4 mt-5">
						<p class='font-weight-bold m-0'>移动电源</p>
						<p>联系人：曹先生 <br>邮件：caobing@ugreen.com</p>
					</div>
					<div class="col-4 mt-5">
						<p class='font-weight-bold m-0'>若对接不畅，请您联系：</p>
						<p>联系人：陈先生 <br>邮件：luke@ugreen.com</p>
					</div>
				</div>
				<div class="row">
					<div class="col-4  mt-5">
						<img src="img/re4.png" alt="">
						<p>
							若您提供品牌营销推广、媒体合作服务，请联系：
							<br>联系人：黄先生
							<br>Q  Q：3002401622
							<br>邮件：leon@ugreen.com
							<br>合作交流请加QQ群：1007470095
						</p>
					</div>
					<div class="col-4  mt-5">
						<img src="img/re5.png" alt="">
						<p>
							若您想成为我们的一员，请联系：<br>
							联系人：何先生<br>
							电话：0755-28066995转8059 <br>
							邮件：hr@ugreen.com <br>
							求职、应聘请加QQ群：182561610
						</p>
					</div>
					<div class="col-4 mt-5">
						<img src="img/re6.png" alt="">
						<p>
							若您遇到任何产品和服务问题，请联系：<br>
							联系人：粟先生<br>
							电话：0755-28066995转1 <br>
							邮件：kefu@ugreen.com <br>
							QQ1：2885412613 <br>
							QQ2：3002610904
						</p>
					</div>
					<div class="col-4 mt-5">
						<img src="img/re7.png" alt="">
						<p>
							地址：广东省深圳市龙华新区龙城工业区御祥7栋绿联办公楼<br>
							
							邮编：518131    <br>
							
							电话：0755-28066995 <br>
							
							传真：0755-28066815 <br>
						</p>
					</div>
				</div>
			</div>
			
			
			<div class="container" id="part4" style='display: none'>
			<h3 class='mt-5'>UGREEN绿联2019年12月招聘情况</h3>
			<table class='table main_font mt-3' >
				<tr v-for='(item,i) of joblist' :key='i'>
					<td>{{item.job}}</td>
					<td>{{item.edbg}}</td>
					<td>{{item.ars}}</td>
					<td>{{item.salary}}</td>
					<td>{{item.thedate}}</td>
				</tr>	
			</table>
			<img src="img/内网通截图20200114210224.png" alt="">	
			</div>
			
			<div class="container" id="part5" style='display: none;'>
				<h2 class='mt-5 text-center'>电商平台</h2>
				<p class='text-center'>
					UGREEN绿联品牌自创立之初起，一直拥抱互联网，国内外各大知名电商平台全面覆盖，京东、天猫、苏宁、Amazon、 AliExpress、
					<br>Lazada、eBay等主流电商平台均可找到绿联产品与服务。
				</p>
				<img src="img/1548295973563674.jpg" class='w-100' alt="">
				<hr>
				<h2 class='text-center'>数据实力展示</h2>
				<p class='text-center'>根据数据魔方及天猫搜索展示，UGREEN绿联多个品类销量均位于前列。为众多用户所喜爱的原创品牌！</p>
				<img src="img/1526884502743423.jpg" alt="" class='w-100'>
				<hr>
				<h2 class='text-center'>提供全球化的产品与服务</h2>
				<p class='text-center'>我们已在美国、英国、德国、法国、西班牙、日本和南非等多个世界主要经济体以UGREEN绿联自主品牌提供产品与服务；</p>
				<img src="img/1557199962319681.jpg" alt="" class='w-100'>
				<hr>
				<div class="row">
					<div class="col-5">
						<img src="img/1526885345631560.jpg" alt="" class='w-100'></div>
					<div class="col-5 mt-5">
						<h2 class='text-center'>日夜兼程，急速送达</h2>
						<p class='text-center'>我们理解您购物后等待产品的心情。绿联货品大部分已导入京东仓储以及天猫菜鸟仓，实现客户下单当地仓库的及时发货。同时，我们与申通、圆通、韵达、EMS、顺丰五大快递公司合作，让每一件商品快速、安全的到达您手中！</p>
					</div>
				</div>
					
			</div>
			
			<div class="container" id="part6" style='display: none;'>
				<div class='text-center mt-5'>
					<h3>品牌专利</h3>
					<p>2018-2019年，绿联追求的原创之路从未停止，70多项已生效专利，60多项申请中专利，
					<br>见证了绿联为用户创造有价值的产品。</p>
					<img src="img/1567577514343325.png" alt="">
				</div>
				
				<div class='text-center mt-5'>
					<h3>获奖产品风采</h3>
					<p>绿联产品始终坚持原创设计，作品获得iF奖、红星奖、红点奖、当代好设计奖等众多设计界荣誉奖项。</p>
					<img src="img/1567577050759107.png" alt="">
				</div>
				
				<div class='text-center mt-5'>
					<h3>资质认证</h3>
					<p>绿联一直致力于为用户提供有价值的产品和服务，<br>
绿联产品通过的重要品牌认证有苹果MFi认证、华为DFH认证和无线充电联盟的Qi认证。</p>
					<img src="img/1567577086809426.png" alt="">
				</div>
				
				<div class='text-center mt-5'>
					<h3>绿联合作伙伴</h3>
					<p>绿联目前的重要合作伙伴有苹果、华为、OPPO、天猫、京东、苏宁易购、亚马逊、速卖通等。</p>
					<img src="img/1567577146626079.png" alt="">
				</div>
				<div class='mb-5'></div>
				
			</div>
		</div>
	</div>
	<div class=" fir_footer_bgc ml-1  pb-3">
			<span class='d-inline-block w-100 text-center mt-3'>
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
export default{
	components:{
		webhead
	},
	data(){
		return {
			joblist:[]
		}
	},
	methods:{
		toSomeWhere(index){
			for(let i=1;i<=6;i++){
				document.getElementById(`part${i}`).style.display='none'
			}
			document.getElementById(`part${index}`).style.display='block'
		},
		job(){
			this.axios.get('job').then(res=>{
				this.joblist=res.data
				console.log(this.joblist)
			})
		}
	}
	}
</script>

<style scoped>
#part2 p,
#part2 h3{
	margin-left: 5%;
}	
 p{
	font-size: 0.9rem;
	font-weight: 2;
	font-family: yahei;
	line-height: 1.8rem;
}	
H3{
	font-size: 1.5em;
	font-family: yahei;
}
#part2>div:nth-child(2n) p,
#part2>div:nth-child(2n) h3{
	margin-left: 55%;
}
</style>
