<template>
    <div>
        <div class="leftMenu">
            <div style='background:#fff;' id='all' @click='chooseList(-1)'
            class='font_dark font_normal'>全部</div>
            <div v-for='(item,i) in menu' :key='i'
            class='font_dark font_normal'
            @click='chooseList(i)'>{{item}}</div>
           
        </div>
        <div class="rightContent" >
            <div id="myList1" >
                <div v-for="(item,i) in list1" :key='i+"0"'  @click='goproduct($event,item.id)'>
                    <img :src="item.src" alt="">
                    <p class='font_dark'>{{item.name}}</p>
                </div>
            </div>
            <div id="myList0">
                <div v-for="(item,i) in list0" :key='i+"1"'  @click='goproduct($event,item.id)'>
                    <img :src="item.src" alt="">
                    <p class='font_dark'>{{item.name}}</p>
                </div>
            </div>
            <div id="myList2">
                <div v-for="(item,i) in list2" :key='i+"2"'  @click='goproduct($event,item.id)'>
                    <img :src="item.src" alt="">
                    <p class='font_dark'>{{item.name}}</p>
                </div>
            </div>
            <div id="myList3">
                <div v-for="(item,i) in list3" :key='i+"3"'  @click='goproduct($event,item.id)'>
                    <img :src="item.src" alt="">
                    <p class='font_dark'>{{item.name}}</p>
                </div>
            </div>
            <div id="myList4">
                <div v-for="(item,i) in list4" :key='i+"4"'  @click='goproduct($event,item.id)'>
                    <img :src="item.src" alt="">
                    <p class='font_dark'>{{item.name}}</p>
                </div>
            </div>
            <div id="myList5">
                <div v-for="(item,i) in list5" :key='i+"5"' @click='goproduct($event,item.id)'>
                    <img :src="item.src" alt="">
                    <p class='font_dark'>{{item.name}}</p>
                </div>
            </div>
        </div>
    <index></index>
    </div>
</template>
<script>
import index from '@/components/base'
export default {
    components:{
      index
    },
    created(){


    },
    mounted(){
      if(window.location.href.split('?')[1]){
      let index=window.location.href.split('?')[1].split('=')[1]
      this.chooseList(index)}
    },
    methods:{
        goSomewhere(url){
          if(window.location.href.split('#/')[1]=='index')return
          this.$router.push(url)
        },
        chooseList(num){
        if(num==-1){
            for(var i=0;i<=5;i++){
            document.getElementById(`myList${i}`).style.display=''
            }
            document.getElementById(`all`).style.background='white'
        }else{
            for(var i=0;i<=5;i++){
                document.getElementById(`myList${i}`).style.display='none'
            }document.getElementById(`myList${num}`).style.display=''
            document.getElementById(`all`).style.background='rgba(0,0,0,0.025)'
        }
    },
        goproduct(e,pclass){
            this.$router.push(`product?class=${pclass}`)
        }
    },
    data(){
        return {
            switchContent:0,
            menu:['彩妆护肤','食品生鲜','服饰鞋靴','个人护理','数码家电','家居家纺'],
            list0:[
                {name:'补水面膜',src:require('../img/images/289558019.png'),id:'0a'},
                {name:'护肤套装',src:require('../img/images/526cc8b8d85683d16efb870.jpg'),id:'0b'},
                {name:'乳液',src:require('../img/images/103489204.png'),id:'0c'},
                {name:'化妆水/爽肤水',src:require('../img/images/547e80489b67fa56e77229.jpg'),id:'0d'},
                {name:'口红',src:require('../img/images/927762567.png'),id:'0e'}
            ],
            list1:[
                {name:'肉干熟食',src:require('../img/images/-1038909297.png'),id:'1a'},
                {name:'方便食品',src:require('../img/images/-498370005.png'),id:'1b'},
                {name:'米面粮油',src:require('../img/images/-655543661.png'),id:'1c'},
                {name:'休闲零食',src:require('../img/images/1562906728.png'),id:'1d'},
                {name:'地方特产',src:require('../img/images/1294757344.png'),id:'1e'}],
            list2:[
                {name:'女棉服/羽绒服',src:require('../img/images/1734964653.png'),id:'2a'},
                {name:'风衣',src:require('../img/images/1900436026.png'),id:'2b'},
                {name:'男衬衫',src:require('../img/images/1945717552.png'),id:'2c'},
                {name:'夹克',src:require('../img/images/2077578973.png'),id:'2d'},
                {name:'鞋类',src:require('../img/images/334268112.png'),id:'2e'}],
            list3:[
                {name:'洗发水',src:require('../img/images/-1968128362.png'),id:'3a'},
                {name:'牙膏',src:require('../img/images/-2065668813.png'),id:'3b'},
                {name:'沐浴露',src:require('../img/images/-2095452332.png'),id:'3c'},
                {name:'纸巾类',src:require('../img/images/873789761.png'),id:'3d'},
                {name:'其他护理',src:require('../img/images/8232d81a09d73b3b3b5070e.jpg'),id:'3e'}],
            list4:[
                {name:'电饭煲',src:require('../img/images/22137808.png'),id:'4a'},
                {name:'高压锅',src:require('../img/images/-813959592.png'),id:'4b'},
                {name:'手表',src:require('../img/images/-1620240725.png'),id:'4c'},
                {name:'剃须刀',src:require('../img/images/772277247.png'),id:'4d'},
                {name:'数据线',src:require('../img/images/-290079062.png'),id:'4e'}],
            list5:[
                {name:'棉被',src:require('../img/images/1295512720.png'),id:'5a'},
                {name:'枕头',src:require('../img/images/-79705372.png'),id:'5b'},
                {name:'床垫',src:require('../img/images/-67078279.png'),id:'5c'},
                {name:'凉席',src:require('../img/images/834983737.png'),id:'5d'},
                {name:'毛毯',src:require('../img/images/-281570276.png'),id:'5e'}]
        }
    }
}
</script>
<style scoped>
.leftMenu{
    position: absolute;
    width: 20%;
}
.leftMenu>div{
    width: 100%;
    padding: 10px;
    background-color:rgba(0,0,0,0.025);
}
.leftMenu>div:hover{
   background-color: white;
   border-left: 2px solid coral;
}
.rightContent{
    width: 80%;
    position: absolute;
    left: 20%;

}
.rightContent>div{
    display: flex;
    flex-wrap: wrap;
    margin-left: 10px;
}
.rightContent>div>div{
    width:calc(100%/3);
    text-align: center;
    padding: 10px;
    box-sizing: border-box;
}
.rightContent>div>div>img{
    width: 90%;
}
</style>
