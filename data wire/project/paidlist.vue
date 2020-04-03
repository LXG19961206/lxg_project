<template>
    <div class="container">
        <webhead></webhead>
        <table class='table'>
            <tr class='main_font'>
                <th>已购商品</th>
                <th>详情</th>
                <th>价格</th>
                <th>数量</th>
                <th>日期</th>
                <th>发货状态</th>                
            </tr>
            <tr v-for='(item,i) of paylist' :key='i' class='main_font'>
                <td>{{item.pname}}</td>
                <td class='w-25'
                :title='item.details'
                >{{item.details.slice(0.15).slice(0,20)||'待加载'}}...</td>
                <td>¥{{item.price}}.00</td>
                <td>{{item.num}}</td>
                <td>{{item.buydate}}</td>
                <td>{{new Date()-item.buydate}}</td>
            </tr>
        </table>
    </div>
</template>

<script>
import webhead from './head.vue'
export default {
    components:{
        webhead
    },
    data(){
        return {
            paylist:[]
        }
    },
    created(){
        var obj={'uname':document.cookie.split('=')[1]}
        this.axios.get('paidlist',{params:obj}).then(res=>{
            var arr=res.data
                 for(let i=0;i<arr.length;i++){
                let obj2={'pid':arr[i].pid}
                this.axios.get('details',{params:obj2}).then(res=>{
                    this.paylist.push(res.data[0])
                    console.log(res)
                    this.paylist[i].num=arr[i].num
                    this.paylist[i].buydate=arr[i].buydate
                })
            }
            console.log(this.paylist)
        })
    }
}
</script>
<style>

</style>
