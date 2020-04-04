### SUM BY LXG

-----------------------------

[TOC]

-----------------

##### let和for循环

* 创建一个`for`循环,假如我们用`var`

  * 循环变量`i`,,每次`i++`

  * 循环条件`i<3`

  * 循环体,设置一定定时器,打印`i`的值

    ```jsx
    for(var i=0;i<3;i++){
      setTimeout(function(){
        console.log(i)
      },50)
    }
    //3 
    //3
    //3
    ```

* 我们发现结果是三个`3`

* ?

  * 分析一下代码的执行过程
    * 在`js`中,定时器里面的回调函数是异步执行的
      * 异步事件会放在事件队列中
      * 等待主程序全部执行完毕了
      * 才会去执行
      * 所以说
        * 即便定时器的时间是`0`,这个函数也不是立刻执行的
    * 而`for`循环是主程序内容,会先执行
    * 每次遇到设置定时器,都会将其中的回调函数放在事件队列中等待执行
    * `for`循环执行完毕了,此时的`i`已经是`3`了
    * 这个时候,定时器里面的回调函数执行,访问变量`i`,然而此时只有一个全局的`i为3`,打印出来全部都是`3`

* 但是,假如我们使用`let`代替`var`,结果就会有大不同

  ```jsx
  for(let i=0;i<3;i++){
    setTimeout(function(){
      console.log(i)
    },50)
  }
  //0
  //1
  //2
  ```

  * `let`的本身相当于匿名函数自调用

  * `let`遇到`for`循环后,会和`for`循环形成闭包

    * 这一点跟`var`很不同,`var`在`for`循环里,会不断刷新循环变量的值

    * 准确来说

      * let把每次循环变量`i`以及循环体都封装进一个闭包里面

        * 把循环体封装进匿名函数自调用里面
        * 然后把本次循环变量`i`,当做参数传进来

      * 所以实际上,这段代码的执行过程其实就相当于

        ```jsx
        for(var i=0;i<3;i++){
        	(function(i){
        		setTimeout(function(){
            console.log(i)
          },50)
        	})(i)
        }
        //0
        //1
        //2
        ```

      * 所以当我们的主程序执行完毕后,定时器的回调函数使用的`i`都被装进了那次循环形成的闭包中,成为局部变量

      * 因为在每次循环生成的闭包里,存在`i`,这个回调函数会直接使用这个`i`

      * 因此最终的答案是`0,1,2`

* 与之类似的,还有一个经典的问题

  * 通过循环,给页面上的5个`button`绑定点击事件,触发后分别打印`0,1,2,3,4`

    ```jsx
    <button onclick='fn()'></button>
    <button onclick='fn()'></button>
    <button onclick='fn()'></button>
    <button onclick='fn()'></button>
    <button onclick='fn()'></button>
    
    
    var btns=document.querySelectorAll('button')
    for(var i=0;i<btns.length;i++){
      btns[i].onclick=function(){
        console.log(i)
      }
    }
    ```

    - 原理类似,如果我们使用`var`创建这个循环

    - 每次循环,都会为当前`btn`绑定事件,但是因为这个事件函数还没有得到触发,因此根本不会管函数体里的内容

    - 实际上,`for`循环生成的`i`,是一个全局变量,在循环外的全局都能访问得到

    - `for`循环会瞬间完成,此时循环变量`i`已经是5

      

    - `button`触发事件函数访问的是全局变量`i`,因此5个`button`打印结果都是5

  * 但是,如果我们通过匿名函数或者`let`的方式来改造这个循环,就能得到`1,2,3,4`

    ```jsx
    var btns=document.querySelectorAll('button')
    for(let i=0;i<btns.length;i++){
      btns[i].onclick=function(){
        console.log(i)
      }
    }
    ```

    * 分析一下原理
      * let相当于匿名函数自调用,会把每次的循环体和循环变量都装进来,形成闭包
      * 因为在每次循环生成的闭包里,存在`i`,这个点击事件函数会直接使用这个`i`来进行打印

* 除此以外,`let`的其他特性
  * 不会声明提前
  * 块级作用域,形成声明死区
  * 和`var`一样可以只声明,不赋值,且可以重复赋值
  * 但是`let`不可反复声明,已经用`let`声明的变量,不可再次声明

* 与`let`同时提出的`const`的特性
  * 不会声明提前
  * 声明时必须进行初始化(也就是说必须赋值)
  * `const`,声明的是常量,所谓常量一经声明就不可以发生变化
    * 不可再次声明
    * 不可再次赋值
  * 习惯上,常量名大写

##### 对象的深浅拷贝

* 何时

  * 有时候我们需要创建一个引用类型对象的副本
  * 二者结构应完全相同
  * 副本和原件相互独立,改动其中之一时,另一个不受影响

* 难点

  * 在`js`中原始类型赋值按值传递,但是引用类型赋值是**按其在内存里的地址**传递的

    * 所以直接赋值的话,不叫拷贝
    * 因为这样的话,二者指向同一个地址
    * 只要二者其一发生改变,另一个也会跟着变
    * 比如

    ```jsx
    let obj={
      uname:'tom'
      age:4
    }
    let obj2=obj
    obj2.age=3
    console.log(obj)  //uname:'tom' age:3
    ```

    * 实际上`obj`和`obj2`只不过都是同一个内存地址的**两个别名**罢了

  * 因此不能采用这个方式进行拷贝

* 浅拷贝

  * 适用于那种简单的对象,也就是每一项都是原始类型,不涉及到数组或对象嵌套的那种

  * 遍历对象,把对象的每一项,交给一个新对象

    ```jsx
    let obj={
      uname:'tom',
      age:4
    }
    let obj2={}
    for(let key in obj){
      obj2[key]=obj[key]
    }
    obj2.age=3
    console.log(obj) //{uname: "tom", age: 4}
    ```

    * 拷贝成功,此时两者其一修改了,另一方不会受到影响

    * 但是,这样依旧存在问题

      * 但是如果我们拷贝的对象是包含 **数组或者对象嵌套** 的复杂对象的话,这个方法就不管用了
      * 因为即使是**对象** 内层的 **子对象** 也是一个引用类型 ,采用`obj2[key]=obj[key]`这种赋值的方式,依旧会导致二者互相影响
      * 比如,浅拷贝之后修改`obj2`的某个子对象后`obj`本身也会受到影响

      ```jsx
      let obj={
        uname:'tom',
       	msg:{
          age:4,
          gender:0
        }
      }
      let obj2={}
      for(let key in obj){
        obj2[key]=obj[key]
      }
      obj2.msg.age=3
      console.log(obj)  //uname: "tom"  msg: {age: 3, gender: 0}
      ```

    * 所以,只要对象的某个属性还是一个 **引用类型** 的话,就需要使用 **深拷贝**

* 深拷贝

  * 何时 : 如果对象的某个属性还是 **引用类型** 时,**浅拷贝**显然已经无法满足需求,需要采用**深拷贝**的方式

  * 原理

    * 和浅拷贝类似

    * 只是多了一个环节

      * 判断对象每个属性是引用类型还是原始类型

        * 原始类型直接赋值,按值传递
        * 引用类型就 **递归** 调用这个方法

        

        ```jsx
        let obj={
          uname:'tom',
         	msg:{
            age:4,
            gender:0
          }
        }
        
        function clone(obj){
          var obj2={}
          for(var key in obj){
            if(typeof(obj[key])!=='object'){
              obj2[key]=obj[key]
            }else{
              obj2[key]=clone(obj[key])
            }
          }
          return obj2
        }
        var obj2=clone(obj)
        obj2.msg.age=2
        console.log(obj)
        ```

        * 但是,单单做到这样是不够的

          * 数组也是**引用类型**,但是数组不应该通过`for in`的形式进行遍历,否则不能达成我们的效果
          * 可能会遇到`null`等情况

        * 所以在执行之前还需进行一步判断

          * 如果是数组,则调用克隆数组的方式

            ```jsx
            {}.toString.call(要判断的内容)  //可判断传入内容的类型
            ```

          * 如果是`null`,直接`return null`

            ```jsx
            let obj={
              uname:'tom',
              family:[2,3,5],
             	msg:{
                age:4,
                gender:0
              }
            }
            
            function clone(obj){
              if(obj==null){
                return null
              }
              if({}.toString.call(obj)=='[Object Array]'){
                return obj.slice()  //slice不写参数代表从开头到最后
              }
              var obj2={}
              for(var key in obj){
                if(typeof(obj[key])!=='object'){
                  obj2[key]=obj[key]
                }else{
                  obj2[key]=clone(obj[key])
                }
              }
              return obj2
            }
            var obj2=clone(obj)
            obj2.msg.age=2
            obj2.family[2]='232'
            console.log(obj)
            ```

  * 这种深拷贝采用 **递归** 方式达成条件

  * 但是递归比较消耗性能,对于涉及多层嵌套的对象,可能会导致**栈溢出**的问题

  * 了解

    * 沙雕网友的写法,过程比较复杂,原理是用循环来写

      ```jsx
      function cloneForce(x) {
        //拷贝对象记录
        const uniqueList = []; 
       
        let root = {};
       
        // 循环数组
        const loopList = [{
          parent: root,
          key: undefined,
          data: x,
        }];
       
        while (loopList.length) {
          //深拷贝，元素出栈
          const node = loopList.pop();
          const parent = node.parent;
          const key = node.key;
          const data = node.data;
       
          let res = parent;
          if (typeof key !== 'undefined') {
            res = parent[key] = {};
          }
       
          // 判断数据是否存在
          let uniqueData = find(uniqueList, data);、
          //数据存在
          if (uniqueData) {
            parent[key] = uniqueData.target;
            break; // 中断本次循环
          }
       
          //数据不存在，将其放入数组
          uniqueList.push({
            source: data,
            target: res,
          });
       
          for (let k in data) {
            if (data.hasOwnProperty(k)) {
              if (typeof data[k] === 'object') {
                // 下一次循环
                loopList.push({
                  parent: res,
                  key: k,
                  data: data[k],
                });
              } else {
                res[k] = data[k];
              }
            }
          }
        }
       
        return root;
      }
       
      function find(arr, item) {
        for (let i = 0; i < arr.length; i++) {
          if (arr[i].source === item) {
            return arr[i];
          }
        }
       
        return null;
      }
      
      ```

  * 如果是数组的拷贝

    * 其实更简单
    * 上面提到过,使用`slice()`进行切割,会返回一个全新地址的新数组
    * 深拷贝的话,判断数组的内容,再执行响应的操作即可

##### 数组的扁平化(降维)

* 存在一个多维嵌套的数组,把这个数组打散为一维数组

* 最简单办法

  * `toString()`方法

    * `toString`对数组使用,会把数组打散为一维数组字符串
    * 然后再使用`split`把这个字符串改为数组即可

    ```jsx
    let arr=[1,2,3,[4,5,[6,7]],8,9]
    let newArr=arr.toString().split(',')
    console.log(newArr)
    ```

    * 但是得到的是一个字符数组
      * 虽然可以遍历每一项将其转为`Number`
      * 但是原数组如果是 **普通数字** 和 **字符数字** 混用的话, 我们将其`toString()`后就无从判断了

* ES6办法

  * `ES6`有提供专门用于处理数组降维的`api`

    ```jsx
    arr.flat('数组深度')
    ```

    * 假如数组是三维数组,深度就写`2`,以此类推

    * 如果不知道深度多少,或者懒得自己算了,直接写`Infinity`

      ```jsx
      let arr=[1,2,3,[4,5,[6,7]],8,9].flat(Infinity)
      ```

* 最经典、最传统办法 ( 其实就是手写flat方法 )

  * 原理

    * 声明一个新数组
    * 写一个方法
      * 遍历原数组的每一项
      * 如果不是数组,直接放进新数组里
      * 如果是数组,就对这个子数组 **递归 **地调用这个方法,直到不是数组为止

    ```jsx
    let arr=[1,2,3,[4,5,[6,7]],8,9],arr2=[]
    function myFlat(arr){
      arr.forEach(item=>{
        ({}.toString).call(item)=='[object Array]'?myFlat(item):arr2.push(item)
      })
    }
    myFlat(arr)
    console.log(arr2)
    ```

* 其他方法

  * 使用`some`配合`isArray`方法

  * 原理和上面类似

    * 遍历数组
    * 只要该数组的某个元素还是数组
    * 就对当前数组展开一次
      * `...arr`会把`arr`数组进行打散
      * `[]+...arr` 会把`arr`打散的新数组拼接为一个新数组

    ```jsx
    let arr=[1,2,3,[4,5,[6,7]],8,9]
    while(arr.some(item=>Array.isArray(item))){
      arr=[].concat(...arr)
    }
    console.log(arr)
    ```

##### 模拟实现Vue的双向绑定

* vue数据绑定原理

  * 改造`data`中对象的属性,并且保护每个属性

    * 将`data`中的数据隐姓埋名半隐藏
    * 为每个属性提供一对`get`,`set`方法进来属性保护

    ```jsx
    //改造data
    var data={
      uname:'tom',
      upwd:'123456',
      gender:0
    }
    //拿到data中的所有的key值
    var keys=Object.keys(data)
    //此时要使用let 或者自己封装一个匿名函数,用var会不断刷新key的值
    for(var key in keys){
      ~function(key){
        Object.defineProperties(data,{
        //动态生成的属性名,要写在[]里,直接拼接字符串是不能用的
        [`_`+key]:{
          value:data[key],
          writable:true,
          enumerable:false
        },
        [key]:{
          get(){return this[`_`+key]},
          set(value){
            this[`_`+key]=value
            console.log(`${key}的属性值变了`)
            //只要发生变化,就自动调用这个change()方法
            change(key)
          }
        },
        enumerable:true
      })
      }(key)
    }
    //将我们的数据密封起来
    Object.seal(data)
    console.log(data)
    ```

    

  * 扫描真实`DOM`树,把有`{{}}`的地方和`data`中的数据对应,构建`虚拟DOM`树

    * 构建虚拟`DOM`树,并完成首次绑定内容
    * 准备数组保存所有可能变化的元素
    * 扫描父元素下是否还有其他子元素
    * 如果有,就递归执行这个方法
    * 否则,就说明当前元素只有内容,并没有嵌套其他的元素节点
    * 每遍历一次,就用当前元素的内容和`data`中的属性名比较
    * 如果`data`中有这个内容,才有必要将这个元素添加到虚拟`DOM`树的数组里
      * 虚拟`DOM`中的每个元素,不但要记录`DOM`的地址
      * 还要记录这个`DOM`元素哪个属性发生了变化,打算变成哪个变量的值

    ```jsx
    var arr=[]
    function getChildren(parent){
      var children=parent.children
      for(var child of children){
        if(child.children.length>c){
          arguments.callee(child)
        }else{
          for(var key of keys){
            if(child.innerHTML==`{{${key}}}`)
              arr.push({
                elem:child,
                innerHTML:child.innerHTML
              })
          }
        }
      }
    }
    getChildren(document.body)
    ```

    * 除此以外,还需要根据本次变化的属性,查找`虚拟DOM`中受到影响的节点,更新真实`DOM`树中该节点的内容
      * 每次调用`set`函数时候,触发这个方法
      * 判断在不在虚拟`DOM树`上
      * 为对应的真实`DOM`更新值

    ```jsx
    function change(){
      for(var obj of arr){
        if(obj.innerHTMl==`{{${key}}}`){
          obj.elem.innerHTML=data[key]
        }
      }
    }
    ```

  

  
  

