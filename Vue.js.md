Vue.js复习



##### 原生DOM vs jQuery vs Vue框架

*  原生DOM
  * 是在`浏览器/平台`已经实现了的,咱们可以直接使用的函数
  * 但是代码繁琐
* jQuery函数库
  * 基于原生`DOM`的基础上,进一步封装而成,更加简化
  * 对每一步原生的`DOM`都进行了简化,但是并没有简化步骤,依然包含大量的劳动
* 框架
  * 前人将多次成功的项目经验总结起来,形成的`半成品项目`
  * 项目整体代码和做事的步骤简化,`不再需要大量的手工劳动`,只需添加个性化的功能即可
  * 但是需要改变原有的做事方法,习惯上难以接受

##### Vue.js概述

* 中文官网`http://cn.vuejs.org`
* 是什么:`Vue.js`是一个`渐进式的`,基于`MVVM`设计模式而成的纯前端`JavaScript`框架
  * 渐进式:虽然提供了很多组成部分,但是`不强迫必须使用全部`,可轻松和其他技术混用
  * 纯前端:单靠`浏览器`就可以执行,不需要`NodeJS`以及其他后端技术
* 适用于以`数据的增删改查`为主的项目(WEB,APP)
* 安装
  * 兼容性:不支持`IE8及以下版本`
  * 当前单独下载的`js`文件版本`2.6`
  * 脚手架版本
* 如何使用
  * 直接下载js文件,通过script标签引入(学习练习)
  * 使用Vue-cli脚手架工具进行(实际开发)

##### Vue做事的步骤

* 定义页面

  * 整个页面只能包含在一个统一的父元素下`<div id='app'></div>`

  * 界面中所有`可能发生变化`的地方都使用`绑定语法`代替:

    ```html
    <div v-if='xxx'>{{变量名}}</div>
    ```

  * 如果元素需要`绑定事件`,就要使用`@事件名='函数调用语句'`

    ```html
    <button @click='goSomewhere()'></button>
    ```

    

* 定义一个数据对象,来包含页面上所有可能变化的位置,所需的变量和初始值

  ```JavaScript
  var data={变量名:初始值,...}
  ```

* 创建Vue类型的实例对象

  ```javascript
  new Vue({
  	el:'#app',  //app是找到要监视的父元素
      data:data,  //将数据对象引入到new Vue中,就把内存里的数据变量和界面绑定起来
  	//只要new Vue中的变量被改变,页面就会自动发生变化
      methods:{
          //如果界面上需要事件处理函数,就需要定义在new Vue的methods属性中集中保存
      }
      //除此之外还有很多其他的,会在后面详细介绍
  })
  ```

##### MVVM框架

* 是什么:一种对`前端界面`的重新划分
* 旧的网页组成部分:
  * `html`提供页面结构
  * `css`为页面结构提供样式
  * `js`为内容提供行为/数据
  * 存在的弊端:`html`和`css`的功能太弱,不包含程序的必要要素(`变量,分支,循环`)等等,所有改变都需要js来实现,代码`繁琐`,重复代码量大
* 重新划分
  * View层:指网页中的元素和样式,一般就是`html`,`css`
    
    * 但是通过`js`的操作,增强了html的功能,支持`变量,js表达式,分支和部分api`,这些内容无需再编写在`js`程序里面,可简化`js`程序的(但是实际上还是由`js`执行的,只不过是用`js`获取到`html`的这些绑定语法,经处理后执行)
    
  * Model层:指程序中创建的或从服务端获取到的`数据`,一般用`JS`中的一个`对象`来保存,数据会最终显示到界面`view`中
    
    * 页面有几处变化,模型对象中就要对应着相应的变量来支持页面
  * VIewModel层:视图模型,代替之前的`DOM/jq`操作,把模型中的数据和界面中的`html`元素绑定在一起
    * 不需要专门写`js方法或者事件`就能让页面元素内容和`js数据`联动变化
    
      `new Vue()`创建的就是这样一种强大的`VIewModule`对象,可自动同步页面元素和数据
* 绑定原理
  * 响应系统
    * `new Vue()`将`data{}`对象(在脚手架里是一个函数)引入到`new Vue()`中并且打散`data{}`,使`data{}`对象中每个属性都变为单独的属性,并直接隶属于`new Vue()`对象下
    
    * 然后为`new Vue()`给`data`里面每个属性添加`访问器属性`,今后任何操作都是通过`访问器属性实现的`
    
    * 最后`new Vue()`给`data`里面每个属性的`set()`函数内都有通知机制.只要试图修改`data`属性的值,都会自动调用属性的`set`函数,并自动发出通知,告知vue对象,哪个发生了变化
    
  * 虚拟DOM树
  
    * 是什么
  
      * 只保存`可能变化的DOM节点`的简化版`DOM树`
  
      * 创建`new Vue()`实例时候,`vue`对象通过扫描`DOM树`,把可能发生变化的元素(也就是有数据或方法绑定的元素),保存在`虚拟DOM树`上
  
    * 当收到了变量改变的通知时
  
      * `vue`会快速遍历`虚拟DOM树`,找到受影响的元素,调用已经封装好的`DOM函数`,只更新界面中收到影响的元素,不受影响的元素不会改变
  
    * 虚拟DOM的优点
  
      * 小:仅保存了`可能变化`的元素
  * 快:遍历快,查找快
      * 自动:已经封装了`DOM`操作,`自动`修改页面.避免了大量重复的`DOM`操作

##### Vue的数据绑定

* 什么是
  
  * `Vue.js`提供的,用于增强`html`功能的特殊`html属性`
  
* 为什么
  
* `html`本身是静态的,写死的,`没有任何动态生成内容`的能力
  
* 何时:

  * 只要元素的内容`可能发生变化`,就使用`{{}}`语法进行绑定

    * `{{}}`双括号语法,又称`插值表达式`
    * `{{}}`中可存放的内容和ES6的`模板字符串`类似,只要是有返回值的`js`表达式都可以放在其中
    * `{{}}`但是不能存放程序结构`if/for/while/do while等`

  * 问题:只能绑定元素的`内容`,不能绑定`属性值`

    ```html
    <!--比如说,这样是可以的-->
    <div>{{msg}}<div>  
    <!--但是如果是相要给属性值绑定数据的话,不能直接这么写-->
    <div title='{{msg}}'><div> 
    ```

    

* v-bind

  * 绑定元素可能发生变化的属性值

  * `v-bind:属性名`可以简写为`:属性名`

  * 写法

    ```html
    <any :title='msg'></any>
    <any :style="'color:'+msg"></any>
    ```

  * 另外,不写`{{}}`

* v-show

  * 控制一个元素`显示或者隐藏`

  * `<any v-show='条件'></any>`

    * 原理:每次扫描时,如果条件判定为`true`,就保存当前元素显示,如果判定元素是`fasle`,就给当前元素加上`display:none`属性,隐藏该元素

  * 和`v-if`区别

    * `v-if`是通过`添加/删除`这个元素节点来实现显示或者隐藏

* v-if,v-else

  * 如何

    ```html
    <元素1 v-if='判定条件'></元素1>
    <元素2 v-else></元素2>
    ```

    * 如果元素1`满足判定条件`,就显示元素1,删除元素2
    * 否则删除元素1,显示元素2

  * 强调

    * `v-if`不是采用`display:none`的方式,而是直接彻底删除这个元素
    * `v-if`和`v-else`的两个元素必须是相邻的兄弟元素,必须挨着写

* v-if,v-else-if,v-else

  * 控制元素`多选一`显示

  * 如何

    ```html
    <元素1 v-if='判定条件'></元素1>
    <元素2 v-else-if='判定条件2'><>
    <元素3 v-else></元素3>
    ```

  * 原理

    * 每次扫描时判定条件的值,哪个条件为`true`,就显示哪个,并且不会继续向下扫描
    * 如果都不满足判定条件,就显示最后带有`v-else`
    * 也是显示满足条件的,`删除`其他的

