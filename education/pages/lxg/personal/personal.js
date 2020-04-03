// pages/lxg/personal/personal.js
Page({

  /**
   * 页面的初始数据
   */
  submsg() {
    var msg=[];
    console.log(1)
    for (var i = 0; i < 14; i++) {
      if (this.data.list.a[i]) { msg.push(this.data.list.a[i]) }
      if (this.data.list.b[i]) { msg.push(this.data.list.b[i]) }
      if (this.data.list.c[i]) { msg.push(this.data.list.c[i]) }
    }
    wx.switchTab({
      url: '/pages/lxg/demo01/demo01',
    })
    this.setData({
        msg
    })
    console.log(this.data.msg)
    var that=this
    wx.cloud.callFunction({
      name: 'update_mydata',
      data: {phone:wx.getStorageSync('phone'),
      msg:that.data.msg},
      complete: res => {
        console.log(res)
      }
    })
    
  },
  data: {
    page1:['经济师','特岗教师','自考专业课','公共英语pets','社区工作者','药师考试','管理类联考','考研专业课','工程师','其他建筑相关考试'],
    page2:['银行考试','翻译资格','国家电网','期货从业','物业管理师','平面设计师','管理类联考','俄语','面试','理财规划师','品类管理','程序设计'],
    page3:[
      '营销','饲料养殖','移动开发','创业就业','会计','情绪管理','沟通能力','金融银行业','写作能力'
    ],
   
    style:{
      a:[],
      b:[],
      c:[]
    },
    list:{
      a:[],
      b:[],
      c:[]
    },
    show:['block;z-index:100','none','none'],
    msg:''
  },

  totab(){
    console.log(this.data.show)
    var that=this.data
    
    this.setData({
      [`show[0]`]:that.show[1],
      [`show[1]`]:that.show[2],
      [`show[2]`]:that.show[0]
    }) 
  },
  tapevent(e){
    console.log(e)
    var index=e.currentTarget.dataset.select
    var content=e.currentTarget.dataset.content
    var type=e.currentTarget.dataset.type;
   var item= wx.createSelectorQuery().selectAll(`.groupitem`)
   console.log(this.data)
    !this.data.style[`${type}`][`${index}`]
      ? this.setData({
        [`style.${type}[${index}]`]: `color:white;background:#dc3545;border:1px solid white`,
        [`list.${type}[${index}]`]: content
      }) : this.setData({
        [`style.${type}[${index}]`]: '',
        [`list.${type}[${index}]`]: ''
      })
    console.log(this.data.list) 
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})