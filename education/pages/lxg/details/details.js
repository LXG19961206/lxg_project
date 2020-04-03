// pages/lxg/details/details.js
Page({

  /**
   * 页面的初始数据
   */
  govideo(e){
    var title=e.currentTarget.dataset.title;

    getApp().data.detail_title=title
    getApp().data.detail_subject =this.data.subject
    getApp().data.src = e.currentTarget.dataset.src;
    wx.navigateTo({
      url: `/pages/lxg/video/video`
    })
    
  },
  data: {
    list:'',
    subject:'',
    swap:'\n',
    show:'none;'
  },
  show(){
    this.data.show == "none;"?this.setData({
      show: 'block;'
    }) : this.setData({
      show: 'none;'
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
   var that=this;
   var url=getApp().getUrl();
   var course=url.split('?')[1].split('=')[1];
   var db = wx.cloud.database({});
    db.collection('course').where({
      subject: course
    }).get({
      success(res) {
        that.setData({
          list:res.data[0].details,
          subject:course
        })
        console.log(that.data.list)
      }
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