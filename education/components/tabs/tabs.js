// components/tabs/tabs.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    my_title:{
      type:Array
    },
    my_border: {
      type: Array
    },
    name:{
      type:String
    }
  },

  /**
   * 组件的初始数据
   */
  data: {
  
  },

  /**
   * 组件的方法列表
   */
  methods: {
    gohome(){
      getApp().returnhome();
    },
    toswitch(e){
      var index=e.currentTarget.dataset.index
      for(var i=0;i<this.data.my_title.length;i++){
        this.setData({
          [`border[${i}]`]:'0' 
        })
      }
      this.setData({
        [`border[${index}]`]: '1px solid rgb(230,89,84);background:#fff;'
      })
    }
  }
})