* v-on

  * 用于事件的绑定

  * 写法

    * `v-on-事件名='事件处理函数(参数)'`,可简写为`@事件名='事件处理函数(参数)'`,比如`@clcik='事件处理函数(参数)'`

  * 如何

    ```html
    <button @click='goSomewhere(xxx)'></button>
    ```

    ```javascript
    new Vue({
    el:'#app',
    data:{...},
    method:{
      goSomewhere(url){
        this.$router.push(url)
      }
    }
    
    })
    ```

    * 假如为`button`,绑定点击事件`goSomewhere()`,`xxx`是我们要传入的参数,如果没有要传入的参数,`()`的内容可以省去不写
    * 之后我们在`new Vue()`的`methods`里面写入相应的方法即可

  * 原理

    * 同`new Vue()`里的`data`一样,`methods`里面的方法也是直接打散放在`new Vue`里的
    * 如果想要访问`new Vue()`里的变量或者方法,就直接`this.变量名`或者`this.方法名`即可

  * 获取事件对象

    * 如果`只获取事件对象`,不需要传入其他参数

      * `<button @click='方法名'></button>`

      * 此时方法名后一定不要加`()`,表示不自定义传参,此时会`自动传入事件对象`,如果加了`()`,就要写成`@click='方法名($event)`

        * 此时的`$event`是固定写法,是`vue`中封装而成代表事件对象的关键词,另外`vue`中所有`$`开头的关键词,都`不可以自行修改`
  
        ```html
        <button @click='goSomewhere($event)'></button>  <!--或者-->
        <button @click='goSomewhere'> 
        ```
        
        ```javascript
        methods:{ 
          goSomewhere(e){  //但是无论html处是否有传递参数,此时都需要一个形参来接住事件对象
              this.$router.push(e)
          }
        }  
        ```
        
        
      
    * 如果`既需要`获取`事件对象`,还需要传入`自定义参数`
    
      * `<button @click='goSomewhere($event,其他参数...)'></button> `
    
      ```html
      <button @click='goSomewhere($event,参数...)'></button>
      ```
    
      ```jsx
      methods:{
      	goSomewhere(e,参数...){  //注意形参的顺序要和html部分函数传参的内容相对应
          this.$router.push(e)
         }
      }
      ```

* v-for

  * 是什么

    * 根据数组`反复`生成多个`结构相同的元素`

  * 如何

    * `<any v-for='(item,i) of 数组/对象/字符串' :key='i'></any>`
      * 其中`of`可以改为`in`,但是两者的效果一样,就是为了满足不同的而不同习惯而已

  * 强调

    * `v-for`要写在某个要重复生成的元素结构上,而不是父元素上

  * 原理

    * `of`可自动遍历对应的`数组/对象`,并取出相应每个元素的值`item`和下标`i`保存到左边的变量中

    * `v-for`每遍历数组/对象的一个成员时,就会创建一个当前`html`元素的副本

    * `v-for`里`of`前的变量(比如`item`和`i`),在当前元素内部可使用绑定语法

    * `v-for`反复生成元素的过程中,就会将绑定语法中的`变量`替换为`变量值`,固定在元素上

      ```html
      <any v-for='(item,i) of msg' :key='i'>商品名:{{item}},编号:{{i+1}}</any>
      ```

      ```javascript
      new Vue({
          data:{
              msg:['手机','电脑','笔记本','平板']
          }
      })
      ```

    * 如果涉及到`多维数组`,或者`数组或对象的嵌套`的话,要根据数组或者对象的结构做相应的变通

      ```html
      <any v-for='(item,i) of msg' :key='i'>商品名:{{item.pname}}</any>
      <any v-for='(item,i) of msg[0]' :key='i'>商品名:{{item.pname}}</any>
      <any v-for='(item,i) of msg' :key='i' :src='item.src[0]'></any>
      ...
      ```

  * `:key=i`

    * 作用:等于对每个元素加上了一个不重复的标识`i`

      | 如果加上了:key=i                                             | 如果不加上:key=1                                             |
      | ------------------------------------------------------------ | ------------------------------------------------------------ |
      | 如果将来数组或者对象中某一个成员发生了改变,既可以根据key属性的值准确找到更改的一个html元素,只更改受到影响的元素即可,不用将这组html元素全部重新生成一遍 | 反复生成元素是无差别的,如果将来数组或者对象发生了改变,就无法精确找到并区分要更改的元素是哪一个,只能将这组元素重新生成一遍,效率很低 |

      

  * 特别注意
    * 如果数组中保存的是`原始类型`的值时
      * 在程序里修改数组中某个元素的值时,`不能使用[下标]`方法访问
      * 因为此时下标方式是不受监控的
      * 结果:即使修改成功了,也不会自动更新的
      * 解决办法
        * 使用`.splice(i,1,'新值')`代替
          * 会删除i位置的一个值,替换为一个新值
          * 所有的数组函数都是受监控的
          * 结果:只要已修改,界面上就会自动变化
    * 如果数组里保存的是`引用类型`的对象时,则可以用`[下标]`进行修改
  * `v-for='i of 5'`
    * 就相当于`v-for='i of [1,2,3,4,5]' `
    * `of`会从`1`开始,`循环到`这个整数
    * 得到的几次`i`,分别是1,2,3,4,5

* v-html

  * 问题:因为`{{}}`在进行绑定`html`片段的时候,会保持`html`片段原样显示,而不是翻译页面元素.所以`{{}}`不能用于绑定`html`片段内容

  * 解决:`v-html`绑定`html`片段时,会将`html`片段交给浏览器去解析为页面元素

* v-cloak

  * 作用:避免用户短暂看见`{{}}`

  * 问题

    * 当用户首次加载页面时,如果加载稍存延迟,用户可就看到了`{{}}`插值表达式,不利于用于体验

  * 如何

    * 配合`css`来使用

      ```html
      <any v-cloak></any>
      ```

      ```css
      [v-cloak]{
       display:none;
      }
      ```

  * 原理

    - 让当前元素默认隐藏,知道内容加载完毕了才显示出来
    - 当`new Vue()`加载完成后,会找到页面所有的`v-cloak`属性,并且移除他们,这样在`css`里`display:none`就失效了
    - 元素就显示出来了

  * 注意

    * 因为`vue`只会移除`v-cloak`属性,所以`v-cloak`属性不能改名

* v-text

  * 将原本`{{}}`绑定的内容,放在指令里来执行,效果是一样的
  * 但是因为指令属于属性,即使暂时没有加载完成,用户也不会看到属性部分的内容
  * 所以也能起到解决类似上述因为加载延迟而看到`{{}}`的作用

* v-once

  * 仅在页面加载时,绑定一次,之后变量修改,也不更新页面
  * 原理:只有在`首次加载时`,一次性将模型数据显示在当前元素.不会将当前元素加入到虚拟DOM树里
  * 优化:`减少被监视元素的个数`,可以优化页面绑定的`效率`

* v-pre

  * `保留`当前元素中的`{{}}`语法,不进行绑定渲染
  * 简单地说就是把`{{]}`当成普通的文本,而不是`插值表达式`

* ##### 双向绑定

  - 既可以把程序里`Model`数据绑定到`表单元素`里显示
