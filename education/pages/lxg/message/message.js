// pages/lxg/message/message.js
Page({

  /**
   * 页面的初始数据
   */
  gohome(){
    getApp().returnhome();
  },
  details(e){
    
    this.data.show=='none'?this.setData({
      show:'block'
    }) : this.setData({
      show: 'none'
    })
    var index=e.currentTarget.dataset.msg
    this.setData({
      message:this.data.msg[`${index}`]
    })
  },
  data: {
    show:'none',
    message:'',
    msg:[
      '推荐20好友注册下载app立刻送小巨蛋牙膏一个,进入个人中心--推荐好礼栏目获取的推荐码或者推荐链接 !',
      '本小程序不用于任何商业用途,如果您有任何好的意见或者建议欢迎联系2474840203@qq.com 。'
    ]
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