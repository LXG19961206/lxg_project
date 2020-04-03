<template>
  <div class="loginContainer por">
    <div class="loginBox poa center">
       <img src="../img/icon/ic_default_user_avatar_brand.png" class='w-50 opa6 m-a opa6' alt=""  :style="'display:'+show[0]">
       <br>
       <span class='fll font_bold font_normal' @click='toSwitch(0)'>注册</span>
       <span class='flr font_bold font_normal' @click='toSwitch(1)'>登录</span>
       <br>
       <div id='Tologin' :style="'display:'+show[0]">
         <input type="text" placeholder="请输入您的手机"
         class='loginInput' v-model="loginMsg.phone">
         <input type="password"  v-model="loginMsg.upwd"
         placeholder="请输入您的密码" class='loginInput pwdIpt' >
         <p class='por font_small' style='left:25%;'>忘记密码？</p>
         <div class='m-3'></div>
         <button class='loginBtn' @click='toLogin'>登录</button>
         <div class='m-3'></div>
         <p class='font_small'>——其他方式登录——</p>
         <div class='otherToLogin'>
           <img src="../img/icon/umeng_socialize_qq_on.png" alt="">
           <img src="../img/icon/umeng_socialize_sina_on.png" alt="">
           <img src="../img/icon/umeng_socialize_wechat.png" alt="">
         </div>
       </div>
       <div id='Toreg' :style="'display:'+show[1]">
            <input  v-model="regMsg.phone"
            type="text" placeholder="请输入您的手机" class='loginInput'>
            <input v-model="regMsg.uname"
            placeholder="请输入您的用户名" class='loginInput'>
            <input type="password"  v-model="regMsg.upwd"
            placeholder="请输入您的密码" class='loginInput pwdIpt'>
            <input type="password" v-model="regMsg.upwd2"
            placeholder="请再次输入您的密码" class='loginInput pwdIpt'>
            <p class='por font_small' style='left:25%;'>忘记密码？</p>
            <div class='m-3'></div>
            <button class='loginBtn' @click='toReg'>注册</button>
            <div class='m-3'></div>
            <p class='font_small'>——快捷登录方式——</p>
            <div class='otherToLogin'>
              <img src="../img/icon/umeng_socialize_qq_on.png" alt="">
              <img src="../img/icon/umeng_socialize_sina_on.png" alt="">
              <img src="../img/icon/umeng_socialize_wechat.png" alt="">
            </div>
          </div>
    </div>

    </div>
  </div>
</template>

