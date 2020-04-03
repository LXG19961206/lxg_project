// components/selector/selector.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {

  },

  /**
   * 组件的初始数据
   */
  data: {
    list:[
      {name:'经管财',value:'eco'},
      {name:'医药卫',value:'med'},
      {name:'建筑类',value:'bui'},
      {name:'语言类',value:'lan'},
      {name:'公职类',value:'pub'},
      {name:'学历类',value:'stu'},
      {name:'计算机',value:'com'},
      {name:'ui',value:'ui'},
      {name:'通用能力',value:'abi'},
      {name:'管理素质', value:'abi2'},
      {name:'大学生以及行业相关', value: 'col' },
      { name: '专业技能', value: 'ski' },
      { name: '公务员专题', value: 'pub' },
      { name: '农民专题', value: 'fam' },
      { name: '健康', value: 'hel' },
      { name: '休闲', value: 'rel' },
      { name: '修养', value: 'rel2' },
      { name: '兴趣', value: 'int' },
      { name: '视野', value: 'view' } 
    ]
  },

  /**
   * 组件的方法列表
   */
  methods: {
    gosomewhere(e){
      var url=e.currentTarget.dataset.url
      getApp().gosomewhere(url);
    }
  }
})