- 又可以把`表单元素`里修改的新值,绑定会`Model`数据变量上保存
  
  - 为什么
  
    - `{{}}`和`v-bind`只是单向绑定,只能将`Model`数据的值,绑定到页面的`表单元素`上,用于显示`M-V`
  - 而页面上的修改,无法作用于`Model`数据层
  
  - 何时
  
    - 今后,只要希望修改表单元素的值后,也能自动修改对应的模型数据的值,则用`v-model`指令进行修改

  - 如何

    - 绑定文本框和文本域
  
      ```html
      <input v-model:value='变量'></input>
      <textarea v-model:value='变量'></textarea>
      ```
  
      - `Model`层里的数据,会自动渲染到`表单元素`里
      - 而`表单元素`的数据一旦更新,也会将新值返回到`Model`层
      - 原理
        - oninput事件:只要我们在表单元素里输入内容,就会不断触发这个事件,给Module里的变量重新赋值.
  
    - 绑定select元素
  
      - 绑定select时比较特殊,不是直接修改`select元素`的文本,而是通过选择`option`来改变`select`的`value`
  
        ```html
         <select v-model:value='orderStatus'>
              <option value='10'>未付款</option>
              <option value='20'>已付款</option>
              <option value='30'>待发货</option>
          </select>
        ```
  
        
  
    
  
    - 结果
  
      - `select`选中项的值改变,就会立刻刷新选中的`option`的`value`值更新回内存中的程序里
  
    - 原理
  
      - 单项绑定时:将`model`中的变量值赋值给`select`的`value`属性,然后,`select`元素会拿着`value`属性和每个
  
        `option`的`value`值进行比较,哪个`option`的`value`等于`select`的`value`,就选择哪个
  
      - 修改时:
  
        ```html
        <select v-model:value='xxx'></select> <!--会被自动解析为类似下面的代码-->
        <select onchange='vue对象.某个变量=当前select的value值'>
        ```
  
        
  
    - 绑定radio元素
  
      - 备选项的`value`都是不变的,绑定的其实是它的`checked`属性
  
        ```html
        <label>
            <input type='radio' value='1' v-model:check='sex'>男
        </label>
        <label>
            <input type='radio' value='0' v-model:check='sex'>女
        </label>
        ```
  
      - 原理:在进行单向绑定时,`v-model`会拿着`checked`属性绑定的变量值和当前`radio`的`value`属性进行比较,如果绑定的变量值
  
        等于`radio`的`value`,就选中这个`radio`,否则不选
  
    - 绑定checkbox元素
  
      - 不需要和`value`比较,直接用`checked`属性绑定到一个`bool`值变量即可
  
        ```html
        <input type='checkbox' v-model:checked='isAgree'>同意
        ```
  
      - 原理:
  
        - 单向绑定时:绑定的变量值返回`true`,就选中,否则就不选
        - 修改时:直接将`checkbox`当前的选中状态`checked`属性值更新会模型变量上
  
    - 简写方式
  
      - 直接`v-model='xxx'`即可,因为`v-model`会自动根据当前所在不同的表单元素,切换不同的属性绑定
  
  - 监视函数
  
    * 什么是
  
      * 在模型数据发生变化时,自动执行的函数
  
    * 何时
  
      * 只要希望在模型数据变化时,立刻执行一项操作时,需要监视函数监控模型变量
  
    * 如何
  
      ```javascript
      new Vue({
        el:'xxx',
        data:{...},
        watch:{
          模型变量名(){
            执行的操作...              //监视函数的函数名就是要监视的变量名
          }
        }
      })
      ```
  
      

##### 样式的绑定和style属性

* 绑定内联样式

  * 方式1: 把`style`属性作为普通字符串属性进行绑定

    ```javascript
    <元素 :style='变量'>  //html中
    
    data:{
      变量:'color:red;'  //js中
    }
    
    ```

    * 存在的问题 : 如果只希望改一个css属性值,这个办法就很不方便

  * 方式2:用对象绑定`style`

    ```javascript
    <元素 :style='obj'>  //html中
      
    data:{
      obj:{
        width:'100px';
        height:'100px';
      }
    }
    ```

    * `Vue`语法会把这个对象打散为字符串格式来解析,相当于`style='width:100px;height:100px;'`

    * 简写

      ```JavaScript
      <元素 :style='{width:变量1;height:变量2}'>   //html中
      
      data:{
        height:100px;
        width:100px;
      }
      ```

  * 方式3: `style`和`:style`混用

    * 何时:某些内联css样式是固定写死的无需变化,而有些是根据`js`动态变化的

      ```html
      <元素 style='width:100px;' :style='xxx'>
      ```

      `Vue`会把`:style`动态生成的样式拼接进`style`字符串里

* 绑定class属性

  * 方式1: 把`class`属性作为普通字符串属性进行绑定

    ```js
    <元素 :class='myClass'>  //html
     
    data:{
      myClass:'col-2 bg-dark...'
    }       //js
    ```

    * 会把`Model`层的存放`class`的数据解析为普通字符串拼接进`class`里面

  * 方式2 : 用对象绑定`class`,需要动态修改样式时,直接修改这个对象即可

    ```javascript
    <元素 :class='myClass'>  //html
    
    data:{
      myClass:{
       'col-2':true,
       'bg-dark':fasle
      }
    }   //js
    ```

    * `Vue`绑定语法会把对象翻译为`class`字符串,但是只有那些值为`true`的才会添加进`class`元素字符串里

    * 简写

      ```html
      <元素 :class='{class1:条件1,class2:条件2}'>
      ```

  * 方式3:`class`和`:class`混用

    * 何时: 有些`class`名是固定写死的,而有些是动态生成的

      ```html
      <元素 class='col-2 bg-dark' :class='变量或对象'>
      ```

##### Vue的自定义指令

* `Vue.js`中除了预定义的`13`个指令外,还允许用户自定义扩展指令

  ```javascript
  Vue.directive('指令名',{
    inserted(el){
      //当元素被加载到DOM树时候触发
      //el可自动获取当前写有这个指令名的DOM元素对象
      //函数里,可对这个写有指令的DOM元素执行原生的DOM操作
    }
  })
  ```

  * 强调

    * 因为指令不是只给一个页面或者一个功能添加的,应该所有`Vue`对象都可以使用的,所以应该是数组`Vue`大家庭的,所以在创建时候,应该用`Vue.directive`来创建

    * `指令名`不用加`v-前缀`,只有在`html`中使用的时候,才加`v-前缀`

  * 使用

    ```html
  <元素 v-自定义指令名=''>               <!--强调:使用指令时必须前边加'v-'-->           
    ```

##### Vue的计算属性

* 什么是:不实际`存储`属性值,而是根据其他属性值`动态计算`获得

* 为什么: 有些`属性`的值,不能直接获取,需要经过其他`属性`的值计算后,才能获得

* 何时:今后,只要需要一个属性的值,`依赖于其他数据属性`的值动态`计算`而成,就要使用计算属性

* 如何

  * 定义时: 

    ```JavaScript
    new Vue({
      el:'xxx',
      data:{
        num1:2;
        num3:3;
      },
      methods:{
        ...
      },
      watch:{
        ...
      },
      computed:{
         num3(){
          return this.num1*this.num2 
        }
      }
    })
    ```

  * 绑定时:和普通数据属性一样 ! 通过插值表达式`{{该计算属性}}`

  * 强调 : 虽然是`方法`,但是在使用时绝对`不能加()`,就把当成普通的写在`data`里的变量或者属性就好

##### methods vs watch vs computed

* methods

  * 保存自定义方法
    * 要么作为事件绑定,在事件触发时才会被执行
    * 要么在`js`中主动加`()`进行调用
  * 问题:`Vue缓存`中不会自动保存`methods`中的方法执行结果,重复调用了几次就会重复计算几次-`效率低`

* computed

  * 保存自定义计算属性

    * `不会自己手动调用`
    * 都是通过在页面上使用绑定语法自动触发执行,且不用加`()`

  * 优点

    * `Vue`会缓存`computed`属性的计算结果,只要所依赖的其他变量值不变,则`computed`就不会重复计算,而是优先使用缓存里保存的值,`效率高`

    * 只有所依赖的其他属性发生了变化,才会自动重新计算`计算属性`的变化

* watch

  * 保存所有的监视函数
    * 不需要自己调用
    * 只要被监视的变量值改变,就自定触发

* 总结

  * 更侧重于获得计算结果时,优先使用`computed`
  * 不关心计算结果,单纯执行一项操作时,应该使用`methods`
  * 只要希望变量值每次改变时,都自动执行一项操作,就用`watch`

##### 过滤器(Filter)

* 什么是 : 在接收原始数据后,执行再加工

* 强调 : `Vue`官方没有提供任何预定义过滤器,只能自定义

* 何时: 有些数据,经常需要`加工后再显`示给用户时

* 如何 

  * 创建自定义过滤器 

    ```javascript
    Vue.filter('过滤器',funciton(val){
       //val要接收要处理的模型数据的原始值
        return val.toUpperString() //返回经处理后的val 
    })
    ```

  * 使用自定义过滤器

    ```html
    <div>{{数据|过滤器名}}</div>
    <div :title='数据|过滤器名'></div>
    ```

  * 创建带参数的过滤器

    ```javascript
    Vue.filter('过滤器名',funciton(val,参数1,...){
      //val是要接收要处理模型数据的原始值
      return xxx
    })
    ```

  * 使用带参过滤器

    ```html
    <div>{{数据|过滤器名(参数值1,...)}</div>
    ```

