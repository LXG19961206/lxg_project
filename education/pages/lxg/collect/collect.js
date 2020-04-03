// pages/lxg/collect/collect.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    my_title: [
      '视频',
      '音频',
      '图书',
      '文章'
    ],
    border: [
      '1px solid rgb(230,89,84)',
      '0',
      '0',
      '0'
    ]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      uname: wx.getStorageSync('uname'),
      phone: wx.getStorageSync('phone'),
      header: wx.getStorageSync('header')
    })
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