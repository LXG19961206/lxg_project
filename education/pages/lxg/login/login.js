// pages/lxg/login/login.js
Page({

  /**
   * 页面的初始数据
   */
  joke(){
    wx.showToast({
      title: '连个密码都记不住，真是个小废物，我才不管你呢！！！',
      icon: 'none',
      duration: 2500
    })
  },
  saysorry(){
    console.log('sorry')
    wx.showToast({
      title: '抱歉，此接口暂不开放',
      icon: 'none',
      duration: 2500
    })
  },
  change(e){
    var target=e.currentTarget.dataset.target;
    var value=e.detail.value;
    var obj=`${target}`;
    
    this.setData({
        [obj]:value
    })
  },
  login(e){
  if(/^[1][2-9]\d{9}$/.test(this.data.loginobj.phone))
  {
    if(/^\w{6,15}$/.test(this.data.loginobj.upwd)){
      const db = wx.cloud.database();
      var that=this;
      db.collection('user').where({
        upwd:that.data.loginobj.upwd,
        phone:that.data.loginobj.phone
      }).get({
        success(res){
          if(res.data.length==0){
            wx.showToast({
          title: '用户不存在或者输入有误，请尝试重新输',
          icon: 'none',
          duration: 2000})
          that.setData({
            [`loginobj.phone`]:'',
            [`loginobj.upwd`]: ''
          })
          }else{
      wx.setStorageSync('phone', `${that.data.loginobj.phone}`)
      wx.setStorageSync('uname', res.data[0].uname)
      wx.setStorageSync('header', res.data[0].header)
      wx.showToast({
      title: '登录成功',
      icon: 'success',
      duration: 2000})
      getApp().reload();
      wx.switchTab({
      url: '/pages/lxg/demo01/demo01'
      })
       }
        }})
     

    }else{
      wx.showToast({
        title: '密码长度必须在6-15位之间。',
        icon: 'none',
        duration: 2000
      })
      this.setData({
        ['loginobj.upwd']:''
      })
    }
  }else{
    wx.showToast({
      title: '手机号输入错误，请检查您的号码是否是符合要求的11位手机号码。',
      icon: 'none',
      duration: 2000
    })
    this.setData({
      ['loginobj.phone']: ''
    })
  }
  
  },
  reg(){
    const db = wx.cloud.database();
    var that = this;
    db.collection('user').where({
      phone: that.data.regobj.phone
    }).get({
      success(res){
        if(res.data.length>0){
          wx.showToast({
            title: '该用户已被注册',
            icon: 'none',
            duration: 2000
          }) 
          return
        }else{
          !/^[1][2-9]\w{9}$/.test(that.data.regobj.phone) ?
            wx.showToast({
              title: '手机号必须是符合规定的11位有效号码',
              icon: 'none',
              duration: 2000
            })
            : !/^\w{6,15}$/.test(that.data.regobj.upwd) ?
              wx.showToast({
                title: '密码长度必须在6-15之间',
                icon: 'none',
                duration: 2000
              }) : that.data.regobj.upwd != that.data.regobj.upwd2 ?
                wx.showToast({
                  title: '两次输入不一致',
                  icon: 'none',
                  duration: 2000
                })
                : !/^[A-Za-z0-9_\u4e00-\u9fa5]{4,16}$/.test(that.data.regobj.uname) ?
                  wx.showToast({
                    title: '用户名不合法,长度应为4-16位',
                    icon: 'none',
                    duration: 2000
                  })
                  : db.collection('user').add({
                    data: {
                      uname: that.data.regobj.uname,
                      phone: that.data.regobj.phone,
                      upwd: that.data.regobj.upwd
                    },
                    success: res => {
                      wx.setStorageSync('phone', `${that.data.regobj.phone}`)
                      wx.showToast({
                        title: '注册成功',
                        icon: 'none',
                        duration: 2000
                      })
                      db.collection('interest').add                       ({                                                  data:{
                        phone:that.data.regobj.phone,
                        list:[]
                      }
                      })
                      wx.switchTab({
                        url:'/pages/lxg/demo01/demo01'
                      })
                    },
                    fail: res => {
                      console.log(err)
                    }
                  })

        }
      }
    })
    
      },
  data: {
    show:['block','none'],
    loginobj:{
      phone:'',
      upwd:''
    },
    regobj:{
      phone:'',
      upwd:'',
      upwd2:'',
      uname:''
    }

  },
  to_switch(e){
    var status=e.currentTarget.dataset.switch
    console.log(status)
    status==0?
    this.setData({
        show: ['block', 'none']
    })
    : this.setData({
        show: ['none', 'block']
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