* 强调:过滤器可以像管道一样拦截起来,先后执行

  ```html
  <div>{{数据|过滤器1|过滤器2|...}}</div>
  ```

  

##### Axios

* 什么是 : `axios`是一个基于`promise`的`HTTP`库,可以在浏览器和`node.js`里执行

* 何时

  * 在浏览器中,创建`xhr`请求
  * 在`node.js`中,创建普通`http`请求

* 为什么

  * 浏览器中创建xhr请求的四种方案
    * 使用原生`XHR`对象----代码量大
    * 使用`jQuery`封装的`ajax`函数----如果只是因而简化发送`ajax`就引入整个`jq`的话,没有必要
    * 使用官方提供的`VueResource插件`---已经被官方废弃
    * 使用第三方工具就`Axios`----该工具不仅在`Vue`生态下能够使用,在其他框架或者原生`js`也可以用

* 如何

  * 在`html`中引入`Axios.js`文件

  * 配置`Axios`

    * 因为当前项目所有的`ajax`请求服务器的基础地址都是相同的,所以为了避免重复写很多遍,也为了便于维护和修改服务器基础地址,应该为`axios`配置统一的基础`URL`

      ```javascript
axios.defaults.baseURL='http://localhost:5050'
      ```
      
    * 将来使用axios函数的时,只需要写基础路径之后的相对接口地址即可

    * 好处: 如果服务端地址发生了改变,只需修改一次即可

  * 调用`ajax`发送异步请求

    * Get请求

      ```JavaScript
    axios.get(url,{params:{
        uname:'tom',
        upwd:'123456'
      }).then(res=>{
      	console.log(res)                 
      })
      ```
  
      * 服务端跨域CORS

        * 不能用`res.send(...)`,只能采取如下方式

           ```javascript
      res.writeHeader(200,{
          'Access-Control-Allow-Origin':'*'
        })
        res.write(JSON.stringify(result));
        res.end
          ```
  
    * post请求

      ```javascript
    axios.post(url,'uname=tom&upwd=123456&...').then(res=>{
        console.log(res)
      })
      ```
  
      * 注意: `get`请求传参用的是`参数对象`;而`post`请求传参用的是`字符串`,且参数和参数之间用`&`分割

      * 当然也可以使用`qs`模块

        ```javascript
      axios.post(url,Qs.stringify(参数对象)).then(res=>{...})
        //qs模块的stringify函数会自动把我们传进去的参数对象,解析成字符串再发请求
        ```
  
    * `axios`的返回结果数`请求主体`的数据.

    * 无论是`get/post`请求,获得响应都是一个全新的对象.传统的响应数据,包含在该对象的`res.data`属性里

    * 因此`res.data`才能获得之前的响应结果

##### 组件

* 是什么
  * 拥有专属`html`,`css`,`js`和数据的,可重用的页面独立区域
  * 在代码层面上,一个组件就是一个可以反复使用的自定义标签
  * 一个页面由多个组件聚合而成一个大型的页面

*  vs bootStrap组件

  * boot组件:虽然可以重用,但是仍需大量的工作亲力亲为,不能绑定数据,比如:轮播图,如果图片变化,就得该html,无法根据数据动态变化

* 为什么

  * 松散`耦合`,便于重用,便于大型项目维护,便于协作开发

* 何时

  * 今后,所有页面,都是由多个组件组合而成
  * 凡是要重用的结构,都可以定义为组件在使用

* 如何

  * 创建一个组件

    * 根组件

      ```html
      <div id='app'>
          
      </div>
      ```

      ```javascript
      new Vue({
          el:'#app',
          data:{
              ...
          }
      })
      ```

    * 全局组件

      ```JavaScript
      Vue.component('组件名',{
          template:'HTML片段',
          data(){
              return {
                  
              }
          },
          methods:{
              
          },
          computed:{
              
          },
          watch:{
              
          }
      })
      ```

      * 组件名

        * 组件名推荐写法`good-cart`,不推荐使用驼峰命名法.因为组件名其实就是今后的`html`标签名,而`html`标签是不区分大小写的,单靠大小写不能唯一标识组件名

      * template

        * 不写`#el`是因为组件并不是一开始就放在页面上的,是无法查找到的

        * 组件每使用一次,都会创建一次`html`片段的副本.最初定义的这一次`html`片段就成为模板

        * 注意: 组件模板中,有且必须只能有一个`父级根元素`,如果不加会报错

          ```javascript
    Components template should contain exactly one root elelment
          ```
      
      * data要写成函数的形式`data(){return {}}`,在函数内通过`return`把数据返回出去

        * 不能写成对象形式,不然会报错

          ```javascript
    the 'data' option should be a function that return a per-instance value in component definitions
          ```
      
        * 因为每个组件都要求有一个专属的`data`对象副本,而不是多个组件公用一个`data`对象

        * 每使用一次组件,都会自动调用`data()`方法,为本次组件副本创建一个`data对象`副本,来保证每个组件都有一个专属的`data`对象副本,互不影响

  * 在视图中去使用组件

    * 组件实际上就是可以可以重复使用的`html`标签

    ```html
    <div id='app'>
        <组件名></组件名>
    </div>
    ```
  
    * 其实: `var vm=new Vue({})`也创建了一个组件,而且是整个页面的根组件
  
    * el

      * 只有`根组件`,才使用`el`属性来绑定元素
      * 其他自定义子组件中,都必须使用`template`属性代替`el`
    
  * 其余以下属性,子组件也可以使用
    
      
  
* 原理

  * 任何`Vue`程序都是由`new Vue()`先开始扫描的
  * `new Vue()`扫描过程中,发现不认识的自定义标签,就会去`Vue`家里查找是否有对应的组件
  * 如果该自定义标签在`Vue`家里找到了对应的组件
    * 先用组件的`template HTML`片段代替当前自定义标签的所在位置
    * 调用`data()`,为本次组件副本创建一个专属的`data`对象

##### 组件化开发

* 组件?

  * 是页面里一块独立的,可以重用的区域
    * 在`HTML`中,是一个可重用的用户自定义的扩展标签,运行时,会被替换为组件对象内的`html`模板内容
    * `JS`中,是一个可重用的`Vue`实例,包含独立的`HTML`模板,模型数据和功能
  * 何时
    * 只要是网页里的一块独立的区域,都可以划分为组件
  * 如何
    * 拿到网页后,先划分区域.每个区域,包括其子区域,都可以做成一个独立的组件
    * 一个页面都是由多块区域,多级组件组成的
    * 面向组件式开发
      * 把网页划分为若干组件组成的区域
      * 每个区域都有属性`数据`,`html`,`css`

* 自定义组件

  * 全局组件:可以在页面任何部分使用的组件

    ```javascript
    Vue.component('comp-name',{
        template:''  //组件模板
        data(){
          return {
              //专有的Model数据
          }
        }
        props:['属性1','属性2',...]  //父子组件通讯时用到
    })
    ```

  * 子组件: 只能用于特定的父组件内的组件

    * 需要先定义子组件对象

      ```javascript
      var xzChild={
          template:'',
          data(){
              return {
                ...  
              }
          }
      }
      ```

      * 子组件命名,强烈建议使用`驼峰`命名法
      * 内容和`Vue.component`中的内容是一样的

    * 后将子组件对象添加到父组件中

      ```javascript
      Vue.component('父组件',{
          template:'...<子组件名/>...',  //包含局部组件元素
          components:{
              //专门用于保存子组件的定义
              //会自动将驼峰翻译为连字符
              xzChild
          }
      })
      ```