##### 节流和防抖

* 防抖

  * 是什么

    * 事件在`n`秒内连续触发,就不能得到执行的操作

  * 原理

    * 事件发动时,先不触发函数,而是先读定时器
    * 事件每次触发时,都会不断地刷新重置定时器
    * 因为定时器被不断重置,因此函数也不会得到执行
    * 直到用户停止了操作,在一个定时器的时间后,这个方法就会得到执行

  * 何时使用

    * 比如一个购物车商品数量的加减按钮，用户修改数量后，这个数据要同步给后台。但是于此同时，如果用户每次点击这个按钮都发送一次请求的话，就没有必要了，这种情况就可以利用这个技术
    * 与上面类似的，假如实现一个类似百度的输入框输入功能，会监控我们的输入行为，每次输入都会根据我们输入的关键词，给予提示但是不能每输一个字就不断地调用这个函数发送请求，所以也要使用这个技术，只有用户暂停输入了，才会发送请求

  * 如何

    ```jsx
    function fun(){
    	let foo=function(){
    		console.log('防抖')
    	}
    	let timer=null
    	return ~function(){
    	clearTimeout(timer)
    	timer=setTimeout(()=>{
    	foo().call();
    	},2000)
    }()
    }
    ```

    * 利用闭包机制,声明一个`timer`来控制定时器
    * 事件每次执行都会先清除定时器
    * 然后再重设这个定时器
    * 如果用户短时间内不断地执行这个函数,定时器就会被不断地**清除和重设**
    * 只有用户停止操作了,经一个定时器单位的时长后,事件可以被触发
    * `call和apply`不但能改变`this`指向跟传参,还能让函数立刻执行
      * 与之相对应的还有`bind`,`bind`是一种函数预处理机制
        * 可以永久替换`this`指向
        * 可以传参
        * 同时不调用这个函数

* 节流

  * 是什么

    * 事件在`n`秒内,只能触发一次,会稀释这个函数的执行频率

  * 原理以及使用方法

    * 通过闭包保存一个控制函数是否可以执行的状态`bool`变量
    * 第一次时,我们的函数执行完毕,并且把`bool`修改为`false`
    * 此时`bool`会在`3s`内一直都是`false`
    * 期间,我们每次调用这个方法,都会被直接`return`,不会执行
    * 直到`3s`到了,这个`bool`会被重新定义为`true`
    * 此时才可以再次触发这个函数

    ```jsx
    function fun(){
    	let foo=function(){
    		console.log('节流')
    	}
    	let bool=true
    	return ~function(){
    		if(!bool)return
    		bool=false
    		timer=setTimeout(()=>{
    		foo().call()
    		bool=true
    		},500)
    		}()
    }
    ```

    * 同样,需要使用`call()`,这里并不是为了改变`this`指向,而是单纯让函数立刻执行 


##### 满足a==1&&a==2&&a==3同时成立

* 方法一

  * 利用和数值型进行 **比较判断** 时候的原理

    * 引用类型和数值型进行比较的时候，会调用其原型上的`toString()`方法，将引用类型先转为字符串，然后再和数字型比较
    * 根据原型链的原理
      * 访问某个对象的成员时,会优先查找这个对象的自有成员
      * 自有成员中没有这个方法,会去自己的原型`__proto__`上面找
      * 如果在没有会沿着原型链,去上级原型上找
      * 以此类推,直至顶层还没有,返回`null`
    * `toString`方法本应在一个对象的原型上,但是如果我们把它写为这个对象的自有方法,那么在尽心调用时,它就会优先访问这个自有方法

    ```jsx
    let a={
      a:0,
      toString(){
       return ++this.a
      }
    }
    a==1&&a==2&&a==3
    ```

    * 我们来分析一下这段代码的执行过程
      * 首先会判断`a==1`
        * 因为我们的`a`是一个对象,不能直接做比较
        * 会调用`a`的`toSting`
        * 因为我们手写了一个`a`的该方法,有了自有方法,不再会去原型上找默认方法
        * 因此,这次执行结果我们返回了 `0++`,也就是`1`
      * 同理,我们又先后两次调用了`toString`方法
        * 分别返回了`1++,和2++`
      * 因此最终的结果才能为`true`

* 与之同理的还有第二个方法

  * 与对象同理,数组在和数值类进行比较的时候,也会调用`toString`方法,先转为字符串

  * 我们给数组写一个自有方法`toString`,这样调用数组的`toString`时,就会优先使用自有方法

    ```jsx
    let a=[1,2,3]
    a.toString=a.shift
    a==1&&a==2&&a==3
    ```

    * 数组的`shift`方法是操作原数组,移除数组**首位元素**,并且将删除的那位返回出来

    * 基于此,我们分析一下代码的执行过程

      * 先会判断`a==1`,调用`toString`,但是因为我们用`shift`方法赋值了`toString`,实际上相当于

        ```jsx
        [1,2,3].shift==1
        ```

        ```jsx
        //也就是
        '1'==1
        ```

      * 之后判断,`a==2和a==3`时候,也是这个原理

        ```jsx
        true&&'2'==2
        ```

        ```jsx
        true&&true&&'3'==3
        ```

      * 因此最终结果是`true`

* 我们还可以通过访问器属性来实现这个需求

  * 如果我们给一个对象进行`defineProperty`属性保护

  * 每次我们访问这个属性时,都会调用其`get`方法

  * 每次我们修改这个属性时,都会调用其`set`方法

    ```jsx
    Object.defineProperty(window,'a',{
      get(){
        this.value?this.value++:this.value=1
        return this.value
      }
    })
    a==1&&a==2&&a==3
    ```

    * 分析这段代码的执行过程
      * 首先因为进行判断的`a`是全局变量,其实也就是`window.a`
      * 所以我们给`window.a`设置属性保护
      * 当我们访问这个`a`时候,触发内置的`get`方法
        * 如果存在`value`值,就让`value++`
        * 不存在,就让`value=1`
        * 把`value`返回出去
      * 我们每次进行比较的时候,都会访问`a`,从而触发访问器属性的`get`方法
        * `get`方法三次分别返回出`1,2,3`
      * 因此结果为`true`

##### 作用域、作用域链和hoist

* 作用域?
  * 作用域其实就是一个 **变量** 的有效使用范围
  * 分为
    * 函数作用域
      * 函数的私有变量,只能在函数里才能访问得到
      * 函数在调用时,会临时生成**函数作用域对象**,保存这次函数调用里面的**私有变量**
        * 形参
        * 函数内声明的变量
      * 函数访问某个变量时,只要函数作用域对象里有相应的私有变量,就不会沿着作用域链去上层找
      * 函数调用后,本次调用所形成的作用域对象就被销毁,不复存在
      * 每次函数调用形成的作用域对象,互相独立,互不干扰
    * 全局作用域
      * 在全局声明的变量
      * 一次声明,全局可用,随时可用
      * 但是容易出现全局污染
  
* 作用域链
  * 控制当我们访问一个变量时顺序的链状结构
  
  * 在一个函数内
    * 优先访问私有变量,只要有私有变量就不会访问外部的
      * 就一个函数而言,私有变量就是 **在函数内声明** 的变量,以及**形参**
    * 如果没有沿着作用域链往上找
    * 直到找到`window`都没有,返回`undefined`
    
  * 如果在一个函数内,既有形参`a`,又有用`var`声明的变量`a`,究竟用哪个
  
    ```jsx
    var a=5
    function fn(a){
      var a=10;
      a+=20
      console.log(a)
    }
    fn(a)
    console.log(a)
    ```
  
    * 模拟一下这个函数的执行过程
      * 调用函数,并且传入**实参**`5`
        * 原始类型,按值传递,只是用了外部的`a`赋值了函数内部的形参`a`
        * 无论函数内对`a`进行了怎样的操作,都和外部的`a`无关
      * 因为在函数内,已经存在私有变量`a`(形参)
      * 因此`var a`不会生效
        * `js`不会重复声明当前作用域已经存在的变量
      * 但是赋值`a=10`保留
      * 随后`a+=20`
      * 所以最后的答案是`30和5`
  
* 一些例题以及代码分析

  ```jsx
  1.
  var b=10
  function fn(){
    b+=1
    var b=100
  }
  fn()
  console.log(b)
  ```

  * 分析一下代码的执行过程

    * 在全局声明变量`b`,声明提前,赋值留在原地

    * 在函数内,`var`声明的变量,会提升到当前作用域最前面,赋值留在原地,函数的执行过程相当于

      ```jsx
      function(){
      	var b   
        b+=1
        b=100
      }
      ```

      * 先是声明一`b`,但是没赋值,所以值是`undefined`
      * `b+=1`,因为在函数作用域内存在`b`私有变量,所以不会使用全局的变量,未定义的值`+1`,是`NaN`
      * 最后给`b`赋值100
      * 从始到终,函数内部的操作都和外部`b`无关,因此外部的值为`10`

  ```jsx
  2.
  var c=10
  function fun(c){
    c=100
    c+=1
  }
  fun(c)
  console.log(c)
  ```

  * 分析代码的执行过程

    * 在全局中声明变量`c`,声明提前,赋值留在原地

    * 经声明提前处理后的整个代码

      ```jsx
      var c
      function fun(c){
        c=100
        c+=1
      }
      c=10
      fun(c)
      console.log(c)
      ```

      * 我们将外部全局的`c`传入其中,按值传递,相当于给形参`c`赋值为`10`
      * 在函数内,因为存在私有变量`c`,因此任何操作都和外部的`c`无关
      * 所以外部的`c`最终还是10

  ```jsx
  3.
  function fn(){
    console.log(1)
  }
  fn()
  
  
  function fn(){
    console.log(2)
  }
  fn()
  
  
  var fn=100
  fn()
  ```

  * 分析这段代码的执行过程

    * 函数声明和`var`声明都会在编译时提升到作用域最前面
    * 于是这段代码其实相当于

    ```jsx
    function fn(){
      console.log(1)
    }
    function fn(){
      console.log(2)
    }
    var fn
    fn()
    fn()
    fn=100
    fn()
    ```

    * 函数其实也是对象,函数名其实就是一个普通的变量名
    * `function`关键字其实就是创建一个函数对象,并把对象的地址交给`fn`来保存
    * 之后我们又声明了一个同名函数对象,因为内存中已经存在了`fn`,不会再次声明,但是会用新函数对象的地址覆盖旧的值
    * `var fn`时,因为已经存在`fn`了,不会再重复创建,此代码相当于无效
    * `fn()`执行,此时`fn`保存的是我们第二次声明的函数对象,所以结果是`2`
    * `fn()`执行,此时`fn`保存的依旧是我们第二次声明的函数对象,没有变化,所以结果是`2`
    * 之后我们给`fn`赋值为`100`,覆盖了原先的函数对象
    * 再次调用`fn`,此时`fn`只是一个数值,而不是函数,因此会报错,提示`fn不是一个方法`

  ```jsx
  4.把3改为如下,分析结果
  var fn=function(){
    console.log(1)
  }
  fn()
  
  
  var fn=function(){
    console.log(2)
  }
  fn()
  
  
  var fn=100
  fn()
  ```

  * 分析代码执行过程

    * 先是处理声明提前机制,代码相当于

    ```jsx
    var fn
    var fn 
    var fn
    fn=function(){console.log(1)}
    fn()
    fn=function(){console.log(2)}
    fn()
    fn=100
    fn()
    ```

    * 首先声明了一个`fn`
    * 因为已经存在了一个`fn`了,所以后两个`var`无效
    * 接着给`fn`赋值一个函数的地址
      * 当使用`var`声明函数时,只有函数名会提前,函数本身并不提前
    * 此时调用函数,结果就是`1`
    * 再给`fn`赋值一个函数对象的地址,覆盖了之前的
    * 此时调用函数,结果就是`2`
    * 给`fn`赋值`100`
    * 此时`fn`已经不再指向一个函数对象,而是普通的数值
    * 因此没办法被当成函数来调用
    * 报错`fn is not a function`

  ```jsx
  5.
  var a=10
  function fun(){
    a=100
    a+=1
    console.log(a)
  }
  fun();
  console.log(a)
  ```

  * 详细分析代码执行
    * 在全局声明一个变量`a`
    * 我们调用函数`fun`,此时就会生成一个函数作用域对象
    * 但是因为函数内没有一个形参`a`或者声明的变量`a`
    * 所以函数作用域对象是空的
    * 此时我们在函数里,访问`a`,会沿着作用域链向上找
    * 找到了全局的`a`
    * 全局的`a`最终被修改为了`101`
    * 无论函数内外,`a`的打印都是`101`

##### 闭包

* 是什么

  * 外层函数的作用域对象，因为被内层函数引用着，而无法的得到释放,我们把这个无法得到释放的作用域对象称为闭包

