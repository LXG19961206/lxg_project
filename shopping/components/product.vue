<template>
    <div>
    <div class="goodsBox">
        <div class="goodsBox-item" v-for='(item,i) in products' :key='i' @click='goDetail(item.pid)'>
                <img :src="item.img" alt="" style='width:90%'>
                <div style='height:5px;'></div>
                <span class='goodSpan1'>精选</span>
                <span class='goodSpan2'>{{item.pname.slice(0,15)}}...</span>
                <div style='height:5px;'></div>
                <span class='goodSpan3' v-show='Math.random()>0.51?true:false'>包邮</span>
                <span class='goodSpan4'>新品</span>
                <div style='width:100%;height:5px;'></div>
                <span class='goodSpan5'>￥ {{item.price}}</span>
                <span class='goodSpan6'>￥ {{item.price2}}</span>
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
    data(){
        return{
            products:[]
        }
    },
    created() {
            var pclass=window.location.href.split('?')[1].split('=')[1]
            var obj={
               pclass
             }
             this.axios.get('product',{params:obj}).then(res=>{
                this.products=res.data
            })
    },
    methods:{
        gohome(){
            this.$router.push('index')
        },
        goDetail(pid){
            this.$router.push(`details?pid=${pid}`)
        }
       
    }
}
</script>