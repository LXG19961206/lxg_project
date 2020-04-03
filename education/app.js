//app.js
App({
  reload(){
    if (getCurrentPages().length != 0) {
      //刷新当前页面的数据
      getCurrentPages()[getCurrentPages().length - 1].onLoad()
    }
  },
  gosomewhere(url){
    if (url == '/pages/lxg/demo01/demo01'||url== '/pages/lxg/demo02/demo02' ||url=='/pages/lxg/demo03/demo03'||url=='/pages/lxg/demo04/demo04'){
    wx.switchTab({
      url
    })}else{
      wx.redirectTo({
        url
      })
    }
  },
  nofound(){
    wx.showToast({
      title: '该接口尚未开放,敬请期待',
      icon:'none'
    })
  },
  returnhome(){
    wx.switchTab({
      url: '/pages/lxg/demo02/demo02',
    })
  },
  islogin(){
    if (wx.getStorageSync('uname') == '') {
      wx.redirectTo({
        url: "/pages/lxg/login/login"
      })
    }
  },
  data:{
    detail_title:null,
    detail_subject:null,
    src:'',
    login:{
      uname: wx.getStorageSync('uname'),
      phone: wx.getStorageSync('phone'),
      header: wx.getStorageSync('header')
    }
  },
  onLaunch: function () {
    
    
    if (!wx.cloud) {
      console.error('请使用 2.2.3 或以上的基础库以使用云能力')
    } else {
      wx.cloud.init({
        // env 参数说明：
        //   env 参数决定接下来小程序发起的云开发调用（wx.cloud.xxx）会默认请求到哪个云环境的资源
        //   此处请填入环境 ID, 环境 ID 可打开云控制台查看
        //   如不填则使用默认环境（第一个创建的环境）
        // env: 'my-env-id',
        traceUser: true,
      })
    }

    this.globalData = {}
  },
getUrl(){
  var pages = getCurrentPages() //获取加载的页面
  var currentPage = pages[pages.length - 1] //获取当前页面的对象
  var url = currentPage.route //当前页面url
  var options = currentPage.options //如果要获取url中所带的参数可以查看options
  //拼接url的参数
  var urlWithArgs = url + '?'
  for (var key in options) {
    var value = options[key]
    urlWithArgs += key + '=' + value + '&'
  }
  urlWithArgs = urlWithArgs.substring(0, urlWithArgs.length - 1)
  return urlWithArgs
  }
})