<script>
  export default{
    data(){
      return {
        show:['block','none'],
        loginMsg:{
          phone:null,
          upwd:null
        },
        regMsg:{
          phone:null,
          upwd:null,
          upwd2:null,
          uname:null
        }
      }
    },
    methods:{
      toSwitch(idx){
        idx==0?this.show=['block','none']:this.show=['none','block']
      },
      toLogin(){
        var obj={
          phone:this.loginMsg.phone,
          upwd:this.loginMsg.upwd
        }
        if(!this.loginMsg.phone||!this.loginMsg.upwd){
            this.$toast('用户手机或者密码不能为空')
            this.loginMsg.phone=this.loginMsg.upwd=null
            return
        }
        !(/^[1][3-9]\d{9}$/.test(this.loginMsg.phone))?this.$toast('手机号格式有误'):
        !(/(?!^[0-9]+$)(?!^[a-zA-Z]+$)(?!^[A-Z0-9]+$)(?!^[a-z0-9]+$)^[a-zA-Z0-9]{8,16}$/.test(this.loginMsg.upwd))?this.$toast('密码是包含大小写字母和数字的8-16位密码'):
        this.axios.get('user',{params:obj}).then(res=>{
          if(res.data.length>0){
               console.log(res.data)
               this.$toast(`欢迎你,${res.data[0].uname}`)
               localStorage.setItem('phone',res.data[0].phone)
               localStorage.setItem('uname',res.data[0].uname)
               localStorage.setItem('uid',res.data[0].uid)
               console.log(localStorage.getItem("uid"))
               this.$router.push('index')
          }else{
               this.$toast('用户信息有误,或服务器出现故障,请尝试重新登录')
               return
          }
        })
      },
      toReg(){
        //每次注册前,都先查看这个手机号有没有已经被注册了,也就看数据库里有没有这个手机号
        //obj是用来保存这个验证这个用户是否存在时发送请求所用的对象
        var obj={phone:this.regMsg.phone};
        //regObj是真正注册时,所用的对象obj
        var regObj={
          phone:this.regMsg.phone,
          uname:this.regMsg.uname,
          upwd:this.regMsg.upwd
        }
        //如果我们去数据库里能拿到这个手机号的信息,代表这个号之前就被注册了,我们使用return阻止用户继续注册
        this.axios.get('user',{params:obj}).then(res=>{
          if(res.data.length>0){
            this.$toast('对不起,该用户已被注册')
            return
          }
        })
        //如果用户连输入框的内容都没有填满,我们阻止其继续执行注册
        if(!this.regMsg.phone||!this.regMsg.upwd||!this.regMsg.upwd2||!this.regMsg.uname){
            this.$toast('请将用户信息填写完整')
            this.regMsg.phone=this.regMsg.upwd=this.regMsg.upwd2=this.regMsg.uname=null
            return
        }
        //分别验证手机号,密码,用户名是否合法
        //如果合法,可以执行注册,发送请求,并且把这个用户注册成功的信息的一部分保存到stroage里面
        //然后转到主页
        !(/^[1][3-9]\d{9}$/.test(this.regMsg.phone))?this.$toast('手机号格式有误'):
        !(/(?!^[0-9]+$)(?!^[a-zA-Z]+$)(?!^[A-Z0-9]+$)(?!^[a-z0-9]+$)^[a-zA-Z0-9]{8,16}$/.test(this.regMsg.upwd))?this.$toast('密码是包含大小写字母和数字的8-16位密码'):
        this.regMsg.upwd!=this.regMsg.upwd2?this.$toast('两次密码输入不一致'):
        !(/^[a-zA-Z0-9^\u4e00-\u9fa5]{4,8}$/.test(this.regMsg.uname))?this.$toast('用户名只能4-8位的汉字,大小写字母和数字'):
        this.axios.get('user',{params:regObj}).then(res=>{
          if(res.data.affectedRows>0){
            this.$toast('注册成功')
            localStorage.setItem('phone',this.regMsg.phone)
            localStorage.setItem('uname',this.regMsg.uname)
            localStorage.setItem('uid',res.data[0].uid)
            console.log(localStorage.getItem("uname"))
            this.$router.push('index')
          }
        })
      }
    }
  }
</script>

<style scoped>
.loginContainer{
  width: 105%;
  height:100%;
  background: linear-gradient(to right, #ffeeee, #ddefbb);
  overflow: hidden;
  color:white;
}
.loginBox{
  width:75%;

  box-sizing: border-box;
  padding: 20px;
  background-color: rgba(0,0,0,0.04);
  border-radius:30px;
}
.loginInput{
  border:0;
  border-bottom: 1px solid white;
  background-color: transparent;
  outline: none ;
  margin-top: 25px;
  height:40px;
  width: 75%;
  background-image: url(../img/icon/zhuce_shouji_icon.png);
  background-repeat: no-repeat;
  background-size:30px;
  background-position: 0px 0px;
  color:white;
  text-indent: 35px;
}
.pwdIpt{
  background-image: url(../img/icon/denglu_mima_icon.png) !important;
}
input::-webkit-input-placeholder{
  color:white;
  font-size: 14px;
  text-indent: 35px;
}
.loginBtn{
  padding:15px 50px;
  border:0px;
  background-color: crimson;
  color:white;
  font-size: 18px;
  opacity: 0.6;
}
.otherToLogin>img{
  width: 25%;
}
#Toreg .loginInput+.loginInput{
  background-image: url(../img/icon/rb_my_center_normal.png);
}

</style>