* 组件间的通讯/数据传递(难点)

  * 父子间

    * 父传给子

      * 先在父组件中给子组件自定义属性绑定一个父组件的变量,然后就可以把父组件的这个属性交给子组件的自定义属性`props`来保存

        ```html
<父组件>
            <子组件 :自定义属性名='msg'></子组件>
        </父组件>
        ```
        
        ```javascript
data(){
            return {
                msg:'123456'
            }
        }
        ```
        
      * 在子组件里,取出父组件存放在子组件里的自定义属性上的变量值

        ```javascript
  子组件=({
            props:['自定义属性名'],
            data(){
                return {    
                }
            },
            methods:{
                xxx
            }
        })
        ```
      
        * 此时父组件的变量,就会成为子组件的属性,使用方式和`data`变量一样,直接`this.属性名`即可

      * 注意

        * 如果父传给子的是`原始类型的值`,会`按值传递`.所以在子组件里修改这个变量的值,不会影响到父组件的这个变量
  * 但是如果父传给子的是引用类型的`数组或者对象`,其实传递的是`地址`,因此修改子组件的这个属性,也会影响到父组件
    
    * 子传给父

      * 通过自定义事件的方式

      * 父组件

        ```html
        <template id='父'>
          <child @自定义事件='父的处理函数'></child>
        </template>
        ```
        
        ```jsx
        Vue.component('父',{
           methods:{
            父的处理函数(){
              参数得到组件触发事件($emit)时,传递过来的数据
              }
           }
        })
        ```
      
      * 子组件
  
        ```jsx
        this.$emit('父定义的事件名',this.数据)  
        //注意:Vue里的任何带有"$"的都不能擅自改名
        ```
    
  * 兄弟组件的传参

    * 原理: 利用到了`数据总线`机制

    * 过程

      * 创建全局空的`Vue`实例

        ```javascript
      var xxx=new Vie({})
        ```
  
      * 接收者

        * 在`xxx`上绑定自定义事件,并提供处理函数

          ```javascript
        Vue.component('',{
              mounted(){
                  //要写在'挂载后'生命周期阶段才可以
                  xxx.$on('自定义事件',(prop)=>{
                      //需要箭头函数,统一内外的this,或者另生命一个that保存外部this指向
                      //prop将会得到兄弟组件传来的值
                  })
              }
          })
          ```
  
      * 发送者

        * 可在任意时候,触发`xxx`上的自定义事件

          ```javascript
        xxx.$emit('别人的自定义事件',this.数据)
          ```
  
      

![](D:\Users\Pictures\2312.png)

##### SPA(单页面应用)

* 是什么

  * 整个应用只有一个完成的`html`
  * 切换不同的`'页面'`,其实是在切换不同的组件,只是用不同的组件,替换唯一的`html`中指定区域的内容

* vs 多页面应用

  * 页面个数
    * 单页面 : 只有唯一一个完整的`html`文件,每个`页面`其实都是组件
    * 多页面: 多个`html`文件	
  * 页面跳转
    * 单页面 : 重新加载某个`页面组件`,不需要重新构建整个`DOM树`,而是局部替换原`DOM树`中指定元素位置
    * 多页面: 删除整个`DOM树`,重新下载新的`html`文件 ,重新构建`DOM树`
  * 页面重用
    * 单页面 : 只有在`首次加载`时,请求一次.之后切换页面,不需要重新请求
    * 多页面: 即使有可以重用的`css`和`js`,每个页面也必须重新请求一次
  * 页面切换动画
    * 单页面 : 轻松实现
    * 多页面 : 不可能实现

* 如何实现

  * 创建一个唯一完整支持`vue`的`html`页面

    * 引入`vue-router.js`,并在`body`中用`<router-view>`为之后页面组件占位
    * 引入其他页面组件
    * 引入其他公共资源`css`或者`js`

  * 为每个页面都创建一个页面组件

    * 其实就是子组件,只不过当做一个页面用而已
    * 每个页面组件还可以继续包含子组件`components`

  * 创建路由器

    * 先创建路由字典

      ```javascript
      var routes=[
        {path:'/',components:默认首页的页面组件},
        {path:'/相对路径',components:页面组件},
        {path:'*',components:notFound}, //'*'代表除上述内容外的一切路径
      ] //路由字典是包含相对路径和页面组件间对应关系的数组
      ```

    * 创建路由器对象

      ```javascript
      var router=new VueRouter({routes})  //并且传入刚才创建的路由字典
      ```

      * `new VueRouter()`对象会监控着地址栏中的路径
        * 只要地址栏中路径发生变化,就拿着新的路径和路由字典进行匹配
        * 如果找到匹配的话,就找到该路由对应的页面组件对象
        * 就会用这个组件,替换掉之前用于占位的`<router-view`

    * 将路由器对象引入唯一完整的`html`页面里

      ```java
      new Vue({
       ...,
       router
      })
      ```

    * 如果有全局组件,不需要创建为子组件,依然用`Vue.component()`创建.全局组件可在任意`页面`组件或唯一完整的`html`中使用

* 路由跳转

  * html中

    ```html
    <router-link to='/相对路径'>文本</router-link>
    ```

    * 运行时,会被翻译为`<a href='#/相对路径'>文本</a>`
    * 因为将来路径中不一定总是带`#`,如果使用`a`标记,就必须记住自己应不应该加`#`,如果使用`router-link`,`vue`就会自行判断

  * js中

    ```javascript
    this.$router.push('/相对路径')
    ```

    * `$router`就是`new VueRouter()`创建的路由器`router`对象,专门执行页面间的跳转动作

  * 路由参数

    * 路由字典中,让当前路径支持传参

      ```javascript
      {path:'/相对路径/:参数名',component:xxx,props:true}
      //要把props设置为true才行
      ```

    * 在页面组件中添加同名自定义属性`props:['参数名']`

    * 跳转时 `/相对路径/参数值`

    * 结果: 参数值会自动传给`props`中的参数名属性,在页面组件中,可用`this`参数名方式,访问参数值

* $router vs $route
  * `$router`是路由器对象,专门执行跳转动作
  * `$route`是保存地址栏信息的对象,只要希望获得地址栏中的信息时,才适用`$route`,类似于`location.href`
    * 比如在获取地址栏的参数时候可以`this.$route.params.lid`



##### VUE-CLI脚手架

* 是什么

  * 已经包含了核心功能的半成品项目,开发人员只需要添加个性化功能即可

