// pages/lxg/demo01/demo01.js
Page({

  /**
   * 页面的初始数据
   */
  nofound(){
    getApp().nofound();
  },
  gosomewhere(e){
    var url=e.currentTarget.dataset.url;
    console.log(e)
    wx.reLaunch({
      url
    })
  },
  data: {
    msg:'',
    num:10000,
    gender:0,
    info:{
      name:'tom',
      age:25,
      gender:'男',
      job:'程序员'
    }
  },
  handle(e){
    this.setData({
      msg:e.detail.value
    })
  },
  calc(e){
    //小程序函数本身不能传参,我们可以通过这种自定义属性通过事件源对象来获取
    //获取我们的自定义属性operate
    const operate=e.currentTarget.dataset.operate;
    console.log(operate)
    
    this.setData({
      num:this.data.num+operate
    })
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