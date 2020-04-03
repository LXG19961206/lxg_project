// pages/lxg/video/video.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    video:'',
    commit:'',
    content:[],
    time:[],
    user:[],
    header:[],
    src:[],
    message:''
  },
  send(){
    wx.showToast({
      title: '发送成功',
      icon:'success'
    })
    this.setData({
      message:''
    })
  },
  awardtab(e){
    var index=e.currentTarget.dataset.index
    wx.showToast({
      title: this.data.src[index] == 'tz_pl_dz.png' ? 'ta收到了一个您的赞':'您取消了赞',
      icon:'none'
    })
    this.data.src[index] =='tz_pl_dz.png'?
      this.setData({ [`src[${index}]`]: 'tz_pl_dz2.png' }) : this.setData({ [`src[${index}]`]: 'tz_pl_dz.png' })

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      video: getApp().data.src,
      content: arr
    })
    var that=this;
    var arr = [];
    
    var title=getApp().data.detail_title
    var subject=getApp().data.detail_subject
    const db=wx.cloud.database({})
    db.collection('commit').get({
      success(res){
        var commit=res.data[0].commit
        var time=res.data[0].time
        var user=res.data[0].user
        var header=res.data[0].header
        that.setData({
          commit
        })
        for(var i=0;i<Math.floor(Math.random()*commit.length);i++)
        {
          
          that.setData({
            [`content[${i}]`]: commit[Math.floor(Math.random()*commit.length)],
            [`time[${i}]`]:time[Math.floor(Math.random() * commit.length)],
            [`header[${i}]`]:header[Math.floor(Math.random() * commit.length)],
            [`user[${i}]`]:user[Math.floor(Math.random() * commit.length)],
            [`src[${i}]`]:'tz_pl_dz.png'
          })
        }
        console.log(that.data.user)
        
  
      }
    })
    
    console.log(that.data.content)
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