* 作用

  * 在`js`中，全局变量虽然一次声明全局可用，但是极容易被污染；
  * 而函数内的变量，虽然不会被污染，但是几乎不可复用，函数一经调用完毕，就会被垃圾回收
  * 闭包就是这样一种机制
    * 既保护变量不受到污染,闭包对象在全局无从篡改
    * 同时又可让这个变量得到复用

* 原理

  * 外层函数调用后,会形成自己的作用域对象
  * 这个作用域对象因为被内层函数引用着,无法释放,形成闭包
  * 内层函数调用时,会优先使用自己的变量,自己没有,才去外层的作用域对象里找
  * 内层函数在调用后,只会释放自己,但是无法释放外层的作用域对象,使得外部作用域对象一直存在
  * 因为外部函数的变量并没有保存在全局,所以在函数外绝无篡改可能 ! 

* 缺陷

  * 消耗性能,比普通函数多占用一块内存空间

* 分析一段代码

  ```jsx
  function parent(){
    var total=1000
    return function(money){
      total-=money
      console.log(total)
    }
  }
  var pay=parent()
  pay(100)
  total=0
  pay(100)
  pay(100)
  ```

  * `parent`调用时,临时创建 作用域对象 , 保存这个函数的私有变量
  * 首先我们把`parent()`的执行结果(也就是`return`出来的那部分),交给`pay`来保存
  * 一般来说,函数在调用一次后就被释放,作用域对象也会被释放,但是因为内层函数引用着外层函数的变量`total`,因此外层函数并没有得到释放
  * 调用`pay()`函数的时候,用到了变量`total`
    * 先在自有的作用域对象里查找`total`
    * 发现没有,沿着作用域链去外层函数的作用域对象里找
    * 对外层函数的变量`total`进行了修改操作
      * 假如,我是说假如外层函数的作用域对象也没有这个变量,才会去`window`中找
    * 而`total=0`是针对全局变量`total`进行的操作,和函数内的`total`无关,闭包里的变量从全局无从篡改
  * 因此得到结果`900 800 700`
  * 这样一来,既保证了变量的复用,又使得变量在函数里,不会受到全局污染
  
* 闭包习题

  ```jsx
  var number=2
  var obj={
    number:4,
    fn:(function(){
      this.number*=2;
      number*=2;
      var number=3;
      return function(){
        this.number*=2
        number*=3
        console.log(number)
      }
    })()
  }
  var fn=obj.fn
  console.log(number)
  fn()
  obj.fn()
  console.log(number)
  console.log(obj.number)
  ```

  * 分析代码执行

    * `obj.fn`存储的只是一个 **自调用的匿名函数的地址** ,这个函数会在自动调用后,将返回结果交于`obj.fn`保存

    * 首先分析这个匿名函数自调用

      * 首先`var number`,声明提前,赋值留在原地

      * `this.number*=2`

        * 匿名函数的`this`指向`window`,因此全局的`number`修改为`4`

      * `number*=2 num=3`

        * 最终函数内的`number`被赋值为`3`

      * 我们把函数`return`的部分交给`obj:fn保存`

        ```jsx
        obj:{
          number:4,
        	fn: function(){
              this.number*=2
              number*=3
              console.log(number)
            }
        }
        ```

      * 但是外层函数的作用域对象因为被`obj.fn`牵引着,并没有得到释放

    * `var fn=obj.fn`,实际上就相当于

      * 函数是引用类型,传值传的是在内存中的地址
      * 因此`fn`和`obj.fn`其实是一个地址

      ```jsx
      var fn=function(){
            this.number*=2
            number*=3
            console.log(number)
          }
      ```

    * `console.log(number)`

      * 在匿名函数自调用的时候,全局的`number`已经被修改为`4`

    * `fn()`

      * `fn`其实就相当于`window.fn`,此次调用`this`为`window`

        * 因此全局的`number`被改为`8`

        * 但是`number*=3`时

          * 因为`fn`和`obj.fn`引用的是同一个地址的同一个函数

          * 使用的`number`是当时因为闭包而没有被释放的`number`
          * 因此闭包内的`number`被改为`9`
          * 打印结果是`9`

    * `obj.fn()`

      * `obj.fn`调用时,`this`为点前对象`obj`
      * 因此`obj.number`被修改为8
      * 但是`number*=3`时
        - 使用的`number`依旧是当时因为闭包而没有被释放的`number`
        - 因此闭包内的`number`被改为`27`
        - 打印结果是`27`

    * 最后全局下的`number`刚才被改为`8`

    * `obj`下的`number`刚才也被修改为`8`

    * 结果`4 9 27 8 8`

##### 多态

- **同一方法**在不同情况下,表现出不同的样式

- 比如

  * 如下实例的基类都是`Object`,但是他们的`toString`方法各不相同

  ```jsx
  对象.toString()             //[Object object]
  数组.toString()             //会把数组降维且打散为字符串
  数字.toString()             //数字字符
  bool.toString()            //字符串true或者false
  date.toString()            //日期字符串
  ```

  * 因此,虽然同是`toString`方法,但是在不同情况下,也表现出不同的样式
  * 实际上是因为`Array,Number,Bool,Date`等如果使用 基类`Object`上的`toString`方法是不能完全满足需求的
    * 因此各自在其原型上重写了`toString`方法

- 如果子对象觉得父对象的成员不好用,可在本地定义同名自有成员,来覆盖父对象中的成员



##### Foo.a

```jsx
function Foo(){
  Foo.a=function(){
    console.log(1)
  }
  this.a=function(){
    console.log(2)
  }
}
Foo.prototype.a=function(){
  console.log(3)
}
Foo.a=function(){
  console.log(4)
}

Foo.a()
let obj=new Foo()
obj.a()
Foo.a()
```

* 首先我们分析代码的执行过程

  * 首先函数声明提前(没什么卵用,本身就在最前面),这个函数暂时没有得到调用,里面是什么不要管

  * `Foo.prototype.a=function(){...}`

    * 其实函数也是个对象
    * 因此会给`Foo`函数对象的原型对象强行赋值一个方法
    * 现在全局`Foo`原型上的`a`方法是打印`3`

  * `Foo.a=function(){...}`

    * 会给`Foo`函数对象强行添加自有方法`a`,该方法为打印`4`

  * 然后我们调用`Foo.a()`

    * 根据原型链使用规则
      * 优先访问自有成员,自有成员找不到时,才去访问原型
      * 自有成员有`a`这个方法,所以先会打印`4`

  * 然后我们把`Foo()`当成构造函数函数,创建一个其实例`obj`,同时调用`Foo`

    * `Foo.a=function(){console.log(1)}`

      * 因为函数作用域对象内找不到一个叫做`Foo`的变量,于是只能沿着作用域链去`winoow`下找全局的
      * 导致全局的`Foo`(其实也就是函数本身)的`a`被篡改为打印1

    * 同时构造函数实例化时,`new`关键词会进行四部操作

      * 创建一个新的空的对象

      * 用这个新对象调用构造函数,将构造函数中的`this`指向这个新对象,因此对这个对象中的属性进行强行赋值

        * `js`中给不存在的变量或者属性赋值,会强行创建该属性,然后强行赋值

      * 同时让新对象的`__proto__`指向构造函数的`prototype`

      * 将这个新对象返回,并且赋值给我们声明的`obj`

      * 因此`obj`现状

        ```jsx
        obj:{
        	a=function(){
            console.log(2)
          }
        }
        ```

  * 所以我们调用`obj.a()`时候,结果是`2`

  * 因为刚开`Foo()`函数调用时,已经把的`Foo.a`方法篡改

  * 因此现在访问时,结果是`1`

  * 结果`4 2 1`

##### foo.x

```jsx
var x=0
var foo={
  x:1,
  bar:function(){
    console.log(this.x)
    var that=this
    return function(){
      console.log(this.x)
      console.log(that.x)
    }
  }
}
foo.bar()
foo.bar()()
```

* 分析代码执行过程
  * 声明提前
    * 在本题意义不大,不着重考虑
  * 调用`foo.bar()`
    * `console.log(this.x)`,在对象内,`this`指向本对象,结果是`1`
    * `var that=this`,声明了一个`that`保存了`this`指向`foo`
    * 返回一个`方法`,但是这个没有既变量接住,也没有执行,所以不考虑
  * 调用`foo.bar()()`
    - console.log(this.x)`,在对象内,`this`指向本对象,结果是``1`
    - `var that=this`,声明了一个`that`保存了`this`指向`obj`
    - 返回一个`方法`,并且调用了这个方法
      * 外层函数的作用域对象,因为被内层函数牵引着无法释放,形成闭包
      * 此时`that`保存刚才的`this`指向`foo`,因此`that.x`是`1`
      * 而`return`出来的函数被执行,相当于函数自调用,因此`this`指向`window`

##### querySelector vs getElement

```jsx
<div id='d1' class='content'></div>
<div id='d2' class='content'></div>
<div id='d3' class='content'></div>

var divs=document.getElementsByClassName('content')
console.log(divs.length)    //3
d2.className='main'
console.log(divs.length)   //2
```

* ?
  * 因为`getElement`返回的是一个动态集合
    * 不实际存储数据
    * 每次访问集合时,都会重新扫描`DOM`树
    * 因为每次都不实际存储数据,所以单次查找速度快
* querySelectorAll
  * 返回的是一个非动态集合
    * 集合中实际存储查找的所有数据,会储存起来
    * 重新访问时,直接使用之前储存起来的值,不会重复查找
    * 但是如果`DOM`结构发生变化,我们的 非动态集合 也无从获知
    * 所以在本题目中,如果一直使用它,结果会一直是`3`

* 何时使用
  * `getElement`首次查找快,但是每次都会重新查找
    * 所以查找条件简单时
  * `querySelectorAll`首次查找慢,但是后续操作方便
    * 查找条件复杂时,可以使用这个



##### 包装类型

* 是什么

  * 专门封装一个原始类型的值
  * 并提供对原始类型值执行操作的函数的对象

* 为什么

  * 原始类型的值,只是单纯的一个值而已,没有任何的自带功能

* 何时

  * 只要试图对原始类型的值调用函数或访问属性时,都会自动创建该类型的包装类型对象
  * 我们访问的函数或者属性,其实都是包装类型对象提供的

* 比如

  ```jsx
  var str='hello'
  str.toUpperCase()
  ```

  * `str`本身只是一串字符,当我当我们对其调用`toUpperCase()`方法时

    ```jsx
    //先判断 str 具体是什么类型
    typeof str  //String
    //于是 创建一个实例对象
    str=new String('hello')
    //于是就会去String的原型对象里找 toUpperCase这个方法,加以调用
    str.toUpperCase()
    ```

* 例题

  * 一串字符串`hello`,如何给其创建`money`属性,并且赋值为`10`

    ```jsx
    var str='hello'
    str.money=10
    console.log(str.money)  //undefined
    ```

    * 上面的方法是不行的
    * 需要这样

    ```jsx
    var str=new String('hello')
    str.money=10
    console.log(str)
    //String {"hello", money: 10}
    ```

##### promise和async、await

* 比如

  * 服务端有三接口

    ```jsx
    //127.0.0.1:8080/#/goods?type=a
    
    {"type":"a","count":"40"}
    ```

    ```jsx
    //127.0.0.1:8080/#/goods?type=b
    
    {"type":"b","count":"30"}
    ```

    ```jsx
    //127.0.0.1:8080/#/goods?type=c
    
    {"type":"c","count":"20"}
    ```

    

  * 我们想分别发送三次`axios`请求，计算三次`count`的累加值

  * 于是

    ```jsx
    var count=0
    axios.get('127.0.0.1:8080/#/goods?type=a').then(res=>{
      count+=res.count
    })
    axios.get('127.0.0.1:8080/#/goods?type=b').then(res=>{
      count+=res.count
    })
    axios.get('127.0.0.1:8080/#/goods?type=c').then(res=>{
      count+=res.count
    })
    console.log(count)  //0
    ```

  * 结果发现 `count为0`

  * ?

    * 发送`ajax`请求是异步操作
    * 会先在事件队列里等待
    * 等我们同步操作执行完了,才去执行异步的
    * 所以实际上
      * 请求还没发
      * 就已经打印结果了

* 如何解决?

  * 让异步操作有顺序地执行?

  * 笨方法

    * 回调嵌套方式

      ```jsx
      var count=0
      axios.get('127.0.0.1:8080/#/goods?type=a').then(res=>{
        count+=res.count
        axios.get('127.0.0.1:8080/#/goods?type=b').then(res=>{
       		count+=res.count
      		axios.get('127.0.0.1:8080/#/goods?type=c').then(res=>{
        		count+=res.count
            console.log(count) //90 
      		})
        })
      })
      ```

      * 回调函数原理
        * 函数执行时先去执行主函数
        * 主函数执行完了,才去执行回调函数的内容
        * 基于此,使得异步操作可以有序化

  * 缺陷

    * 嵌套层数多了,代码可读性差
    * 容易造成视觉混乱

