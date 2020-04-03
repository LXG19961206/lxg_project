// pages/lxg/myint/myint.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    uname:'',
    header:'',
    list:[],
    mylist:[],
    mydata: {
      '经济师': 'eco',
      '特岗教师': 'pub',
      '自考专业课': 'stu',
      '公共英语pets': 'lan',
      '社区工作者': 'pub',
      '药师考试': 'med',
      '管理类联考': 'abi',
      '考研专业课': 'stu',
      '工程师': 'col',
      '其他建筑相关考试': 'bui',
      '银行考试': 'eco',
      '翻译资格': 'lan',
      '国家电网': 'pub',
      '面试': 'abi',
      '期货从业': 'eco',
      '物业管理师': 'pub',
      '平面设计师': 'ui',
      '俄语': 'lan',
      '品类管理': 'col',
      '理财规划师': 'eco',
      '程序设计': 'com',
      '营销': 'eco',
      '饲料养殖': 'fam',
      '移动开发': 'com',
      '写作能力': 'abi2',
      '创业就业': 'col',
      '金融银行业': 'eco',
      '会计': 'eco',
      '情绪管理': 'abi2',
      '沟通能力': 'view'
    },
  },
  gohome(){
    wx.reLaunch({
      url: '/pages/lxg/demo02/demo02',
    })
  },
  redesign(){
    console.log('1')
    wx.reLaunch({
      url: '/pages/lxg/personal/personal',
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      uname: wx.getStorageSync('uname'),
      header: wx.getStorageSync('header')
    })
    var that=this
    const db=wx.cloud.database({});
    db.collection('interest').where({
      phone: wx.getStorageSync('phone')
    }).get({
      success(res){
         
          that.setData({
            list:res.data[0].list
          })
          if(that.data.list.length>10){
            that.setData({
              list: res.data[0].list.slice(1,10)
            })
          }
        console.log(that.data.list)
        var arr = []
        for (var key in that.data.mydata) {
          var item = that.data.mydata[key]
          for (var i = 0; i < that.data.list.length; i++) {
            if (that.data.list[i] == key)
              arr.push(item)
          }
        }
        that.setData({
          mylist:arr
        })
      },
      fail(err){
        console.log(err)
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