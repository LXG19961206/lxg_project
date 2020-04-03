// pages/lxg/demo04/demo04.js
Page({

  /**
   * 页面的初始数据
   */
  godetails(e){
    var course=e.currentTarget.dataset.course;
    wx.navigateTo({
      url: `/pages/lxg/details/details?course=${course}`
    })
   
  },
  to_switch(e){
      var num=e.currentTarget.dataset.switch
      num==0?
        this.setData({
          switch:['block','none','none']
        })
      :num==1?
        this.setData({
          switch: ['none', 'block', 'none']
        })
      : this.setData({
          switch: ['none', 'none', 'block']
        })
      
   
    console.log(this.data.switch[num])
  },
  data: {
    testmsg:'目前的值是null',
    job:'',
    live:'',
    switch:['block','none','none']
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this
    const db = wx.cloud.database();
    db.collection('project').get({
      success(res){
      console.log(res) 
      that.setData({
        testmsg:res.data[0].test,
        job:res.data[0].job,
        live:res.data[0].live
      })
        console.log(that.data.testmsg)
      }
    })
    var url = getApp().getUrl();
    console.log(url)
    if (!url.split('?')[1]){
      var index=null
    }else{
    var index = url.split('?')[1].split('=')[1]}
    if(index){
      this.setData({
        switch:['none','none','none']
      })
      this.setData({
        [`switch[${index}]`]:'block'
      })
    }
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