* promise(承诺)

  * 专门解决回调地狱问题
  * 既可以保证减少代码深层嵌套结构
  * 又可以保证多个异步任务顺序执行

  ```jsx
  var total=0
  function getCount(type){
    return new Promise(
      function(resolve,reject){
      	axios.get(`127.0.0.1:8080/#/goods?type=${type}`).then(res=>{
    			resolve(res.data.count)  //相当于开门,把参数传给后面的then
  			})
    })
  }
  //链式操作,每次都把下一步执行的方法 给return出去,方便下一个then来接住
  getCount('a').then(count=>{
    total+=count
    return getCount('b')
  })
  .then(count=>{
    total+=count
    return getCount('c')
  })
  .then(count=>{
    total+=count
   	console.log(total) //90
  })
  ```

  * 原理

    * `resolve()`调用,代码当前这步 异步操作已经完成,可以进行下一步操作
      * `resolve()`调用时还可以传参
    * 参数会被后面的`then(...)`的形参来接住
    * `promise`函数里不能写`return`

    * 链式操作
      * 每次都把下一步操作调用并且`return`出去
      * 由下一次的`then()`来接住

  * 但是如上代码,其实完全没有必要这样麻烦,因为`a,b,c`并没有一个固定的顺序

  * 只要请求的发送是在打印行为之前的就可以

  * 所以可以简化为两步

    * 发送`a b c` 请求,但是顺序无关紧要
    * 请求完成了,获取到结果了,再进行打印

    ```jsx
    //三个请求并行,等所有的请求都执行完,才执行总数
    var total=0
    function getCount(type){
      return new Promise(
        function(resolve,reject){
        	axios.get(`127.0.0.1:8080/#/goods?type=${type}`).then(res=>{
      			total+=count  //相当于开门,把参数传给后面的then
            resolve(res.data.count)
    			})
      })
    }
    Promise.all([
      getCount('a'),
      getCount('b'),
      getCount('c')
    ]).then(res=>{
      total=result.reduce((prev,elem)=>prev+elem) //res会被Primise.all每次的执行结果都放进来,是一个数组,把他们累加起来就是最终的结果90
    })
    ```

    * `promise.all`数组里的操作,并没有一个必要的先后顺序
    * `promise.all`数组里的都应是`new Promise`对象

* async,await

  * 方法

    ```jsx
    (async function(){
      var count=await getCount('a')
      total+=count;
      await getCount('b')
      total+=count;
      await getCount('c')
      total+=count;
    })()
    ```

  * 原理

    * 加了`await`的代码都会被挂起
    * 前面的代码执行完了,才会得到执行
    * 把每一个代码都加上`await`相当于变成了同步
    * `await`要配合`new Promise()`来进行使用
      * 它的作用是代替的是`then()`
      * 但是必须要有`promise`

  * 实现并行

    ```jsx
    
    (async function(){
      var result=await Promise.all([
      getCount('a'),
      getCount('b'),
      getCount('c')
    ]) 
      total=result.reduce((prev,elem)=>prev+elem)
    })()
    ```

##### 微信小程序的重点汇总

* 项目结构

  | WXML | 微信小程序框架设计的一套标记语言<br />结合基础组件和事件系统，配合`wxss`绘制页面 |
  | ---- | ------------------------------------------------------------ |
  | WXSS | 微信小程序框架设计的一套样式文件<br />用法和`css`类似<br />但是提供了`rpx`单位,响应式像素单位 |
  | js   | 小程序的逻辑文件,或者发送请求,发送云函数<br />配合`wxml`完成事件的绑定,以及数据的渲染<br />但是不能执行`DOM`操作 |
  | json | 小程序设置，如页面注册，页面标题及`tabBar`                   |

* 原理和本质

  * 类似于`vue`,本质还是一个单页面应用
    * 所有的所谓的`页面`,其实都是组件
  * 视图层和数据层分离
    * 任何`ui`界面的变化都是基于数据的变化

* 如何使用双向绑定

  * 单向绑定

    * 使用`{{ }}`差值表达式给页面元素绑定数据

  * 双向数据绑定

    * 微信小程序不直接支持双向绑定
    * 如果想要实现数据的双向绑定,需要自己手写方法
      * 双向绑定用于表单元素
      * 表单内的数据变动也将同步到数据层
      * 所以给表单元素创建输入事件,监控我们每次的输入行为
      * 通过事件对象,获取表单内的`value`,然后通过`this.setData`反作用于数据层

    ```jsx
    <input  placeholder="输入关键字" bindinput="change"></input>
    change: function(e){
        this.setData({
          msg:e.detail.value,
        })
      }
    ```

* this.setData()

  * 是什么

    * 小程序提供的修改组件内`data`变量的方法

    * 原理

      * 访问器属性的`set`方法

    * 注意什么

      ```jsx
      this.setData({
        msg:'2',
        msg2:'23'
      })
      ```

      * 要把修改的变量写在这个对象里

      * 如果要修改的属性名是动态拼接而成的,要在外边加`[ ]`,不能直接拼接字符串,不然会报错

        ```jsx
        this.setData({
          [`msg${index}`]:2
        })
        ```

* 全局变量

  * 全局变量一般存储在`app.js`中

    * 和`vue`一样,小程序框架也是单页面应用
    * `app.js`中的数据从小程序各组件都能访问的到

  * 如何

    * 定义

      * 在`app.js`中的`APP({})`巨大对象里创建一个`globalDate`来专门保存

        ```jsx
        //app.js
        APP({
          globalData:{
            msg:2
          }
        })
        ```

    * 使用

      ```jsx
      console.log(getApp().globalData.msg)
      ```

    * 修改
    
      ```jsx
      getApp().globalData.msg=3
      ```
  
  
  
* 调用页面绑定事件时如何传参

  * 不能直接在方法名后的`( )`里写 , 否则在`js`会获取不到

  * 需要通过自定义属性`data-xxx`的方法

    ```jsx
    <view data-url='baidu.com' bindtap='goSomewhere'></view>
    
    taskDetail(e){
    	var url = e.currentTarget.dataset.url;
    	wx.navigateTo({
        url: `http://www.${url}`
      })
    
    ```
  
* 小程序的路由跳转

  | 方式                          | 是否可以跳转到tabBar | 特性                                                         |
  | ----------------------------- | -------------------- | ------------------------------------------------------------ |
  | wx.navigateTo( 打开新页面 )   | 否                   | 保留当前页面<br />跳转到应用的某个界面<br />路径之后可以带参数 |
  | wx.redirectTo ( 页面重定向 )  | 否                   | 关闭当前页面<br />跳转到应用内的某个页面<br />可带参         |
  | wx.navigateBack  ( 返回页面 ) | 否                   | 关闭当前页面<br />返回之前上一个页面<br />或者上几个页面     |
  | wx.switchTab ( tabBar跳转 )   | 是                   | 只能跳转到`tabBar`页面<br />不能跳转到其他页面<br />调用时会关闭所有非`tabBar`页面<br />之后进行切换,不可带参数 |
  | wx.reLaunch ( 重启 )          | 是                   | 关闭所有页面<br />然后跳转到指定页面<br />是否为`tabBar`页面皆可,<br />但是如果是`tabBar`的话,不能携带参数 |

* 小程序的生命周期

  * 是整个小程序的生命周期,而不是单个页面的
* 写在`app.js`中
  
  | 声明周期 |                             特性                             |
  | -------- | :----------------------------------------------------------: |
  | onLaunch |      用户首次打开小程序，会触发onLauch(全局只触发一次);      |
  | onShow   | 小程序初始化完成后，触发onShow方法，监听小程序显示；<br />小程序从后台进入前台显示，触发onShow方法 |
  | onHide   |            小程序从前台进入后台，触发onHide方法；            |
  | onError  |     小程序后台运行一定时间，或系统资源占用过高，会被销毁     |
  
  

* 页面的生命周期

  ![img](https://res.wx.qq.com/wxdoc/dist/assets/img/page-lifecycle.2e646c86.png)

  | 周期              |                    特性                     |
  | ----------------- | :-----------------------------------------: |
  | onLoad            |   用户首次打开小程序时触发,全局只触发一次   |
  | onReady           |             页面初次渲染时触发              |
  | onShow            | 页面显示时触发,或者是页面从后台切换到前台时 |
  | onHide            |          页面从前台切往后台时触发           |
  | onUnload          |               页面卸载时触发                |
  | onPullDownRefresh |           用户触发下拉事件时调用            |
  | onReachBottom     |         用户触发上拉触底事件时调用          |

  

* 如何实现下拉刷新
  * 首先在全局 `config` 中的 `window` 配置 `enablePullDownRefresh`
  * 在 `Page` 中定义 `onPullDownRefresh` 钩子函数,到达下拉刷新条件后，该钩子函数执行，发起请求方法
  * 请求返回后，调用 `wx.stopPullDownRefresh` 停止下拉刷新

*  bindtap和catchtap的区别是什么
  * 相同点：
    * 首先他们都是作为点击事件函数，就是点击时触发。在这个作用上他们是一样的，可以不做区分
  * 不同点：
    * 他们的不同点主要是`bindtap`是不会阻止冒泡事件的，`catchtap`是阻值冒泡的



##### 百度地图API3.0最基本的调用

* 首要准备

  * 申请百度地图开发者密钥

* 初步配置百度地图

  * 页面上注册一个`#container`来保存咱们的地图
  * 注意要给`body`,以及地图容器一个高

  ```html
  <head>  
      <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
      <title>Baidu Map </title>  
      <style type="text/css">  
          html{height:100%}  
        
          body{height:100%;
            	margin:0px;
            	padding:0px}  
        
          #container{
  					height:100%
        	}  
      </style>  
  </head>  
  <body>
    <div id='container'></div>
  </body>  
  ```

  * 引入百度地图`js`文件

    ```jsx
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=您的密钥"></script>
    ```

    * 注意密钥就是刚才我们申请的密钥

  * 初始化地图逻辑

    ```jsx
    var map = new BMap.Map("container");          // 创建地图实例  
    var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
    map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别  
    ```

  * 是否开启滚轮缩放

    ```jsx
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    ```

  * 至此我们初步配置了一个带有缩放功能的百度地图

    ![1585704436841](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1585704436841.png)

    

* 地图控件

  | **控件**     | 命令                                                         | **简介**                                                     |
  | ------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
  | 抽象基类     | Control                                                      | 所有控件均继承此类的方法、属性。通过此类您可实现自定义控件   |
  | 平移缩放控件 | map.addControl(new BMap.NavigationControl())                 | PC端默认位于地图左上方，它包含控制地图的平移和缩放的功能。移动端提供缩放控件，默认位于地图右下方 |
  | 缩略地图     | map.addControl(new BMap.OverviewMapControl());               | 默认位于地图右下方，是一个可折叠的缩略地图                   |
  | 比例尺       | map.addControl(new BMap.ScaleControl());                     | 默认位于地图左下方，显示地图的比例关系                       |
  | 地图类型     | map.addControl(newBMap.MapTypeControl());<br/>map.setCurrentCity("北京"); | 默认位于地图右上方                                           |
  | 定位         | GeolocationControl                                           | 针对移动端开发，默认位于地图左下方                           |

  * 控件的添加基于需求

    

* 本地搜索功能

  ```jsx
  var local = new BMap.LocalSearch(map, {      
  		renderOptions:{map: map}      
  });      
  //本地搜索
  local.search("肯德基");
  //周边搜索
  local.searchNearby("小吃", "前门");
  ```

* 获取当前位置

  ```jsx
  var geolocation = new BMap.Geolocation();
  		geolocation.getCurrentPosition(function(r){
  		   if(this.getStatus() == BMAP_STATUS_SUCCESS){
  		       var mk = new BMap.Marker(r.point);
  		       map.addOverlay(mk);
  		       map.panTo(r.point);
  		       alert('您的位置：'+r.point.lng+','+r.point.lat);
  		   }else{
  		       alert('failed'+this.getStatus());
  		   }},{enableHighAccuracy: true})
  ```

* 百度地图`API`功能十分复杂,其他功能详见官方文档

##### vue中query传值和params传值的区别

* 首先呢 , 这两者的作用都是在我们使用`this.$router.push( )`时顺便传参

  * `this.$router.push( )`传值既可以是字符串,也可以是对象

  ```jsx
  // 字符串
  this.$router.push('/home/first')
  // 对象
  this.$router.push({ path: '/home/first' })
  // 命名的路由
  this.$router.push({ name: 'home', params: { userId: wise }})
  ```

* `params`只能用`name`(路由名称)来引入路由，`query`用`path`(路径)来引入
* `params`类似于`post`，`query`更加类似于我们`ajax`中`get`传参
  
* 说的再简单一点，前者在浏览器地址栏中不显示参数，后者显示，所以`params`传值相对安全一些。
  
* `params`传值一刷新就没了，`query`传值刷新还存在

##### 普通函数和箭头函数

* 首先分析箭头函数

  * 相比于普通函数更加简洁

    * 省略`function()`关键词,用`()=>`代替
    * 如果有且只有一个参数,小括号可以不写
    * 如果函数体只有一行代码,大括号可以不写
    * 如果这一行代码还是`return`出来的 , 省略`return`

  * 箭头函数没有自己的`this`指向

    * 箭头函数中的`this`和其上下文对象指向一致
      * 也可以说箭头函数`this`内外指向一致
    * 因为没有自己的`this`指向,所以即便使用`call apply bind`等也无法修改

  * 箭头函数没有`arguments`类数组对象

    * 以往为了函数重用 , 有时候我们不确定函数到底要定义多少个形参

      * 于是形参那里直接不写
      * 然后在函数体内通过`arguments`类数组对象来获取咱们的传入所有参数

    * 但是箭头函数不能这样

    * 可以使用展开运算符`...arg`来代替

      ```jsx
      var fn=(...arg)=>{
      	console.log(arg)  //[1,2,3]
      }
      fn(1,2,3)
      ```

      * `arg`会把咱们传进去的所有参数,装进一个数组里,方便操作

  * 箭头函数不能作为构造函数

    * 因为没有自己的`this`指向
      * 实例化对象`new`其实就是创建一个新对象,然后把构造函数的`this`指向这个新对象强行赋值的过程
      * 但是箭头函数没有自己的`this`
      * 因此不能

* 普通函数的`this`

  * 一般指向函数调用者,也就是点前的对象

    * `obj.fn( )`那么`this`就指向`obj`
    * 直接`fn()`,就指向`window`

  * 自执行函数`this`指向`window`

  * `return`出来的函数被执行也指向`window`

    ```jsx
    var obj={
      fn(){
        return function(){
          console.log(this)
        }
      }
    }
    obj.fn()()
    ```

    * 以这个为例
    * `obj.fn()`这个函数被执行得到的结果是`function(){console.log(this)}`
    * 因此`obj.fn()()`,其实就相当于`function(){console.log(this)}()`
      * 类似于自调用函数
      * 所以指向`window`

  * 如果这个函数是通过`DOM`元素触发事件而执行的,`this`指向那个`DOM`元素

  * 定时器里的`this`默认指向`window`

  * 可以使用`call apply bind`等修改`this`

    * `call apply`是修改本次`this`并且立刻调用函数
    * `bind`是永久替换`this`,但是暂不调用函数

  * 可以在函数外声明一个`that=this`来保存函数外的`this`指向

##### vue和React区别

* Vue 使用的是template+JavaScript+CSS的组合模式呈现
* React 的特色在于函数式编程
  * `jsx`写法编组件
  * `vue`的`v-if v-for`等在`react`中使用`js代码`配合`jsx`也可以轻易实现
* vue自带数据绑定,MVVM涉及模式
  * 强掉数据的可变性
* react需要手写数据绑定逻辑
* 本质都是用`js`操作组件

##### 单页面应用 vs 多页面应用

|              | 单页面应用                                                   | 多页面应用                                   |
| ------------ | ------------------------------------------------------------ | -------------------------------------------- |
| 组成         | 只有唯一完整的`html`文件<br />每个所谓的`页面`,其实都是组件<br />切换`页面`其实就是<br />拿走之前的组件,换成其他组件 | 每个`页面`都是真实而完整的`html`文件         |
| 公共资源     | 资源公用<br />实质上只在唯一完整的`html`中引用一次           | 每个`页面`都需要加载一次,页面间不共用        |
| url模式      | abc.com/#/index                                              | abc.com/index.html                           |
| 用户体验     | 页面间切换快,用户体验良好<br />虽然首屏加载速度较慢,<br />但是可以使用路由懒加载等方式进行优化 | 页面切换加载缓慢，流畅度不够，用户体验比较差 |
| 动画         | 因为都在一个页面里,所以可以实现                              | 实现不能                                     |
| 数据传递     | 组件传值<br />vuex<br />cookie session localStroage<br />url | cookie , session, localStroage<br />url      |
| 搜索引擎优化 | 需要单独方案、实现较为困难、不利于SEO检索 可利用服务器端渲染(SSR)优化 | 简单                                         |
| 适用范围     | 高要求的体验度、追求界面流畅的应用                           | 适用于追求高度支持搜索引擎的应用             |

##### Vue组件之间传值

* 父传给子

  * 方法

    * 在父组件上给所引用的子组件定义一个 **自定义属性**
    * 把想要传的值绑在这个自定义属性上
    * 在子组件中的`props`中,加入这个自定义属性名
    * 此时父组件穿件来的变量就会称为子组件的自有变量
    * 和使用`data`里面的数据一样访问这个变量

    ```jsx
    //在父组件里
    <template>
      <child :自定义属性名='msg'></child>
    </template>
    
    <script>
    export default{
     data(){
       return {
         msg:'123'
       }
     }    
    }
    </script>
    ```

    ```jsx
    //在子组件里
    <template>
      <div>{{自定义属性名}}</div>
    </template>
    
    <script>
    export default{
     props:{
       //props也可以写成数组,把每个属性名当成字符串写进来就好
       //但是如果写成数组了,就不能写类型了
       自定义属性名:String //类型也可以写其他
     }   
    }
    </script>
    ```

    * 注意
      * 如果传的值是 **原始类型** 的话,按值传递 , 子组件里无论对其进行怎样的操作都不会影响到父组件
      * 但是如果传的是 **引用类型** 的话,传过来的是地址 
        * 因此无论父组件还是子组件的这个值变了
        * 都会牵连对方
    * 原理
      * `vue`在每次加载一个组件时,都会扫描组件元素标签上是否存在自定义属性
        * 也就是非原生`HTML`属性
        * 也不是`vue`自己十几个属性
      * 如果发现确实有 , 就回去对自己的`props`对象或者数组进行遍历
        * 找是否有和这个自定义属性同名的内容
      * 如果有,就让其称为子组件的自有属性
      * 并且把父组件里这个自定义属性对应的数据赋值过来

* 子传给父

  * 通过给子组件绑定事件的方式

  * 事件触发时, 通过 使用`this.$emit('父组件方法名',传递的参数)`给父组件传值

    * 当父组件相应的方法调用时 
    * 会通过形参获取子组件传过来的参数

    ```jsx
    //子组件里
    <template>
    	<div>
        <button @click='setData'>向父组件传参</button>
      </div>
    </template>
    
    <script>
    export default{
     data(){
       return{
         msg:2
       }
     },
     methods:{
       setData(){
         //这样的话,当父组件的toFather方法调时,就能获取到子组件的msg参数
         this.$emit('toFather',this.msg)
       }
     }
    }
    </script>
    ```

    ```jsx
    //父组件里
    <script>
    export default{
     data(){
       return{
         sonMsg:''
       }
     },
     created(){
       toFather(data){
         //当父组件的相应方法调用时,就会通过形参获取到子组件里传来的数据
         console.log(data)
         this.sonMsg=data
       }
     }
    }
    </script>
    ```

* 兄弟组件之间

  * 如何

    * 借助中央事件总线 , 两组件外部建立一个`Bus.js`文件,将自己`export`

      ```jsx
      import Vue from 'Vue'
      export default new Vue
      ```

      

    * 两兄弟组件被同一父组件引用着

    * 给`组件1` 绑定事件

    * 通过`Bus.$emit`传递过去一个方法名和参数

      ```jsx
      //组件1
      <template>
      	<button @click='sendMsg'></button>
      </template>
      
      <script>
      export default{
      	methods:{
          sendMsg(){
            Bus.$emit('send',2)
          }
        }    
      }
      </script>
      ```

    * 在兄弟组件那里使用`Bus.$on`来进行接收

      ```jsx
      //组件2
      <script>
      export default{
      	created(){
          Bus.$On('send',function(val){
            console.log('从兄弟组件那里拿来的参数是'+val)
          })
        }
      }
      </script>
      ```

      

##### Vue路由懒加载

* 什么是

  * 懒加载就是只去加载用户可能访问的到的 **资源**
    * 提高的页面加载速度
    * 节省用户流量

* 为什么

  * Vue
    * 单页面应用 , 所有的 **页面** 都不过是一个 **组件**
    * `webpack`进行打包时,会把咱们所有的`vue`组件,打包成巨大的`js`文件
    * 导致首屏加载很慢
      * 但是很多时候,这种行为是没有必要的
      * 因为很多页面,用户可能根本不会去访问,因此根本就没有加载的必要

* 如何

  * 方法一

    * 在引用路由时,先不要进行`import`进行引入

    * 然后在相对应 **路由字典** 里的`component`里用`require`代替`import`

      ```jsx
      // import HelloWorld from '@/components/HelloWorld'  这步就不写了
      routes: [
              {
                path: '/',
                name: 'HelloWorld',
                component: resolve => require(['@/components/HelloWorld'], resolve)
              }
      ]
      ```

  * 方法二

    - 其实和上面的原理类似

    - 不要先`import`

      ```jsx
      // import HelloWorld from '@/components/HelloWorld'  这步就不写了
      routes: [
              {
                path: '/',
                name: 'HelloWorld',
                component: () => import('@/components/HelloWorld.vue')
              }
      ]
      ```

  * `ChunkName`注释法( `Vue`和`Webpack`官方推荐 )

    * 这种方法 , 同样先不要进行`import`

    * 先在`webpack.base.config.js`中配置 `ChunkFileName`

      ```jsx
      output: {
      path: config.build.assetsRoot,
      filename: '[name].js',
      chunkFilename: '[name].js',
      publicPath: process.env.NODE_ENV === 'production'
        ? config.build.assetsPublicPath
        : config.dev.assetsPublicPath
      },
      ```

    * 然后在需要进行懒加载的路由字典里这么写

      ```jsx
      {
        path: '/home/user',
        name: 'user',
        component: () =&gt; import(/* webpackChunkName:"user"*/ '../view/User.vue')
      }
      ```

##### Vue keepAlive

* 是什么

  * 用于缓存之前加载的组件

* 作用

  * 组件切换时 让其保持之前的加载状态
  * 避免反复渲染影响性能
  * 同时减少请求次数,缓解服务器压力

* 如何 ?

  * 在需要 `keepAlive` 进行缓存的 路由字典里进行配置

    * 为其添加`mata`属性( 不可改名 )
    * 在`meta`中给`keepAlive`配置为`true`

    ```jsx
    {
      path:'/index',
      name:'index',
      component:Index,
      meta:{
        keepAlive:true
      }
    }
    ```

  * 在`app.vue中`的`templa`里

    ```jsx
    <keep-alive>
    	<router-view v-if='$route.meta.keepAlive'/>
    </keep-alive>
    <router-view v-if='!$route.meta.keepAlive'/>	
    ```

    * 包在`keep-alive`标签里的内容是使用缓存的
      * `v-if`会进行判断,如果这个路由的`keepAlive`是`true`的话就使用缓存
    * 不然的话,就使用不带缓存的普通`router-view`

##### 路由守卫

* 是什么

  * 我们之前每个`vue`组件都有四组生命周期**钩子函数**,分别在组件`创建`,`挂载`,`更新`以及`销毁`的时候触发
  * 路由守卫其实是关于路由的一组**钩子函数**
  * 实现在 **进入 / 离开** 一个路由时,进行的操作

* 有什么作用

  * 有时候 , 我们需要对用户的跳转行为进行一些限制
    * 比如说
      * 我们希望用户只能在登录状态下才能 跳转到购物车
      * 通过直接输入`url`或者其他手段想要进入商品购物车页的,就应该给予拦截,阻止页面进行跳转

  * 有些时候 , `keepAlive`是不能写死的,要根据用户的实际操作而动态变化
    * 比如说 , 在一个商城项目里
      * 我们每次从首页跳转到商品列表页的时候
      * 假如我第一次是通过`手机`关键子进入的商品列表页
      * 但是以后访问的可能不是`手机`了,那就没必要对商品列表页的内容进行缓存
    * 但是,如果是从详情页跳转到商品页就不同了
      * 因为我们之所以进入了详情页
      * 肯定是之前已经在商品页选好了商品
      * 这时候我们进行再进行后退 , 就应该回退到之前选的 那类商品那里

* 如何使用( 组件路由守卫 )

  * 就一个组件而言,使用最多的路由钩子函数是`beforeRouteLeave` 和`beforeRouteEnter`

  * 路由守卫钩子函数有三个参数

    * to
      * 表示你要去哪
    * from
      * 表示你从哪里来
    * next
      * `next()`
        * 直接往下执行,不进行干预
        * 如果不阻止或者修改之前的路由跳转行为,这个`next( )`必须写
      * `next(false)`
        * 中断当前导航
      * `next('/')`/`next( { path : '/' } )`
        * 跳转到其他地址

  * 比如实现刚才的需求

    ```jsx
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

    * 当路由即将离开首页时触发
    * 判定我们是否要去商品页
    * 确实是要去商品页
    * 经过我们刚才的分析,不应该缓存
    * 于是把`to`(即我们要去的商品页)的`keepAlive`改为`fasle`,让它不再进行缓存

* 如何使用( 全局路由守卫 )

  * 实际上,完整的路由守卫钩子函数是这样的

    | 导航被触发                                                   |
    | ------------------------------------------------------------ |
    | 在`失活`的组件里调用离开守卫`beforeRouteLeave`               |
    | 调用全局的`beforeEach`守卫                                   |
    | 在重用的组件里调用`beforeRouteUpdate守卫(2.2+)`              |
    | 在路由配置里调用`beforeEnter`                                |
    | 解析异步路由组件                                             |
    | 在被激活的组件里调用`beforeRouterEnter`                      |
    | 调用全局的`beforeResolve守卫(2.5+)`                          |
    | 导航被确认                                                   |
    | 调用全局的`afterEach`钩子                                    |
    | 触发`DOM`更新                                                |
    | 用创建好的实例调用`beforeRouteEnter`守卫中传给`next`的回调函数 |

  * 根据这个流程,我们可以发现,每次我们进行路由跳转的时候,全局的**路由钩子函数**都会被触发

  * 全局的路由钩子函数也有两个比较重要

    

  * 假如一个需求,用户从任何界面跳往购物车时候,都会进行验证

    * 查看用户是否登录
    * 如果用户没有登录
    * 就阻止用户跳转 ,并自动将路由切换到登录页面

    ```jsx
    router.beforeEach((to, from, next) => {
      console.log(to)
      if(to.name=='cart'){
        //如果vuex中没有保存用户登录的数据,证明用户没有登录
        this.$store.state.uid?next():next({path:'/login'})
      }
    }
    ```

##### webpack 4.X 打包机制基本

* 是什么

  * 前端资源 **加载/打包** 工具
  * 静态分析`js`之间存在怎么样的关系
  * 最终合并成生产环境需要的代码

* 前提

  * 全局安装

    * `webpack4`需要`NodeJS V9`以上
    * `npm i webpack webpack-cli -g`

  * 局部安装

    ```jsx
    npm i webpack webpack-cli -S
    ```

    

* 基本使用

  * 生成`package.json`

    ```jsx
    npm init
    ```

  * 打包

    - 默认入口文件 `src / index.js`
    - 默认出口文件`dist / main.js`

    ```jsx
    //默认情况下是生产环境 也就是一行代码 可读性极差的的模式
    webpack 输入文件.js -o 输出文件.js
    ```

    ```jsx
    webpack --mode development 输入文件.js -o 输出文件.js
    ```

  - 如果只写`webpack`或者`webpack --mode development` 

    - 会将入口文件以及其依赖的文件
    - 打包到`dist`文件夹下

    

* 配置

  * 为什么

    - `webpack`本身是打包`js`文件的
    - 如果想要打包其他文件,必须进行相关配置

  * 如何

    - 在当前目录下新建一个`webpack.config.js`

    - `npm init`

    - 先在`webpack.config.js`中配置**入口和出口**文件

      ```jsx
      const path=require('path')
      module.exports={
        //入口
      	entry:'./src/index.js'  //入口文件可以自行修改,
        //出口
        output:{
        //最后会打包成dist文件夹的一个build.js
         path:path.resolve(_dirname,'dist'),
         filename:'build.js'
      	}
      }
      ```

  * loader

    - 能让`webpack`打包其他非`js`文件

  * plugins

    - 有效地打包或者压缩文件

* dev-server ( 本地服务 )

  * 安装

    ```jsx
    npm i webpack-dev-server -S
    ```

  * 配置

    ```jsx
    //webpack.config.js中
    const path=require('path')
    module.exports={
      //入口
    	entry:'./src/index.js'  //入口文件可以自行修改,
      //出口
      output:{
      //最后会打包成dist文件夹的一个build.js
       path:path.resolve(_dirname,'dist'),
       filename:'build.js'
    	},
      devServe:{
        contentBase:'./src', //配置路径
        port:'8080',  //配置端口号
        inline:true //实时刷新
      }
    }
    ```

    ```jsx
    //package.json中scripts里
    "dev":"webpack-dev-serve --open --inline"
    ```

* loader ( 加载程序 )

  * 不同文件的`loader`

    | 扩展名                    | 语义                                                | loader举例                                                   |
    | ------------------------- | --------------------------------------------------- | ------------------------------------------------------------ |
    | .js                       | returns module exports                              | babel-loader                                                 |
    | .ts                       | returns module exports                              | ts-loader                                                    |
    | .coffee                   | returns module exports                              | coffee-loader coffee-redux-loader                            |
    | .jsx                      | returns module exports (react component)            | jsx-loader react-hot-loader!jsx-loader                       |
    | .json .json5              | returns json value                                  | json-loader json5-loader                                     |
    | .txt                      | return string value                                 | raw-loader                                                   |
    | .css                      | returns nothing, side effect of adding style to DOM | style-loader!css-loader style-loader!css-loader!autoprefixer-loader |
    | .less                     | returns nothing, side effect of adding style to DOM | style-loader!css-loader!less-loader                          |
    | .scss                     | returns nothing, side effect of adding style to DOM | style-loader!css-loader!scss-loader                          |
    | .styl                     | returns nothing, side effect of adding style to DOM | style-loader!css-loader!stylus-loader                        |
    | .png .jpg .jpeg .gif .svg | returns url to image                                | file-loader url-loader                                       |
    | .woff .ttf                | returns url to font                                 | file-loader url-loader                                       |
    | .wav .mp3                 | returns url to audio                                | file-loader url-loader                                       |
    | .mpeg .mp4 .webm .ogv     | returns url to video                                | file-loader                                                  |
    | .html                     | returns HTML as string                              | html-loader                                                  |
    | .md .markdown             | returns HTML as string                              | html-loader!markdown-loader                                  |
    | .jade                     | returns template function                           | jade-loader                                                  |
    | .hbs .handlebars          | returns template function                           | handlebars-loader                                            |

  * 以`css`为例

    * 需要先

      ```jsx
      npm install style-loader css-loader -S
      ```

    * 如何配置

      ```jsx
      //在 webpack.config.js中配置
      module:{
        rules:[
          {
            test:/\.css$/,  //以.css结尾
            use:['css-loader','style-loader']
          },
          {
            test:/\.(jpg|jpeg|gif|png)$/,  //以.css结尾
            use:['file.loader']
          }
        ]
      }
      ```

      * 假如引用了`background-image`还需要配置图片`loader`,过程同`css`一样

* plugins

  * `html-webpack-plugin`插件

  * 使用

    * 安装

      ```jsx
      npm i html-webpack-plugin -S
      ```

    * 配置

      ```jsx
      //webpack.config.js
      const HtmlWebpackPlugin=require('html-webpack-plugin')
      
      ...
      module.exports={
        ...
        plugins:[
          //会自动去找
          new HtmlWebpackPlugin({
            template:'./src/index.html',
            //默认是html , 也可以自动为其命名
            fileName:'a.html',
            minify:{
              removeAttributeQuotes:true,//去除引号
              removeComments:true, //去除注释
              removeEmptyAttributes:true,//去除空属性
              collaspseWhitesapace:true//去除空格回车
            }
          })
        ]
      }
      ```

##### Vuex

- 回顾 : 组件间数据共享

  - 父=>子
    - 自定义属性
  - 子=>父
    - $emit
  - 兄弟间
    - EventBus

- Vuex是什么

  - `Vuex` 是一个实现组件全局状态(`数据`)管理的一种机制,可以方便的管理组件之间数据的共享

  - 它采用`集中式存储`管理应用的所有组件的状态，并以相应的规则保证状态以一种可预测的方式发生变化

  - 关系复杂之间的组件传参,可能会很麻烦

    - 比如两个组件不是同属一个父组件的情况,数据想要实现共享,需要传来传去,很麻烦!

    - 但是如果使用`Vuex`就比较容易实现,`Vuex`适合这种**大范围 复杂或者比较频繁的数据共享**

    - 如下图

      ![1584491434588](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1584491434588.png)

- 使用`Vuex`的优点

  - 共享**数据集中**管理,易于开发和维护
  - 高效地实现组件之间的数据共享,**提高开发效率**
  - 存储在`Vuex`里的数据是**响应式的**,能够实时保持**数据和页面的同步**

- 什么数据适合存储在`Vuex`中

  - 组件中共享的数据,一般才有必要存在`vuex`中,对于组件的私有数据,依旧存在组件的自身的`data`里即可

- 安装和配置

  - 安装`vuex依赖包`

  ```cmd
  npm install vuex --save
  ```

  - 创建`store.js`
    - 引入`vuex`
    - 创建`vuex实例`,并且**暴露**出去

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

  - 在`main.js`中
    - 引入刚才的`store.js`
    - 挂载在`new Vue()`上

  ```javascript
  import store from './store'
  new Vue({
    store  //把store挂载上来
    ...
  }).$mount('#app')
  ```

  

- 核心概念

  - State

    - 提供**唯一的公共数据源**,所有的共享数据都要统一放在`store`中的`State`中存储

    - 比如,在`store.js`里保存一个全局数据`count`

      ```javascript
      export default new Vue.store({
        state : { count:0 }
      })
      ```

    - 在组件里访问这个数据的第一种方式

      ```javascript
      this.$store.state.count        //js中
      ```

      - 如果是在`<template></template>`标签中使用插值表达式时,this可以省略

      ```html
      <template>
        <div>
          <p>{{$store.state.count}}</p>
        </div>
      </template>            <!--template标签里-->
      ```

    - 在组件里访问这个数据的第二种方式

      - 在`vuex`中导入`mapState`函数

        ```javascript
        import {mapState} from 'vuex'
        ```

      - 把刚才导入的`mapState`函数,将当前组件需要的全局数据,映射为当前组件的`computed`计算属性,之后就可以像使用普通`computed`属性一样使用这个全局属性

        ```javascript
        computed:{
          ...mapState(['数据1','数据2','数据3'])   //注意要使用'...'展开运算符,因为mapState匹配的是一个数组
        }
        ```

    - 在组件里修改这个全局数据

      ```javascript
      this.$store.state.count=1        //js中
      ```

      - 这么写确实让全局的`count`数据得到了修改,但是禁止这么写

  - 要通过`Mutation`进行进行`Store`中的数据变更

  - Mutation

    - 禁止直接修改`Store`中的数据

      - 直接修改的方式**无法监控**数据的变化,极**不利于后期维护**

    - 只能通过`mutation`修改`Store`中的数据

    - 因为通过这种方式的操作**虽然稍微繁琐一些**,但是**便于集中监控**所有的数据变化

    - **Mutation**使用的第一种方式

      - 在`Store.js`定义`Mutation`函数

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

        - 定义需写在`new Vue.store()`里面

      - 在`mutations`对象里存放着修改`state`中数据的方法

        - 每个方法都有一个`state`(形参)
        - 要修改哪个属性,就在方法内对`state.属性名`进行相应的操作

      - 如何在组件内通过`Mutation`修改数据

        - 通过`this.$store.commit('方法名')`

      - `commit('xxx')`的作用就是调用`Mutation`中的`xxx`方法

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

      - 如何在调用`Mutation`时传参

        - 直接把想要其他形参写在`state`后面即可

      - 但是`state`必须是第一个,这些形参不能写在它前面

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

    - **Mutation**使用的第二种方式

      - 通过`mapMutation`函数

        - 从`vuex`中引入该函数

          ```javascript
          import {mapMutation} from 'vuex'
          ```

        - 通过刚才的函数,将需要的`Mutation`函数,映射为当前组件的`methods`方法

          ```javascript
          export default{
            methods:{
              ...mapMutation(['calc'])  //使用...展开运算符,把数组里的所有方法都映射进来
            
          }
          ```

    - 在`Mutation`函数里不能直接执行`异步`操作

    - 想要在`Vuex`中执行异步操作,要通过`Action`处理异步任务

  - Action

    - 何时

      - 如果需要通过异步操作变更数据,必须通过`Action`,不能通过`Mutation`
      - 原理是在`Action`的方法里**异步地**触发`Mutation`方法,但是也不能执行修改

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

    - 如何带参传入

      - 和上面`Mutation`类似,把形参写在后面

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

      - `this.$store.dispatch('calcAnyc',形参)  `会先把形参传给`Action`中的方法,`Action`中的方法在异步调用`Mutation`中的方法时,会把自己接收到的形参再传过去

    - 触发Action的另一种方式

      - 从`Vuex`中导入`mapActions`函数

        ```javascript
        import {mapActions} from 'vuex'
        ```

      - 将指定的`action`函数,映射为当前组件的`methods`方法

        ```javascript
        methods:{
          ...mapActions(['calcAnyc'])
        }
        ```

      - 像使用`methods`里的方法一样使用`action`函数,传参也一样

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

  - Getter

    - 什么是
      - 会对`Store`里的数据进行加工生成新的数据,类似`vue`的计算属性
    - `Store`中的数据发生变化,`Getter`里的数据也会变化

- 不会修改`Store`里的原数据
      

  - 如何

  - 如何定义

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

    - 如何使用

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

      - 第二种方法

      - 引入`mapGetters`

        ```jsx
        import { mapGetters } from 'vuex'
        ```

      - 使用展开运算符放在`computed`属性里,当做普通`computed`属性来用

        ```JavaScript
        computed:{
          ...mapGetters(['getNum'])
        }
        ```

##### v-if和v-show区别

* 相同
  * 都是控制元素显示和隐藏
  * 都是通过一个布尔判断的返回值空值

* v-show
  * 控制的原理是`display:none`
  * 控制单个元素显示或者隐藏
  * 适合那种根据条件变化可以不断切换`显示 / 隐藏`状态的元素
* v-if
  * 控制的原理是删除布尔判定值为`false`的元素
  * 除此之外,可以配合`v-else`,`v-else-if`使用
    * 可以控制元素多选一显示
    * 假如`v-if`条件不满足,那就进而判定`v-else-if`,都不满足就会显示`v-else`,并且把不满足的元素节点删去
  * 适合那种组件渲染之初就已经决定显示或者隐藏的情况 ,不会再反复横跳, 这种元素一旦 `显示 / 隐藏` 了基本就不再变化

##### computed  vs watch

* computed

  * 只要某个变量是根据其他变量计算而得到的,就应该写在`computed`里面
  * 访问和使用时,和访问普通`data(){ }`里面的数据方法一样
  * `computed`里的内容不实际被存储
  * 因为其内容是根据其他数据计算而得到的
    * 因此其他相关的数据发生改变时
    * `computed`里的内容也会改变
  * 比如

  ```jsx
  export default{
    data(){
      return{
        num1:2,
        num2:3
      }
    },
    computed:{
      num3(){
        this.num1*this.num2
      }
    }
  }
  ```

  ```jsx
  <div>{{num3}}</div>
  
  //如果num1或者num2发生了改变  ,那么 num3 也就发生了变化
  ```

* watch

  * 监控一个属性
  * 只要这个属性发生了变化,就会立即调动`watch`里面的同名方法
  * 比如

  ```jsx
  
  export default{
    data(){
      return{
        num:2
       
      }
    },
    watch:{
      num(){
        console.log('num发生了变化')
      }
    }
  }
  ```

* 区别

  * `watch`监控的是一个已经存在的属性,每当这个属性发生了改变,就调用相应的方法
  * `computed`是根据其他属性,计算得到另一个属性,这个属性是动态计算而成,并不会实际存储

##### beforeMount 和 created 的区别

* 相同点
  * 两者能做的事情基本一样
    * 都可以发送请求
    * 操作`data`
    * 或者是调用`methods`中的一些方法
    * 但是因为此时页面并没有渲染完成,并不能对页面数据绑定的内容进行`DOM`操作
* 不同点
  * `created`阶段中中的`el`并没有得到初始化
    * `el`就是`new Vue`对象监控的容器
  * `beforeMount`阶段中,`el`已经得到了初始化
    * 但是因为页面渲染还没有完成
    * 页面上还是`{{ }}`占位符

##### vue生命周期函数

| 阶段          | 特点                                                         | 能干啥                                                       |
| ------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| beforeCreate  | data中的数据没有得到初始化<br />el也没有的到初始化<br />     | 不能访问数据,也不能调用方法<br />不能DOM操作                 |
| created       | data里面的数据得到了初始化<br />el没有得到初始化<br />页面没有渲染完成 | 操作数据,手动调用方法<br />发送请求<br />但是不能DOM操作     |
| beforeMount   | data里面的数据得到初始化<br />el已经得到了初始化<br />但是页面还是用`{{ }}`插值表达式占位 | 操作数据,手动调用方法,<br />发送请求<br />此时依旧不能进行操作 |
| Mounted       | data,el得到了初始化,<br />页面也渲染完成                     | 操作数据,手动调动方法,<br />发送请求,DOM操作                 |
| beforeUpdate  | `view`层的数据发生了改变,会触发这个声明周期函数<br />如果仅仅是`data`层的数据发生了变化并不会触发这个钩子函数<br />在此完成数据被改变之前最后进行的操作 |                                                              |
| updated       | `view`层的数据发生了改变,会触发这个声明周期函数<br />如果仅仅是`data`层的数据发生了变化并不会触发这个钩子函数<br /> |                                                              |
| beforeDestroy | 销毁前执行                                                   | 清除定时器,解绑数据 方法等                                   |
| destoryed     | DOM元素依旧存在,只是不再会受到`new Vue`的监控                |                                                              |

##### 介绍原型链

* 原型链其实就是控制访问对象属性和方法的一种链式关系逻辑

  * 当我们访问一个对象的成员时
    * 会优先去这个对象的自有成员中查找这个方法
    * 如果没有,就会去其`__proto__`原型上面找
    * 还没有,就去原型的原型`obj.__proto__.__proto__`上面找
    * 直到找到顶层都没有
    * 才返回`undefined`

* 提到原型就不得不提到构造函数

  * 构造函数其实就是一种创建其类型 实例对象 的模板函数
  * 上面储存着描述这类对象特征的 属性 
  * 虽然构造函数上面也可以存储方法
  * 但是如果在构造函数上存储方法
    * 这个构造函数每次被实例化一次,都重新创建这个方法一次
    * 浪费性能
    * 况且 **代码重用** 本身就是函数设定的初衷 , 这一行为有违这个初衷
  * 于是,我们使用原型对象来保存一类对象 **共有** 的方法

* 还不得不提到面向对象的多态特征

  * 我们知道在`js`中,万物皆对象

  * 最顶层的基类叫做`Object` , 任何其他的 类 其实都是`Object`的子类

    * 比如`String , Number , Array ,Date ...`等等

  * 有时候 , 我们想用一个方法 , 但是从父类那里继承得来的方法并非那么好用 , 不能完全满足我们的需要

  * 我们可以利用 原型链 的成员访问优先级 原理重写这个方法

    * 把同名方法重写为自有方法,或者是保存在原型上的方法,让它不再从更高的父级那里继承而来
      *  有自有方法,就绝对不会去原型上找
      * 原型上有,就绝对不会再沿着原型链再往上找
      * 总之...
      * 就近原则

  * 也正是因此,同样是一个`toString( )`方法,在不同情况下的结果不一样 , 就是因为在设计时 , 针对不同的情况,做了不同的重写,而不是一味的继承

    ```jsx
    对象.toString()   //[Object object]
    数组.toString()   //把数组打散,并且扁平化为一段字符
    数字.toString()   //字符数字
    ...
    ```

##### setTimeout 和 setInterval

* 相同
  * 都是定时器
  * 定时器里的`this`一般指向`window`
  * 定时器里面的回调函数是异步执行的	    

* 不同

  * `setTimeout` 定时器里的函数 ,  只执行一次
  * 而`setInterval`里的函数 , 会每隔一个时间周期就执行一次

* 引出同步和异步的概念

  * 同步操作 

    * 前面的操作没有执行完毕 , 后续代码就不能执行

  * 异步操作

    * 在 编译 `js`代码时候,会把异步进行放在事件队列里

    * 等主进程的同步任务执行完了,就会去执行异步任务

    * 异步操作是无序的

      * 比如我们发送两条`ajax`请求
      * 先写的那句`ajax`未必能比后写的先得到返回结果

    * 使得很多操作失控

    * 如何解决

      * 旧方法 

        * 回调嵌套

      * 新方法

        * `Promise then` / `Promise (async function(){ await... })`

        * 比如

          ```jsx
          //es6
          var total=0
          var add=function(num){
            return new Promise(function(resolve,reject){
              setTimeout(function(){
                resolve(num)
              },200)
            })
          }
          add(2).then(res=>{
            total+=res;
            return add(3)
          }).then(res=>{
            total+=res;
            return add(4)
          }).then(res=>{
            total+=res;
            console.log(total)
          })
          //因为几个操作可以是并行的无必然的顺序,还可以使用Promise.all进行进一步简化
          Promise.all([
            add(2),add(3),add(4)
          ]).then(res=>{
           total=res.reduce((prev,next)=>prev+next)
          })
          ```

          ```jsx
          //es7
          
          var total=0
          var add=function(num){
            return new Promise(function(resolve,reject){
              setTimeout(function(){
                resolve(num)
              },200)
            })
          }
          (async function(){
            var res=await Promise.all([add(2),add(3),add(4)])
            total=res.reduce((prev,next)=>prev+next)
            console.log(total)
          })()
          ```

          

##### 原生获取屏幕亮度

* `Luminosity API`用于屏幕亮度调节，当移动设备的亮度传感器感知外部亮度发生显著变化时，会触发`devicelight`事件。

* 目前，只有Firefox部署了这个API。

  ```jsx
  window.addEventListener('devicelight', function(event) {
    console.log(event.value + 'lux');
  });
  ```

##### 前端性能优化

* 优化发送`ajax`请求

  * 使用 **节流** 或 **防抖** 等技术
    *  节流
      * 在一段时间内 , 只能发送一次请求,稀释事件的触发频率
    *  防抖
      * 在一段时间里 , 多次触发会阻止事件触发

* 优化静态资源

  * 小图或者icon 采用`精灵图 + 定位` 的方式实现加载

  * 懒加载
    * 给`图片 / 视频 `等`src`设置为空
    * 将路径写在一个自定义属性里
    * 每次页面加载或者`onscrll`(也就是滚动时候) 都会进行判断
    * 根据 用户设备 **一屏的高度** 和 **图片出现距屏幕上边沿的** 距离 判断图片是否已经进入用户视野
    * 进入用户视野的图片,再把自定义事件里的路径赋值给`src`

* 使用`webpack`打包工具,把众多`css js` 文件进行打包 ,缩小项目体积

* `js`文件引用放在`css`后

  * 浏览器会根据`css`和`html`代码生成`Render Tree`来渲染页面
  * 但是遇到`<script></script>`就会阻塞页面渲染

* 别用`table`布局

  * 否则很小的`DOM`操作,就可能导致页面的重排重绘

* 使用事件委托

  * 如果一系列平级的`DOM`元素都可以触发事件
  * 不要给他们每个都绑定事件
  * 而是给它们的 **父级元素** 绑定事件
    * 到时候根据事件对象判断 触发事件的元素是哪一个
    * 再执行相应操作

* 优化`DOM`操作

  * 比如有些时候,我们进行一系列增加页面元素的`DOM`操作
  * 如果每次让他们一个一个执行
  * 每次新增一个`DOM`元素,页面就会重排重绘一次
  * 可以把这些新增的元素统一写在一个 **数组**里
  * 增加完成后, 打散这个数组, 一次性渲染到页面上

* 组件化开发中

  * 组件模块化 按需引入

    - 比如我们只想用`MintUI`的提示框功能

    - 就不要整个引入`MintUI`

    - 而是按需引入

      ```jsx
      //举个例子
      import { toast } from './MintUI'
      ```

  * 组件开发中,组件也使用懒加载进行优化

* 递归比较消耗性能 , 如果一个功能可以使用循环完成,就不要使用递归

##### 前端安全优化

* 使用`post`发送请求
* 输入合法性验证
  * 判定用户输入的内容是否符合预期的格式
* 对服务器端输出到浏览器的数据进行编码或转义
  * 相应的`JavaScript`的编码方式可以使用`JavascriptEncode`
* `Web`应用程序在设置`cookie`时，将其属性设为`HttpOnly`
  * 涉及到重要信息的数据,不要保存在`cookie`里
* 适当使用**验证码**
* 使用拦截器验证权限

##### 主流布局方式

* 流式布局

  * 特点
    * 给定义一个高度
    * 宽度采用百分比的方式
    * 但是因为还是有给定的高度和文字大小
      * 导致在一些比较极端的设备下,显示效果不尽人意

* 瀑布流式布局

  * 特点

    * 不定高

    * 内容多的容器就高度就大 , 否则就小

    * 因此就形成了参差不齐,类似瀑布状的结构

      ![1585789986822](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1585789986822.png)

    * 实现方式

      ```css
      .container{
      	width: 1200px;
      	margin:20px auto;
      	columns: 4;
      	column-gap:40px;
      	height: 100%;
      }
      .container>.box{
      	width:100%;
      	margin:0 0 20px;
      	padding: 10px;
      	background-color: #fff;
      	break-inside:avoid;
      }
      ```

* 响应式布局

  * 特性

    * 根据设备的不同,给予不同的样式和 布局 方式

  * 如何实现

    * 可以手写媒体查询

      ```css
      @media (max-width: 1200px){
      		.container{
      		columns: 3;
      		width:calc(100%-40px);
      		box-sizing: border-box;
      		padding: 10px;}
      }
      @media (max-width: 768px){
      		.container{
      		columns: 2;
      		}
      }
      @media (max-width: 448px){
      		.container{
      		columns: 1;
      		}
      }
      ```

    * 或者使用`bootStrap`等已经写好了媒体查询的样式库

      ```jsx
      <div class='col-md-4 col-lg-3'></div>
      ```

##### 事件循环和事件队列(event loop)

* `JavaScript`是**单线程**的
  * 前一个任务完成 , 才会去执行后一个任务
  * 如果前一个任务很耗时 , 那么后一个任务就不能得到执行
* 为了解决这个问题 , 在`js`出现了**同步操作**和**异步操作**
  * 同步操作
    * 在主线程( `stack` )上顺次执行的操作,只有前一项任务执行完毕了,后一项任务才会去执行
  * 异步操作
    * 不进入主线程
    * 进入 **任务队列** 中等待
    * 只有 **任务队列** 通知主线程 这个任务可以执行了
      * 这个任务才会去进入主线程执行

![img](https://upload-images.jianshu.io/upload_images/9418222-3ee70117afb9a5d1.png?imageMogr2/auto-orient/strip|imageView2/2/w/1148/format/webp)

* 结合这张图,我们总体梳理一下流程

  * 所有的 同步任务 都在**主线程** 执行 , 形成一个执行栈
    * 同步任务 入栈
    * 同步任务 得到执行
    * 同步任务 出栈
  * 在 **主线程** 之外 , 还有一个 **任务队列** (`task queue`)
    * 只要 **异步任务** 有了执行结果 ,先不入栈
    * 在 **任务队列** 中 放置一个事件 
  * 当 **主线程** 中所有的同步任务执行完了
    * 就会去读取 **任务队列**
    * 查看 刚才注册的 **事件**
    * 那些 **事件** 对应的 **异步任务** 结束等待状态 , **入栈** 执行
  * 主线程会不断地 重复上述 **三步操作**
    * 主线程从 **任务队列** 中读取事件,这个过程是不断循环的
    * 因此整个运行机制称为 **事件循环** (`event loop`)

* 关于 **宏任务** 和 **微任务**

  * 宏任务

    * 每次在 **栈**  中执行的任务
    * 每次会把 **任务代码** 从头到尾执行完毕
    * 期间不会去执行其他任务
    * 包括`script,setTimeout,setInterval` 

  * 微任务

    * 当前 任务 执行完毕后 **立刻执行** 的函数
    * 包括`promise中的then(),process.nextTick `

  * 执行过程

    * 执行 整体代码( **宏任务** )后，开始第一次循环
    * 接着执行所有的 **微任务**
    * 然后再次从**宏任务**开始，找到其中一个任务队列执行完毕
    * 再执行所有的**微任务**
    * ...
    * 循环往复

    ![img](https://user-gold-cdn.xitu.io/2017/11/21/15fdcea13361a1ec?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

* 以一道例题来分析说明

  ```jsx
  
  setTimeout(function(){
  	console.log('1')
  });
   
  new Promise(function(resolve){
  	console.log('2');
    resolve();
  }).then(function(){
  	console.log('3')
  });
   
  console.log('4')
  
  ```

  * 分析这段代码
    * 我们这段代码整体是个 **宏任务**
      * 把这个任务 **从头到尾** 执行完毕
        * 到了`setTimeout(function(){console.log('1')})`时,发现是异步任务,暂不入栈,放到任务队列里等待
        * 到了`new Promise`,同步任务,立刻执行 ,打印`2`
          * `promise`是为了解决异步任务无序调用而生的,其本身是**同步**的
        * 到了`then( )`加入 **微任务** 队列 ,等待本次宏任务执行完毕后 立刻执行
        * 到了`console.log(4)` ,同步任务,立刻执行
    * 第一次 **宏任务** 执行完毕
    * 会去执行所有的**微任务**
      *  因此执行刚才的微任务`then()`任务,打印`3`
    * 微任务执行完毕后,刚才任务队里的定时器 **入栈**
    * 执行,结果是打印`1`

* 分析一道更难的题

  ```jsx
  console.log(1);
  
  setTimeout(() => {
    console.log(2);
    Promise.resolve().then(() => {
      console.log(3)
    });
  });
  
  new Promise((resolve, reject) => {
    console.log(4)
    resolve(5)
  }).then((data) => {
    console.log(data);
  })
  
  setTimeout(() => {
    console.log(6);
  })
  
  console.log(7);
  ```

  * 分析这段代码
    * 代码整体是 **宏任务**
      * **从头到尾**执行完毕
        * 到了`console.log(1)`,同步任务,立刻执行 ,打印`1`
        * 到了`setTimeout()`这里 , 异步任务先加入任务队列里等待执行
        * 到了`promise`这里 ,同步任务,立刻执行,打印`4`
        * 到了`then( )`这里,将`then`加入微任务队列,等待本次宏任务执行完了,会立刻执行
        * 到了`setTimeout()`这里,继续加入任务队里,等待
        * 到了`console.log(7)`,直接打印`7`
    * 本次**宏任务**结束了,会立刻执行所有**微任务**
    * 所以会执行刚才的`then`,打印`promise`传来的`5`
    * 之后 **事件队列** 里的宏任务依次 **入栈**
    * 先是之前第一个定时器里的函数
      * `console.log(2)`,会立刻打印`2`
      * 然后会将`then(console.log(3))`加入**微任务** 中,等待本次宏任务结束了,立刻执行
      * 本次宏任务至此完毕
    * 立刻执行所有 **微任务** ,打印`3`
    * 队列里下一个宏任务入栈执行 ,也就是我们第二个定时器,打印`6`

  

  

##### 解决跨域问题

* 同源策略
  * 浏览器 **最核心**,**最基本**的安全功能
  * 所谓的同源
    * 协议
    * 域名
    * 端口
    * 三者必须相同 ,否则就是跨域
  * 同源策略限制以下行为
    * `ajax`发送
    * `Cookie`,`localStroage`,`IndexDB`读取不能
    * `DOM`和`js`对象无法发送

* 跨域的方式

  * 跨域资源共享( **CORS** )

    * 目前的主流方式

    * 假如不带`cookie`,前端不需要管

    * 后端 ( `Node.JS`写法,其他语法各有各的写法 )

      ```jsx
      var http = require('http');
      var server = http.createServer();
      var qs = require('querystring');
      
      server.on('request', function(req, res) {
          var postData = '';
      
          // 数据块接收中
          req.addListener('data', function(chunk) {
              postData += chunk;
          });
      
          // 数据接收完毕
          req.addListener('end', function() {
              postData = qs.parse(postData);
      
              // 跨域后台设置
              res.writeHead(200, {
                  'Access-Control-Allow-Credentials': 'true',     // 后端允许发送Cookie
                  'Access-Control-Allow-Origin': 'http://www.domain1.com',    // 允许访问的域（协议+域名+端口）
                  /* 
                   * 此处设置的cookie还是domain2的而非domain1，因为后端也不能跨域写cookie(nginx反向代理可以实现)，
                   * 但只要domain2中写入一次cookie认证，后面的跨域接口都能从domain2中获取cookie，从而实现所有的接口都能跨域访问
                   */
                  'Set-Cookie': 'l=a123456;Path=/;Domain=www.domain2.com;HttpOnly'  // HttpOnly的作用是让js无法读取cookie
              });
      
              res.write(JSON.stringify(postData));
              res.end();
          });
      });
      
      server.listen('8080');
      console.log('Server is running at port 8080...');
      ```

    * 假如需要带`cookie`,前端也需要设置一下

      ```jsx
      //原生ajax 发请求时加上
      xhr.withCredentials = true;
      
      //jq ajax
      $.ajax({
          ...
         xhrFields: {
             withCredentials: true    // 前端设置是否带cookie
         },
         crossDomain: true,   // 会让请求头中包含跨域的额外信息，但不会含cookie
          ...
      });
        
      //axios
      axios.defaults.withCredentials = true
      ```

      

  * jsonp 方式

    * 特点 

      * **前后端** 均需配置
      * 只能用于`get`请求

    * 原理

      * 把`js`,`css`,`img`等 **静态资源** 分离到一台 独立域名的 服务器上
      * 在`html`页面中再通过相应的标签从不同域名下加载静态资源 , 而被浏览器允许
      * 因此可以通过动态创建`script`，再请求一个带参网址实现跨域通信

    * 如何

      * 前端

        ```jsx
        //原生
         var script = document.createElement('script');
            script.type = 'text/javascript';
        
            // 传参一个回调函数名给后端，方便后端返回时执行这个在前端定义的回调函数
            script.src = 'http://www.domain2.com:8080/login?user=admin&callback=handleCallback';
            document.head.appendChild(script);
        
            // 回调执行函数
            function handleCallback(res) {
                alert(JSON.stringify(res));
            }
        
        //jq
        $.ajax({
            url: 'http://www.domain2.com:8080/login',
            type: 'get',
            dataType: 'jsonp',  // 请求方式为jsonp
            jsonpCallback: "handleCallback",    // 自定义回调函数名
            data: {}
        });
        
        //vue
        this.$http.jsonp('http://www.domain2.com:8080/login', {
            params: {},
            jsonp: 'handleCallback'
        }).then((res) => {
            console.log(res); 
        })
        ```

      * 后端 ( `Node.JS` )

        ```jsx
        var querystring = require('querystring');
        var http = require('http');
        var server = http.createServer();
        
        server.on('request', function(req, res) {
            var params = qs.parse(req.url.split('?')[1]);
            var fn = params.callback;
        
            // jsonp返回设置
            res.writeHead(200, { 'Content-Type': 'text/javascript' });
            res.write(fn + '(' + JSON.stringify(params) + ')');
        
            res.end();
        });
        
        server.listen('8080');
        console.log('Server is running at port 8080...');
        ```

##### call、apply和bind

* call 和 apply

  * 相同点

    * 都是可以临时改变函数`this`指向 
      * 也就是说只在使用`apply / call`的这次调用时更改
    * 同时可以传入参数
    * 都会立刻调用函数

  * 不同点

    * `call`传入是一个一个独立的
    * `apply`以数组的方式进行传入

  * 性能

    * 当传入的参数个数较少时,两者性能相差无几
    * 当传入的参数个数较多时,`call`的性能更好些

  * `call`如何传数组

    ```jsx
    let arr=[2,3,4,5]
    function fn(){
      console.log(this)
      console.log(arguments)
    }
    fn.call(arr,...arr)
    ```

    * 使用展开运算符传参,会把数组打散,并且把每一项单独传入

* bind

  * 和`apply / call`的共同点
    * 都是可以更改函数的`this`指向
    * 也可以传参
  * 不同点
    * `bind`其实可以理解成是一个函数的预处理机制 
    * 也就是说在函数调用前 , 就把函数里的`this`,以及参数问题处理好
      * 永久替换`this`指向
      * 使用`bind`不会调用函数
  * 何时使用
    * 需要更改`this`但是不能调用函数的情况
    * 需用永久替换`this`的情况

##### localStorage 和 cookie

* cookie

  * `cookie`的特性
    - 存储在浏览器中,方便用户和程序员操作
    - 但是也因为存在客户端中,导致容易被恶意截取,夺取用户信息 ,不安全
    - 大小有限制
      - `cookie`文本的大小一般为`4kb`
      - 每个站点只能容纳`20`个`cookie`

  * 添加

    ```jsx
    //把cookie保存 封装为一个函数
    function setCookie (name, value) {
    if(!name||!value)return
    var days = 1; //定义一天
    var exp = new Date();
    exp.setTime(exp.getTime() + days * 24 * 60 * 60 * 1000);
    // 写入Cookie, toGMTString将时间转换成字符串
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString;
    };
    
    //每次获取时,直接调用这个函数
    setCookie('uname','tom')
    
    ```

  * 获取

    ```jsx
    //把cookie读取 封装为一个函数
    function getCookie (name) {
    var arr,reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)"); //匹配字段
    if (arr = document.cookie.match(reg)) {
    return unescape(arr[2]);
    } else {
    return null;
    }
    }
    //每次读取时,直接调用这个函数
    getCookie('uname')
    ```

* localStroage

  * 特性

    * 储存和读取的方法比`cookie`还要简单
    * 永久存储,只要不手动去删,就不会丢失
    * 大小限制为`5M`,这对信息数据来说,是相当大的空间了,但是也更加消耗性能
    * 属于`HTML5`的新特性 , `IE8`以下不能用
    * 如果浏览器处于 **隐私模式** 时,不能获取 , 同时也不会被 **爬虫** 抓取到

  * 使用

    * 增 , 改

      ```jsx
      //在写入时要 标注键名和键值
      localStorage.setItem('键名',键值)
      ```

    * 查

      ```jsx
      console.log(localStorage.getItem('键名'))
      ```

    * 删

      ```jsx
      localStorage.removeItem("键名");
      ```

* session

  * 特性
    * 保存在服务器里
    * 安全性相对高一些
    * 常用于保存 **用户名** 等信息
    * 保存的信息是跨页面全局性的
    * 能够存储任何类型,包括自定义对象,每个客户端的`session`都是独立存储的
    * 当会话结束时, 服务器就会清除`session`

##### js执行和页面渲染是否可以同时运行

* 浏览器渲染页面的过程
  * 根据`HTML`结构生成`DOM树`
  * 根据`CSS`生成`CSS对象模型`
  * 把两者结合生成`Render Tree`
  * 浏览器会根据`RenderTree`进行绘制
  * 但是遇到`<script></script>`时
    * 执行里面内容
    * 阻塞页面渲染
* 可对前端性能进行优化
  * 详见 ***前端性能优化*** 篇

##### 重排重绘

* reflow ( 重排 )

  * 是什么

    * 浏览器为了重新渲染部分或整个页面
    * 重新计算页面元素位置和几何结构的进程叫做`reflow`.

  * 有何影响

    * `reflow`是导致`DOM`脚本执行效率低的关键因素之一
    * 页面上任何一个节点触发了`reflow`会导致它的子节点及祖先节点重新渲染。

    | 何时触发重排                             |
    | ---------------------------------------- |
    | 改变窗口大小                             |
    | 改变文字大小                             |
    | 添加/删除样式表                          |
    | 内容的改变，(用户在输入框中写入内容也会) |
    | 激活伪类，如:hover                       |
    | 操作class属性                            |
    | 脚本操作DOM                              |
    | 计算offsetWidth和offsetHeight            |
    | 设置style属性                            |

  * 如何优化

    * 如果是添加多个`DOM`节点 , 不要一条一条的添加
      * 把他们装进一个数组里 , 将数组打散一次性添加进去 , 这样页面就只重排一次
    * 如果一个`DOM`节点的样式可能会变化很多 , 也不要使用`style`属性一个一个地修改
      * 事先定义好一个样式`class` , 使用时直接切换`className`
    * 不要把`DOM`元素的属性放在循环里作为循环变量
    * 不要使用`table`布局 
      * 很小的改动 , 可能就会导致重排
      * 而且也难看呀
    * 如果一个`DOM`元素确实需要很复杂的操作
      * 可以先把它`display:none`
      * 修改完毕后
      * 再显示到页面上

* repaints ( 重绘 )

  * 是什么

    * 元素的`background-color`,`opacity`,`color`等属性发生变化了
    * 不会影响其在页面的位置和页面的结构
    * 浏览器只会用新的样式来绘制这个元素
    * 这个过程叫做`repaints`

    | 常见的重绘元素  |                  |                     |                   |
    | --------------- | ---------------- | ------------------- | ----------------- |
    | color           | border-style     | visibility          | background        |
    | text-decoration | background-image | background-position | background-repeat |
    | outline-color   | outline          | outline-style       | border-radius     |
    | outline-width   | box-shadow       | background-size     |                   |

##### 盒子模型

* W3C盒子模型

  ![https://img4.sycdn.imooc.com/5b73f51e00015f7907740523.jpg](https://img4.sycdn.imooc.com/5b73f51e00015f7907740523.jpg)

  * 如何计算
    * 根据` W3C`的规范，元素内容占据的空间是由 `width` 属性设置的
    * 而内容周围的 `padding `和 `border` 值是另外计算的；
    * 即在标准模式下的盒模型
      * 盒子实际内容（content）的width/height以内容为标准
        * 等于我们设置的width/height
      * 盒子总宽度/高度=width/height+padding+border+margin

* IE盒子模型

  ![https://img1.sycdn.imooc.com/5b73f53f0001a7ec07610507.jpg](https://img1.sycdn.imooc.com/5b73f53f0001a7ec07610507.jpg)

  * 如何计算
    * 在该模式下，浏览器的` width` 属性不是内容的宽度，而是内容、内边距和边框的宽度的总和
    * 我们设置的`width`(height也是如此)以边框为标准
      * 等于盒子的内容宽度/高度+内边距padding+边框border宽度/高度
    * 盒子总宽度/高度=width/height + margin = 内容区宽度/高度 + padding + border + margin

* 如何相互转换

  ```jsx
  box-sizing:border-box/content-box
  ```

  

##### GIT基础速查

* 什么是
  * 一个版本控制工具
  * 一个面向开源以及私有的项目托管平台
* 前提
  * 安装
    - git 官方软件
    - 一路下一步
  * 启动
    - git bash 
      - 支持`linux`命令的控制台 , 一般我们使用这个
    - git CMD
      - 支持`windows`命令的控制台
    - git gui
      - `git`的可视化界面
  * 可在`vs code `安装`git`插件
  * 需要在`git`官网注册一个账号
  * 需要一个密钥,不然不能从暂存区提交到`gitHub`仓库
    * 如果想从暂存区提交内容到`git`仓库,需要`git`授权的`shh`密钥
      - 输入`ssh-keygen -t rsa -C "你git的邮箱地址"`
    * 去如下目录结构里找密匙 
      - 我的电脑 
        - 用户 / `user`
          - 用户名文件夹
            -  `.ssh`(隐藏文件夹)
              -  `xxx.pub` (存有密钥)
    * 用编译器打开密匙文件,复制
    * 在`gitHub`网站里的`setting`中
    * 选择`SSH and GPG keys`新增一个密匙

* 具体操作

  * 创建一个文件夹

  * 通过`cd`或者其他方式进入当前文件夹

  * 配置`git`的基础信息 ( 前提是你得有账号[手动滑稽~] )

    ```cmd
    git config --global user.name "你的用户名"
    ```

    ```cmd
    git config --global user.email "你的邮箱"
    ```

    * 一般来说 , 会没有消息提示
      * 在`git`中,没有消息就是好消息

  * 将工作区的内容先存在暂存区

    * 暂存区?
      * 一个虚拟的仓库
    * 如何创建暂存区
      * 进入要操作的文件夹
      * `git init`初始化当前操作
      * 会发现当前文件夹下多了一个`.git`文件夹
        * 这个文件夹存储的就是当前项目文件夹下所有的版本信息
    * 如何从工作区到暂存区
      * 首先`git add`
        * `git add 文件名`是只提交一个文件
        * `git add *`是提交当前目录下所有文件
      * 然后再`git commit -m "对这一次提交的描述"`
    * 其他操作
      * 查看当前工作区的状态
        - `git status`
        - 如果确实成功提交的话,会提示`nothing to commit `
      * 如何将工作区的文件恢复至暂存区保存的状态
        - `git checkout`
      * 每次发生变化时,如何判断是工作区的哪个文件相对于暂存区被修改了
        - `git diff`
        - 会告诉你具体改变了什么
      * 查看每次我们提交的历史版本
        * `git log`
        * 恢复到某个具体版本
          * `git reset --hard HEAD^`回退一个版本
          * `git reset --hard HEAD^^`回退两个版本
          * `git reset --hard 版本号`回退到某一具体版本
            * 版本号可在`git log`里面去查
      * 清屏操作
        - `clear`
      * 从远程仓库克隆项目到本地
        * `git clone 仓库地址`
      * 从远程仓库更新项目到本地
        * `git pull`

  * 再把暂存区的内容存放在`gitHub`远程仓库

    * 创建远程仓库
      * 在`git`官网,右上角有一个加号`+`
      * 点击加号`+`后选择 `create a new repository`
        * 输入远程仓库的名称
        * `description` (描述)
        * `public / private` (公开/私有)
          * 鼓励开源
          * 希望私有的话 , 要收费
    * 进入刚才创建的远程仓库,**拷贝** `git`给出的当前仓库的地址
    * 输入`git remote add origin 刚才复制的仓库地址`
    * 输入`git push -u origin master`进行提交
      * 在提交过程中可能要求输入用户名和密码
    * 提交成功
    * 刷新远程仓库,发现已经提交成功
    * 如果当前提交文件夹下有一个`readme.md`自述文件的话,还会被当成`html`片段显示在当前仓库中予以说明