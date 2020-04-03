// pages/lxg/demo02/demo02.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    uname: '',
    phone: '',
    header: ''
  },
  change(e){
    this.setData({sex:e.detail.value}) 
  },
  gosomewhere(e){
    var url=e.currentTarget.dataset.url;
    console.log(url)
   
      getApp().gosomewhere(url)
      
    
  },
  nofound(){
    getApp().nofound();
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    console.log(this)
    console.log(wx.getStorageSync('uname'),
      wx.getStorageSync('header'),
      wx.getStorageSync('phone'))
    this.setData({
      uname: wx.getStorageSync('uname'),
      phone: wx.getStorageSync('phone'),
      header: wx.getStorageSync('header')
    })
  
    getApp().islogin(this);
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