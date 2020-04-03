<template>
    <div>
        <myindex v-show='page==0'></myindex>
        <cart v-show='page==2'></cart>
        <myclass v-show='page==1'></myclass>
        <center v-show='page==3'></center>
    </div>
</template>
<script>
import myindex from '@/components/myindex'
import cart from '@/components/cart'
import myclass from '@/components/class'
import center from '@/components/center'
export default {
    components:{
        myindex,
        cart,
        myclass,
        center
    },
    props:{
        page:{
            type:Number
        }
    }
}
</script>