* 使用步骤

  * 安装可以反复生成脚手架代码的命令行工具

    ```cmd
    npm i -g @vue/cli
    ```

  * 运行命令行工具,为一个项目创建脚手架代码

    ```cmd
    vue create my_project
    ```

  * 进入项目文件夹内(看到`package.json`),运行该项目

    ```cmd
    npm run serve
    ```

    * 会启动一个简易的开发服务器
    * 编译脚手架中的代码为传统的`html`,`css`,`js`代码
    * 之后每次修改代码,`run serve`会自动监视代码修改,自动重新编译项目,自动刷新已经打开的浏览器

  * 手动访问该项目

    ```js
    http://127.0.0.1:8080
    ```

  * 项目结构 VS SPA

    * 在`SPA` 里

      ```html
      index.html
      <html>
          <head></head>
          <body>
              <div id='app'></div>
              <script>
                 new Vue({
                     ...
                 })
              </script>
          </body>
      </html>
      ```

    * 在脚手架里

      * 根目录下

        | /            |                                                              |
        | ------------ | ------------------------------------------------------------ |
        | index.html   | `index.html`也就是唯一完整的`html`文件,也可在此引入全局一些`css`,`js`文件.`index.html`最终在引入`app.vue`和`main.js`后才相当于完整的`index.html` |
        | package.json | 实际上我们运行`npm run servr`的时候,就是根据这个文件,对脚手架进行解析打包 |

        

      * `build`文件夹下

        | build                |                                                              |
        | -------------------- | ------------------------------------------------------------ |
        | build.js             | 构建环境下的配置,包括node版本,npm版本以及一些所需模块的导入  |
        | check-versions.js    | 检查`node`和`npm`版本                                        |
        | utils.js             | 配置静态资源路径;生成`cssLoaders`用于加载.`vue`文件中的样式；生成`styleLoaders`用于加载不在.`vue`文件中的单独存在的样式文件 |
        | webpack.base.conf.js | 基本的`webpack`配置,配置编译入口和命名规则,配置模块的`resovle`规则,配置不同模块的处理规则 |
        | webpack.dev.conf.js  | 配置开发环境                                                 |
        | webpack.prod.conf.js | 配置生产环境                                                 |

      * ###### `config`:环境配置相关

      * `src`文件夹下

        | src             |                                                              |
        | --------------- | ------------------------------------------------------------ |
        | main.js         | 入口文件                                                     |
        | app.vue         | 根组件                                                       |
        | router/index.js | 存放了路由对象以及路由字典                                   |
        | components      | 存放了我们各个组件                                           |
        | assets          | 静态资源目录,会被webpack进行打包处理,里面的资源有时候在`css`的`background:url()`以及`js`里都不能直接写路径要写成`require(路径)`的形式 |

      * `static`文件夹

        | static  |                                                              |
        | ------- | ------------------------------------------------------------ |
        | static/ | 是`真正`的静态资源,不会被`webpack`进行处理的,任何在` static/` 中的文件都需要被使用绝对路径` /static/[filename]`来引用. |

  * 创建页面组件 vs SPA

    * SPA中

      ```javascript
      var index={
          template:`html片段`,
          data(){
              return{
                  
              }
          },
          methods:{
              
          }
      }
      ```

    * 脚手架中

      * 在脚手架里`src`文件夹下`component`文件夹下的每个`vue`文件都相当于一个`SPA`组件

        | `.vue`文件   |                                                              |
        | ------------ | ------------------------------------------------------------ |
        | template标签 | 其实就相当于`SPA`里的`template:'html片段'`,<br>原先写在`'html片段'`字符串里的内容,如今写在`<template></template>`标签里就好.<br>另外需要注意的是,标签里的所有内容要包在`唯一`一个大的`div`下 |
        | style标签    | 当成普通`html`页面的`css`标签使用就好<br>需要注意的是要加入`scoped`属性,否则样式可能会影响<br>到其它组件 |
        | script标签   | `template`已经写在专门的标签里了,<br>剩下的`data(){return{}}`,`methods:{}`,等一切正常,直接写在`export default{}`下即可 |

  * 创建路由器VS SPA

    * SPA中

      ```html
      <script src='index.js'></script>
      ```

      ```javascript
      var routes=[
         {path:'/',components:index}
      ]
      var router=new VueRouter({routes})
      ```

    * 脚手架里

      ```javascript
      //   src/router/index.js
      import Index from '../components/index.vue'
      new VueRouter({
          {path:'/',components:index}
      })
      ```

  * 将router引入new Vue()

    * SPA中
      * 手动加入`index.html`中的`new Vue()`中
    * 脚手架
      * `src/main.js`会自动添加`new Vue{(router)}`

  * 全局组件 VS SPA

    * SPA中

      ```javascript
      Vue.component({
          template:'html片段',
          data(){
              return {
                  
              }
          },
          methods:{
              xxx
          }
      })
      ```

    * 脚手架中

      ```html
      <template>
         <div>
          
         </div>
      </template>
      <style scoped>
              ...
      </style>
      <script>
        export default{
          data(){
            return {
              //xxx
            }
          },
          methods:{
            //xxx
          },
          computed:{
           //xxx 
          }
        }
       </script>  
      ```
  * 公用css和js 
  
    * 脚手架中
      * 写在`assets`静态资源文件夹下`/js`和`/css`下即可



##### ES6模块化开发

* 什么是

  * 将一个功能的代码,保存在一个`模块`里,通过引入的方式来使用

* 回顾`Node`的模块化

  * `Node`每个`js`文件就是一个模块,但是模块内代码都是自有的,外部默认用不了

  * 每个`js`文件的代码,必须被导出后,才能被其他模块使用

    ```javascript
    module.exports={要导出的方法名或者属性名}
    ```

  * 其他模块想要用这个模块的成员,必须先引入,再使用

    ```javascript
    var xxx=require('./文件相对路径')
    ```

* ES6中的模块化

  * ES6也规定了模块化开发,但是浏览器都不支持,目前只有脚手架支持

  * 和`node`一样,每个`js`或者`vue`都是一个模块对象.每个模块对象想要别人使用,都需要先`导出`

    ```javascript
    export default{
       js代码
    }
    ```

  * 其他模块想要使用这个模块的成员,都需要先引入后

    ```javascript
    import xxx from './模块所在相对路径'
    ```

* 脚手架里的模块化

  * 每个页面或者说是组件都是一个`vue`文件,每个`vue`文件都是一个模块.想要别人知道有这个模块,必须先导出才行

    ```javascript
    export default{
      data(){
        return {
          ...
        }
      }
    }
    ```

  * 如果在路由器`router.js`文件中,想要使用某个页面组件,必须先引入,再放到路由字典中

    ```javascript
    import index from './views/index.js'
    new VueRouter({
     [
      {path:'/',compoent:index}
     ]
    })
    ```

  * 全局组件

    * 在定义全局组件时候,和普通页面组件,子组件没有任何差别.其实也是个普通的对象模块

    * 如何让这个组件变成全局的

      * 先将组件引入到`main.js`里

      * 让组件对象变成全局组件

        ```javascript
        import Index from './components/index.vue'
        Vue.component('index',Index)
        ```

      * 这样`Index`才会成为全局组件

  * 调用对象模块

    * assets/js/apis/index.js中

      ```javascript
      export{
       getIndex(){
         ... 
       }
      }
      ```

    * index.vue中

      ```javascript
      import {getIndex} from '../assets/js/apis/index.js'
      getIndex().then(res=>{
        //此处必须使用箭头函数,因为只有这样才能保证回调函数内的this和vue的this保持一致
      })
      ```



##### 组件的生命周期

* 什么是 

  * 一个组件从创建,到加载完成的整个过程

* 何时

  * 只要希望在组件加载过程中,某个阶段自动执行一项任务时,就要用到声明周期

* 包括

  | create(创建阶段)  | 此时可以操作`data`中的数据:<br>比如发送`ajax`请求,但是由于页面还没渲染出来,所以不能执行`DOM`操作 |
  | ----------------- | ------------------------------------------------------------ |
  | mounte(挂载阶段)  | 可以操作`data`中的数据,比如发送`ajax`<br>且当处于挂载完毕的阶段时,可以使用`DOM`操作 |
  | update(更新阶段)  | 只要`data`中的数据被改变,就会自动触发更新阶段的方法          |
  | destory(销毁阶段) | 只有主动调用`$destory()`方法时,才会自动触发                  |

* 八个钩子函数

  * 钩子函数
    * 组件加载过程中,自动执行的一种回调函数,称为钩子函数

   

  | 生命周期钩子函数  |              |                                                              |
  | ----------------- | ------------ | ------------------------------------------------------------ |
  | beforeCreate(){}  | 组件创建前   | 会在组件创建前自动调用,此时页面还没有得到的渲染,<br>`data`中的数据以及`methods`中的方法也还没有得到初始化 |
  | created(){}       | 组件创建完成 | 组件创建完成时自动调用,此时页面还没有得到渲染,<br>`data`中的数据以及`methods`中的方法已经得到了初始化<br>可以在此时发送`ajax`请求,以及调用`methods`中的方法 |
  | beforeMount(){}   | 组件挂载前   | 会在组件挂载在`DOM`树之前调用,<br>此时页面还没有完成渲染,因此还不能进行`DOM`操作<br>可以在此时发送`ajax`请求,以及调用`methods`中的方法 |
  | Mounted(){}       | 组件挂载完成 | 会在组件挂载到`DOM`数完成时调用<br>此时页面渲染完毕,可以发送`ajax`,调用`方法`,操作`DOM元素` |
  | beforUpdate(){}   | 组件更新前   | 每次`data`中的数据要发生变化时,会自动执行这个函数<br>        |
  | updated(){}       | 组件更新完成 | `data`中的数据更新完毕后,会调用这个函数                      |
  | beforeDestory(){} | 组件销毁前   | 组件被从`DOM`树上销毁前调用                                  |
  | destoryed(){}     | 组件销毁     | 组件被DOM`树上销毁时调用                                     |

  * 如果路由跳转,并未更换页面组件,而是在同一个页面组件中,仅更换部分值,此时不会重复执行`创建`和`挂载`阶段.导致可能存放在这两个阶段的`ajax`请求不会重复发送,也就无法自动获得新的查询结果


##### 封装axios请求函数

* 定义模块专门保存服务端基础地址

  ```javascript
  //  src/assets/js/config.js
  var baseUrl='http://localhost:5050'
  export {
    baseURl
  }
  ```

* 定义访问某个接口的函数

  ```javascript
  // src/assets/js/apis/index.js中
  // 引入axios和config.js
  import axios from 'axios'
  import {baseUrl} from './config.js'
  ```

  * 强调 : `import`后不要为模块对象起别名,而是直接用解构语法取出对象里的成员 

  * 再定义支持`promise`函数,专门向一个接口发送请求

    ```javascript
    function getIndex(){
      return new Primise(function(resolve,reject){
        axios.get(baseUrl+'/index').then(res=>{
          resolve(res.data)
        })
      })
    }
    ```

  * 导出函数 : `export{getIndex}`

* 在组件中引入函数,并调用函数发送请求,获得响应结果继续操作

  * 先引入包含函数的模块

    ```javascript
    import {getIndex} from '../assets/js/apis/index.js'
    ```

  * 在组件代码中调用函数

    ```javascript
    getIndex().then(result=>{
       //将result中的数据,放到data中
    })
    ```

* 强调

  * 一定要用箭头函数,保持回调函数中的`this`和`vue`中的`this`保持一致,都指向当前组件对象
  * `result`已经是返回结果了,不用在`result.data`了

##### 路由懒加载

* 为何

  * `webpack`如果把所有的`js`文件都打包成一个`js`文件,包会很大,严重影响首屏的加载速度

* 解决

  * 懒加载
    * 把不同的路由对应的组件分割成不同的代码块
    * 当路由被访问时,才动态加载对应的组件文件

* 如何

  * `router.js`或者`router/index.js`中的路由列表`routes`数组里,需要懒加载的路由地址

    * 不要过早`import`,应该是在路由首次被访问到时,才`import`

      ```javascript
      {
        path:'/about',
        name:'about',
        component:()=>import(/*webpackChunkName:"about"*/'../views/About.vue')
        
      }
      ```

    * 其中/**/注释的是,`webpark`的专用数值,其中`chunkname:"名称"`作为将来`webpack`打包时的分文件名,所以这个注释中的名字要尽量和当前路径或页面组件名保持一致

  * 但是仅仅使用上边一步操作是无法实现动态懒加载的

    * 脚手架默认采用`babel`翻译`js`代码,想要懒加载,必须让`babel`知道才行

    * 所以需要手动安装一个`babel`插件

      ```cmd
    npm i -save @babel/plugin-syntax-dynamic-import
      ```
  
    * 使用`npm run build`

    * 编译完成后,可以看到以要懒加载的组件命名的独立的`js`文件

  * 但是这样还不够

    * 因为虽然实现了懒加载,但是其实独立的`js`文件还会在后台异步预先自动下载

      * 好处 : 不影响首页加载速度
    * 缺点 : 浪费流量
  
    * 原因

      * `js`文件和`css`文件都有一个默认属性`prefetch`

        * 表示一旦网络空闲,就会预先下载这个文件

        ```html
      <link href='/js/about.js' rel='prefetch'>
        ```
  
    * 解决

      * 在项目的根目录下

        * 新建`vue.config.js`文件

          * 此文件是`vue/cli3.0`新的`webpack`配置文件

          * 在该文件中

            ```javascript
          module.exports={
              chainWebpack:config=>{
                config.piugins.delete('prefetch')
              }
            }
            ```
  
          * 就会将`link`或者`script`标签上的`prefetch`属性移除,不会再预先下载

* 浏览器打开网站时,打开`network`,只监控`js`文件,刷新页面

  * 如果不访问懒加载的页面,是不会加载独立的`.js`文件的
  * 只有访问到懒加载的页面,才会动态加载`.js`文件

##### keep-alive缓存

* 是什么 : 可以缓存组件内容,避免组件反复加载,影响效率

* 何时

  * 只要我们希望一个组件的内容,不要重复加载

* 如何缓存页面

  * `router.js`或者`router/index/js`中

    * 在需要缓存的路由上加上`meta:{keepAlive:true}`

      ```javascript
      {
      	path:'/',
        name:'home',
        component:Home,
        meta:{
          keepAlive:true
        }
      }
      ```

    * 其中`meta`不能改名,因为它是路由对象专门定义,用来保存定义的属性值配置项

    * 但是`keepAlive`是自定义的属性,可以改名

  * 在`app.vue`中

    * 如果当前路由需要缓存`($route.meta.keepAlive==true)`,就放在`keep-alive`包裹的一个`router-view`中
    * 否则,就放在`keep-alive`外一个`router-view`上

    ```html
    <keep-alive>
    	<router-view v-if='$route.meta.keepAlive'/>
    </keep-alive>
    <router-view v-if='!$route.meta.keepAlive'/>	
    ```

  * 这样一来,带有`keepAlive:true`的路由对应的页面,只在首次请求时,渲染一次内容;之后无论是后退,跳转,都不会重新渲染内容

  * 问题

    * 虽然是同一个页面,但是有时候数据需要缓存,有时候数据不需要缓存
    * 比如
      * 假如有一个商品列表页面,可以根据商品关键词,查询商品列表
      * 如果从首页跳转过来,说明用户输入了查询条件,需要更新查询结果
      * 如果是从详情页跳转过来,说明用户是从商品列表页面跳出去的,现在又回到了商品列表页面,那么应该保留之前的搜索结果

##### 路由守卫/路由钩子函数

* 在发生路由跳转时,自动执行的回调函数

* 何时

  * 如果希望在跳进跳出一个路由时,自动执行一个任务

* 包括

  * 导航被触发
  * 在`失活`的组件里调用离开守卫`beforeRouteLeave`
  * 调用全局的`beforeEach`守卫
  * 在重用的组件里调用`beforeRouteUpdate守卫(2.2+)`
  * 在路由配置里调用`beforeEnter`
  * 解析异步路由组件
  * 在被激活的组件里调用`beforeRouterEnter`
  * 调用全局的`beforeResolve守卫(2.5+)`
  * 导航被确认
  * 调用全局的`afterEach`钩子
  * 触发`DOM`更新
  * 用创建好的实例调用`beforeRouteEnter`守卫中传给`next`的回调函数

* 比如

  * 从首页进入商品页时,不需要缓存,需要重新搜索

    ```javascript
    //home.vue
    beforeRouteLeave(to,from,next){
      console.log('路由离开home页');
      if(to.name=='products'){
        //如果是从首页跳到商品页,不缓存
        to.meta.keepAlive=false
      }
      next()
    }
    ```

  * 从商品列表页面跳转到详情页,需要设置当前商品列表页面被缓存

    ```javascript
    //Product.vue
    beforeRouteLeave(to,from,next){
      console.log('路由离开products页');
      if(to.name=='details'){
        //如果是从商品页跳到详情页,缓存
        to.meta.keepAlive=true
      }
      next()
    }
    ```

  * 从详情页跳转回商品列表页时,需要设置商品列表页面缓存

    ```javascript
    //details.vue
    beforeRouteLeave(to,from,next){
      console.log('路由离开details页');
      if(to.name=='products'){
        //如果是从商品页跳到详情页,缓存
        to.meta.keepAlive=true
      }
      next()
    }
    ```

    

##### Vuex

* 回顾 : 组件间数据共享
  * 父=>子
    * 自定义属性
  * 子=>父
    * 自定义事件
  * 兄弟间
    * EventBus

* Vuex是什么

  * `Vuex` 是一个实现组件全局状态(`数据`)管理的一种机制,可以方便的管理组件之间数据的共享
  * 它采用`集中式存储`管理应用的所有组件的状态，并以相应的规则保证状态以一种可预测的方式发生变化

  * 关系复杂之间的组件传参,可能会很麻烦

    * 比如两个组件不是同属一个父组件的情况,数据想要实现共享,需要传来传去,很麻烦!

    * 但是如果使用`Vuex`就比较容易实现,`Vuex`适合这种**大范围 复杂或者比较频繁的数据共享**

    * 如下图

      ![1584491434588](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1584491434588.png)

* 使用`Vuex`的优点

  * 共享**数据集中**管理,易于开发和维护
  * 高效地实现组件之间的数据共享,**提高开发效率**
  * 存储在`Vuex`里的数据是**响应式的**,能够实时保持**数据和页面的同步**

* 什么数据适合存储在`Vuex`中

  * 组件中共享的数据,一般才有必要存在`vuex`中,对于组件的私有数据,依旧存在组件的自身的`data`里即可

* 安装和配置

  * 安装`vuex依赖包`

  ```cmd
  npm install vuex --save
  ```

  * 创建`store.js`
    * 引入`vuex`
    * 创建`vuex实例`,并且**暴露**出去

  ```javascript
  import Vue from 'vue'
  import Vuex from 'vuex'
  Vue.use(Vuex)
  export default new Vue.store({
    state:{},
    mutations:{},
    action:{}
  })
  ```

  * 在`main.js`中
    * 引入刚才的`store.js`
    * 挂载在`new Vue()`上

  ```javascript
  import store from './store'
  new Vue({
    store  //把store挂载上来
    ...
  }).$mount('#app')
  ```

  

* 核心概念

  * State

    * 提供**唯一的公共数据源**,所有的共享数据都要统一放在`store`中的`State`中存储

    * 比如,在`store.js`里保存一个全局数据`count`

      ```javascript
      export default new Vue.store({
        state : { count:0 }
      })
      ```

    * 在组件里访问这个数据的第一种方式

      ```javascript
      this.$store.state.count        //js中
      ```

      * 如果是在`<template></template>`标签中使用插值表达式时,this可以省略

      ```html
      <template>
        <div>
          <p>{{$store.state.count}}</p>
        </div>
      </template>            <!--template标签里-->
      ```

    * 在组件里访问这个数据的第二种方式

      * 在`vuex`中导入`mapState`函数

        ```javascript
        import {mapState} from 'vuex'
        ```

      * 把刚才导入的`mapState`函数,将当前组件需要的全局数据,映射为当前组件的`computed`计算属性,之后就可以像使用普通`computed`属性一样使用这个全局属性

        ```javascript
computed:{
          ...mapState(['数据1','数据2','数据3'])   //注意要使用'...'展开运算符,因为mapState匹配的是一个数组
        }
        ```
      
    * 在组件里修改这个全局数据

      ```javascript
  this.$store.state.count=1        //js中
      ```
    
      * 这么写确实让全局的`count`数据得到了修改,但是禁止这么写
  * 要通过`Mutation`进行进行`Store`中的数据变更
    
  * Mutation

    * 禁止直接修改`Store`中的数据

      * 直接修改的方式**无法监控**数据的变化,极**不利于后期维护**

    * 只能通过`mutation`修改`Store`中的数据

    * 因为通过这种方式的操作**虽然稍微繁琐一些**,但是**便于集中监控**所有的数据变化

    * **Mutation**使用的第一种方式

      * 在`Store.js`定义`Mutation`函数

        ```javascript
      export default new Vue.store({
          state:{
            num:0
          },
          mutations:{
            calc(state){
              state.num++
            }
          },
          action:{}
        })
        ```
  
        * 定义需写在`new Vue.store()`里面
      * 在`mutations`对象里存放着修改`state`中数据的方法
        * 每个方法都有一个`state`(形参)
        * 要修改哪个属性,就在方法内对`state.属性名`进行相应的操作
  
      * 如何在组件内通过`Mutation`修改数据

        * 通过`this.$store.commit('方法名')`
      * `commit('xxx')`的作用就是调用`Mutation`中的`xxx`方法
  
        ```html
      <button @click='add'></button>
        <script>
        export default{
         methods:{
           add(){
             this.$store.commit('calc')  
           }
         } 
        }
        </script>
        ```
  
      * 如何在调用`Mutation`时传参

        * 直接把想要其他形参写在`state`后面即可
      * 但是`state`必须是第一个,这些形参不能写在它前面
  
        ```javascript
      export default new Vue.store({
          state:{
            num:0
          },
          mutations:{
            calc(state,形参1,形参2){
              state.num+=形参1
              console.log(形参2)
            }
          },
          action:{}
        })
        ```
  
        ```html
      <button @click='add'></button>
        <script>
        export default{
         methods:{
           add(){
             this.$store.commit('calc',4,5)  
           }
         } 
        }
        </script>
        ```
  
    * **Mutation**使用的第二种方式

      * 通过`mapMutation`函数

        * 从`vuex`中引入该函数

          ```javascript
        import {mapMutation} from 'vuex'
          ```
  
        * 通过刚才的函数,将需要的`Mutation`函数,映射为当前组件的`methods`方法

          ```javascript
        export default{
            methods:{
              ...mapMutation(['calc'])  //使用...展开运算符,把数组里的所有方法都映射进来
            
          }
          ```
  
    * 在`Mutation`函数里不能直接执行`异步`操作

    * 想要在`Vuex`中执行异步操作,要通过`Action`处理异步任务

  * Action

    * 何时

      * 如果需要通过异步操作变更数据,必须通过`Action`,不能通过`Mutation`

      * 原理是在`Action`的方法里**异步地**触发`Mutation`方法,但是也不能执行修改

      ```JavaScript
    export default new Vue.store({
        state:{
          num:0
        },
        mutations:{
          calc(state){
            state.num++
          }
        },
        actions:{
          calcAnyc(content){
            setTimeout(()=>{
               content.commit('calc')   //如果有异步操作,先触发action中的方法,再通过这个方法触发Mutation里的方法
            },1000)
          }
        }
      })
      ```
  
      ```html
    <button @click='addAnyc'></button>
      <script>
      export default{
       methods:{
         addAnyc(){
           this.$store.dispatch('calcAnyc')  
         }
       } 
      }
      </script>
      ```
  
    * 如何带参传入

      * 和上面`Mutation`类似,把形参写在后面

      ```javascript
    export default new Vue.store({
        state:{
          num:0
        },
        mutations:{
          calc(state,形参1){
            state.num+=形参
          }
        },
        actions:{
          calcAnyc(content,形参1){
            setTimeout(()=>{
               content.commit('calc',形参1)   //如果有异步操作,先触发action中的方法,再通过这个方法触发Mutation里的方法
            },1000)
          }
        }
      })
      ```
  
      ```html
    <button @click='addAnyc'></button>
      <script>
      export default{
       methods:{
         addAnyc(){
           this.$store.dispatch('calcAnyc',形参1)  
         }
       } 
      }
      </script>
      ```
  
      * `this.$store.dispatch('calcAnyc',形参)  `会先把形参传给`Action`中的方法,`Action`中的方法在异步调用`Mutation`中的方法时,会把自己接收到的形参再传过去

    * 触发Action的另一种方式

      * 从`Vuex`中导入`mapActions`函数

        ```javascript
    import {mapActions} from 'vuex'
        ```
  
      * 将指定的`action`函数,映射为当前组件的`methods`方法
  
        ```javascript
    methods:{
          ...mapActions(['calcAnyc'])
      }
        ```
    
      * 像使用`methods`里的方法一样使用`action`函数,传参也一样
  
        ```html
    <button @click='calcAnyc'></button>
        <script>
      export default{
         methods:{
            ...mapActions(['calcAnyc']) ,
         } 
        }
        </script>
        ```
    
  * Getter
  
    * 什么是

      * 会对`Store`里的数据进行加工生成新的数据,类似`vue`的计算属性
    * `Store`中的数据发生变化,`Getter`里的数据也会变化
  
* 不会修改`Store`里的原数据
      
  * 如何
    
  * 如何定义
    
      ```javascript
    export default new Vue.store({
        state:{
        num:0
        },
        getters:{
          getNum(state){
            return '现在数字是'+state.num
          }
        }
      })
    ```
    
    * 如何使用
    
      ```javascript
    export default{
       methods:{
       showNum(){
           this.$store.getters('getNum')  
         }
       } 
      } //js
      ```
      
      ```jsx
      html
      <p>{{$store.getters.getNum}}</p>  <!--html-->
      ```
      
        * 第二种方法
        
        * 引入`mapGetters`
        
          ```jsx
          import { mapGetters } from 'vuex'
          ```
        
        * 使用展开运算符放在`computed`属性里,当做普通`computed`属性来用
        
          ```JavaScript
          computed:{
            ...mapGetters(['getNum'])
          }
          ```
      
  

##### 

