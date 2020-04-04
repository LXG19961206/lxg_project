#### 面向对象

##### 前瞻

* 和面向过程区别

  * 面向过程语言
    * `性能`比面向对象更高，适合跟硬件联系紧密的内容
    * 没有面向对象一样易于维护，易于复用，易于拓展
  * 面向对象语言
    * 易于`维护`，易于`复用`，易于`扩展`
    * 可以设计出低耦合的系统，更加`灵活`
    * 但是性能会低些

* 特点

  * `封装`
  * `继承`
  * `多态`

  * 在面向对象程序开发思想中，每一个`对象都是功能中心`，具有`明确分工`
  * 面向对象编程具有`灵活性`，代码可重用，易于维护，便于分工协作

##### 类和对象

* 面向对象更加贴近我们的实际生活,可以使用面向对象来描述显示世界事物
* 面向对象的思维特点:
  * 抽取对象的共有属性和行为封装成一个类(模板)
  * 对类进行实例化,获取类的对象
* 何为对象
  * 万物皆对象,对象是一个具体的事物
  * 在`js`中,对象是一组无序的相关属性和方法的集合,所有的事物都是对象
    * 字符串
    * 数值
    * 函数
    * 数组
    * ...
  * 对象是由属性和方法组成的
    * 属性 : 事物的`特征`
    * 方法 : 事物的`行为` 

* 类
  * 在`ES6`新增了类的概念,可以使用`class`关键词声明一个类,之后**以这个类来实例化对象**
  * **类**抽取了对象的**公共部分**,它泛指某一大类
  * 对象特指某一个,**通过类实例化**一个具体的对象



##### 类的使用

* 创建一个类

  ```javascript
  class Subject{
     //class body
  }
  ```

* 创建类的实例

  ```JavaScript
  var Chinese=new Subject()
  var Math=new Subject()
  ```

* 类的构造函数

  * `constructor`方法是类的构造函数方法,用于**传递参数,返回实例对象**

  * 如果没有显示定义,类内部会自动给我们创建一个`constructor()`函数

  * `new`做了哪些事情 ?

    * 创建一个新的**空空对象**

    * 调用`constructor`,并将`constructor`中的`this`**指向**为这个空的对象

    * 设置实例的`__proto__`为构造函数的`prototype`

      * 在`class`中,保存在**构造函数**`prototype`中的方法,直接打散写在`class`里

    * 将这个**新对象**的**地址**保存

    * 比如
    
      ```jsx
      class Good{
         constructor(pname,pid,price){
           this.pname=pname
           this.pid=pid
           this.price=price
           var intr=()=>{
             console.log('我是'+pname)
           }
         }
      }
      
      var phone=new Good('vivo',1,2000)
      
      console.log(phone)
    //Good {pname: "vivo", pid: 1, price: 2000}
      ```

      * `new`创建一个了空对象
    
        ```jsx
        {
          //新的空对象
      }
        ```

        

      * 在这个执行过程中,`new`会自动触发`class`中的**构造函数**,并且传参`('vivo',1,2000)`

      * 会将这个**构造函数**中的`this`指向为这个新的对象
    
        ```jsx
        //其实就相当于
        constructor(pname,pid,price){
             新对象.pname = 'vivo'
             新对象.pid = 1
             新对象.price = 2000
             var intr=()=>{
               console.log('我是'+'vivo')
      }
        ```

        * 因为此时的新对象还是空的,而**构造函数**中的`this`已经指向了它

        * 相当于是给这个空对象**强行赋值**
    
          ```jsx
          {
            //js中给不存在的属性或者变量赋值,不会报错,而是先强行创建,然后强行赋值
            pname: "vivo",
            pid: 1, 
            price: 2000
        }
          ```

        * 但是构造函数中`intr`这个方法并没得到实例化,因为并没有一个`this`把它指向**新的空对象**

        * 如果想要把它也实例化,需要通过`this`,不然它并不会称为**新对象中的方法**

        * 不过一般来说,我们不会在**构造函数**中去写方法,而是直接在`class`中添加
    
          ```jsx
          this.intr=()=>{
             console.log('我是'+pname)
        }
          ```

      * 于此同时,会把**新对象**的`__proto__`设置为**构造函数**`prototype`

      * 实例化完成了,会把这个**实例对象**的**地址**保存在内存中
    
      * 最后把地址交给等号左边的`phone`来保存

* 类中添加方法

  * 直接把方法写在`class`中,即可

  * **类中和对象中**的方法,无需加`function`关键字

    ```jsx
    class Good{
       constructor(pname,pid,price){
         this.pname=pname
         this.pid=pid
         this.price=price
       }
      intr(){
        //因为这个方法最终也被实例化进入phone对象,想要访问同一对象里面的属性,前面要加this
           console.log('我是'+this.pname)  
      }
    }
    var phone=new Good('vivo',1,2000)
    phone.intr()  // '我是vivo'
    ```

* 类的继承

  * 创建`子类 extends 父类`

  * 之后就可以调用父类里面的方法

    ```jsx
    class Good{
       constructor(pname,pid,price){
         this.pname=pname
         this.pid=pid
         this.price=price
       }
      intr(){
        //因为这个方法最终也被实例化进入phone对象,想要访问同一对象里面的属性,前面要加this
           console.log('我是'+this.pname)  
      }
    }
    class Son extends Good{
      constructor(pname,pid,price){
        super(pname)
      }
    }
    var son=new Son('黑莓')
    son.intr() //'我是黑莓'
    console.log(son)
    ```

  * 但是**父类**方法中使用的参数前的`this`指向的始终是是**父类的实例对象**

  * 那么子类如何在调用父类方法的时候还能传自己的值呢

  * 这时候就要使用`super`

  * 这样一来,可在调用**父类**方法时候,使用**子类**的参数

  * `super`相当于在**子类**中调用**父类**的构造函数,我们来分析一下这个过程

    * 首先我们创建一个子类`Son`

    * `Son`中继承了父类里的`intr`方法

    * `Son`中也有一个构造函数,形参和父类一样

    * 我们`new`了一个实例对象,并且传了一个参数`黑莓`

    * 实例化完成后,实例对象`son`

      ```jsx
      Son {pname: "黑莓", pid: undefined, price: undefined}
      ```

    * `super`在这过程中干了什么?

      * `super`会调用父类构造函数,在本例中

      ```jsx
      class Son extends Good{
        constructor(pname,pid,price){
          super(pname)  
        }
      }
      ```

      ```jsx
      class Son extends Good{
        constructor(pname,pid,price){
          //会在子类中,调用父类构造函数,并且把pname传进去,就相当于
          父类构造('黑莓')  
        }
      }
      ```

      * 相当于

      ```jsx
      class Son extends Good{
        constructor(pname,pid,price){
           this.pname='黑莓'        
           this.pid=undefined
           this.price=undefined
        }
      }
      //然后子类就被实例化完成
      Son {pname: "黑莓", pid: undefined, price: undefined}
      ```

      * 因此,我们在调用继承自父类方法的时候,才会打印**我是黑莓**

      ```jsx
      intr(){
            console.log('我是'+this.pname)  
      }
      ```

* super调用父类中的普通函数

  * 使用`super.父类函数`来调用父类的普通函数

    ```jsx
    class Father{
     say(prop){
      return '父类的'+prop
     }
    }
    
    class Son extends Father{
     say(){
      console.log(super.say('子类'))
     }
    }
    (new Son).say()
    // 父类的子类
    ```

* super必须写在子类`this`之前

  ```jsx
  class Father{
   constructor(num1,num2){
     this.num1=num1
     this.num2=num2
   }
   calc(){
    console.log(this.num1+this.num2)
   }
  }
  
  class Son extends Father{
   constructor(num1,num2){
     super(num1,num2)
     this.num1=num1
     this.num2=num2
   }
   add(){
    console.log(this.num1+this.num2)
   }
  }
  (new Son(2,3)).calc()
  // 父类的子类
  ```

  * 子类里调用父类的`calc`方法,必须得使用`super`把子类的参数传进去才行

  * 但是还要注意,`super`要写在子类**构造函数**的`this`前

    ```jsx
    Must call super constructor in derived class before accessing 'this' or returning from derived constructor
    //存在继承类的时候,需要先使用super()对父类构造进行初始化,super应该写在this之前
    ```

* 类和对象的注意点

  * 类没有变量提升,所以必须**先定义类**,然后通过类实例化对象
  * 类里面的共有属性和方法,一定要加`this`使用
  * 注意`this`指向问题



##### 构造函数

* `ES6`之前,`js`中没有**类**这一概念,当时类的功能就是通过**构造函数和原型**来实现的

* 构造函数

  * 构造函数简而言之就是 **把一类对象公共部分抽取出来的形成的一个模板**

  * 写法实际上就是把`class`里的`constructor`单拿出来成为一个函数

    ```jsx
    function User(uname,age){
      this.uname=uname
      this.age=age
    }
    var tom=new User('tom',20)
    console.log(tom)  //User{uname:'tom',age:20}
    ```

    * 创建构造函数的实例时,前面要加`new`
      * 如果不加
        * 不仅不会创建出实例
        * 因为`new`会把构造函数里面的`this`指向其实例对象,不加`new`,`this`默认指向`window`
        * 因此**构造函数**会被当成普通函数来执行,并且给全局`window`强行赋值一些属性
    * 构造函数名习惯上首字母大写

* 实例成员

  * 实例成员就是构造函数内部通过`this`添加的成员

    ```jsx
    function User(uname,age){
      this.uname=uname    //只能通过实例化的对象tom.uname进行访问,无法直接通过User访问
      this.age=age				//只能通过实例化的对象tom.age进行访问,无法直接通过User访问
    }
    var tom=new User('tom',20)
    ```

  * 在使用`new`生成实例时候,实例成员会变成实例对象的方法或者属性

  * 只能通过**实例后的对象**才能访问,不能通过**构造函数**访问

* 静态成员

  * 直接在**构造函数**上添加的内容

    ```jsx
    function User(uname,age){
      this.uname=uname    //只能通过实例化的对象tom.uname进行访问,无法直接通过User访问
    }
    var tom=new User('tom',20)
    User.age=20			//不能通过实例对象tom.sex进行访问,因为没有this将其实例化
    console.log(User.age)
    ```

    

  * 只能在**构造函数**本身里才能访问,不能在其**其实例对象**里访问

  * 原理很简单,当我们`new`出一个实例的时候

    * 会把**构造函数**里的`this`指向我们的新**实例对象**
    * 相当于是给`新对象.属性名`强行赋值
    * 但是如果没有`this`,就不会执行这个操作
    * 所以它只能是构造函数里面的一个静态成员  

  * 同理

    ```jsx
    function User(uname,age){
      this.uname=uname    //只能通过实例化的对象tom.uname进行访问,无法直接通过User访问
      age=20			//不能通过实例对象tom.sex进行访问,因为没有this将其实例化
    }
    var tom=new User('tom',20)
    
    console.log(tom) //User{uname:'tom'}
    ```

    * 即使在函数内部,但是没有`this`

    * 也是不会强行赋值,导致该该属性不会被实例化,在实例对象里也是无法访问的

    * 实际上这个`age`只是被当成了**普通函数作用域里**的一个**普通变量**

      * 如果这个函数里还没有形参`age`,这个`age=20`甚至会暴露到全局,强行赋值

      



##### prototype

* 确实，我们可以把函数放在`construcotr`里面

  * 但是，这样一来，会造成浪费内存的问题
    * 因为我们每实例化一次，都会开辟出一块内存来保存同一个方法
    * 开辟多块内存空间来保存同一个函数，是很没有必要的
    * 基于此，我们引入`prototype`的概念

* 每个**构造函数**，都会有一个`prototype`，指向构造函数的原型对象

* 我们可以在`prototype`上面定义方法,这样所有的**对象实例**就可以**共享**这些方法

  * 这样一来,**构造函数**每个**实例对象**都可以共享这个方法
  * 无需再单独开辟新的**内存**来保存这个方法

  ```jsx
  function User(uname,age){
    this.uname=uname    
    age=20			
  }
  User.prototype.intr=function(name){
    console.log('my name is'+name)
  }
  var tom=new User('tom',20)
  tom.inro('tom')  //my name is tom
  ```

##### prototype和`__proto__`

* 任何实例对象上都会有一个`__proto__`,指向其构造函数的`prototype`,这两者等价

  ```jsx
  实例对象.__proto__==其构造函数.prototype        //true
  ```

  ![1584860216696](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1584860216696.png)

* 如果我们修改了某构造函数的**原型对象**,且给**原型对象**赋值的是一个对象,则必须手动利用`constructor`指回原构造函数

  * 假如我们只是修改了`prototype`上的某个方法,比如`xxx.prototype.sum=function(){...}`,这种情况就无需指回
  * 但是如果把整个`prototype`赋了 新值,覆盖了导致原`prototype`,这个时候就得手动指回了

* **自有属性**和**共有属性**

  * 自有属性就是直接保存在**对象本地**的属性

  * 共有属相就是保存在其原型对象上,诸多子对象**共有**的属性

  * 如何判断,是否是自有属性

    ```jsx
    var bool=obj.hasOwnProperty('属性名')
    ```

    

  

##### 原型链

* 由**多级父对象**逐级继承形成的链式结构

* 如图

  ![1584861065286](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1584861065286.png)

  

* 原型链作用

  * 保存了

    * 一个对象可用的所有属性

  * 控制了

    * 对象成员的查找机制

      * 先找自有的,有自由的就优先使用

      * 自有没有,沿着**原型链**向上**逐级**找

      * 如果知道最顶层依旧没有找到,返回`undefined`

      * 比如

        ```jsx
        function User(uname){
          this.uname=uname
        }
        User.prototype.sayhi=function(){
          console.log('hello')
        }
        var tom=new User('tom')
        tom.toString()  //[Object object]
        
        //我们创建了User的一个实例tom
        //调用tom的toString()方法
        //先会判定tom是否存在自有方法toString()
        //因为没有去,去其原型__proto__里找
        //还是没有,继续沿着原型链向上找
        //找到tom.__proto__.__proto__(其实就是Object.prototype方法了)
        //返回[Object object]
        ```

* 原型对象里的`this`指向

  * 和**构造函数**一样,**原型对象**里面的`this`,指向的是其**实例对象**

    ```jsx
    function User(uname){
      this.uname=uname
    }
    User.prototype.sayhi=function(){
      console.log(this.uname)
    }
    var tom=new User('tom')
    tom.saihi()
    ```

* 简单的扩展内置对象

  * 给数组添加求和功能

    ```jsx
    Array.prototype.sum=function(){
      let sum=0
      for(let i=0;i<this.length;i++){
        sum+=this[i]
      }
      return sum
    }
    console.log([1,2,3,4].sum())
    ```

##### call

* 可用于修改函数的`this`指向,并且调用这个函数

  ```jsx
  var name='lily'
  var obj={
    name:'tom'
  }
  function sayhi(){
    console.log(this.name)
  }
  sayhi() //lily
  sayhi.call(obj) //tom
  ```

* 在`ES6`前,没有`extends`和`super`,我们可以使用`call`实现继承属性

  ```jsx
  function Father(num1,num2){
     this.num1=num1
     this.num2=num2
  }
  
  
  function Son(num1,num2,num3){
     Father.call(this,num1,num2)
     this.num3=num3
  }
  
  
  var son=new Son(2,4)
  console.log(son)
  ```



##### 使用ES6前的组合继承继承方法

```jsx
function Father(num1,num2){
   this.num1=num1
   this.num2=num2
}
Father.prototype.sum=function(){
  console.log(this.num1+this.num2)
}

function Son(num1,num2,num3){
   Father.call(this,num1,num2)
   this.num3=num3
}

Son.prototype=new Father()
Son.prototype.constructor=Son
var son=new Son(2,4)

son.sum()
```

- 我们知道`js`对象是通过在内存中的**地址**来进行保存的

- 如果我们采用`Son.prototype=Father.prototype`这种操作,确实可以达到效果

  - 但是,因为保存的是地址
  - 因此这两者有一个发生改变了,另一方也会改变

- 可以使用`new Father()`的方式进行组合继承

- `new Father()`可以把保存在`Father`原型对象上的方法也实例化

- 此时`Son.prototype`上就有了`sum`这个方法了

- 此外,因为我们是使用对象整个赋值`Son.prototype`的,导致其`constructor`指向`new Father().constructor`

  需要手动改回来,指回原来的构造函数



##### 类的本质

- 类的本质其实还是一个**函数**

  ```jsx
  class User{
    ...
  }
  typeof User  //Function
  ```

  - 类把原本**构造函数**写在了`constructor(){}`中
  - 原本**原型对象**中的方法,直接打散写在`class`中
  - **类的实例**的`__proto__`,指向了**类**的`prototype`

##### 多态

* **同一方法**在不同情况下,表现出不同的样式

* 比如

  ```jsx
  对象.toString()             //[Object object]
  数组.toString()             //会把数组降维且打散为字符串
  数字.toString()             //数字字符
  bool.toString()            //字符串true或者false
  date.toString()            //日期字符串
  ```

* 如果子对象觉得父对象的成员不好用,可在本地定义同名自有成员,来覆盖父对象中的成员



#### ES6

##### 箭头函数

* 特点

  * 精简
    - 将`function(){}`,改为`()=>{}`
    - 如果只有**一个参数**,可以省略小括号,但是如果没有参数则不能省略
    - 如果函数体只有**一行代码**,可以省略大花括号,如果这行代码还是`return`出来的,省略`return`
  * 上下文`this`指向一致
    * 可以理解为箭头函数内外的`this`指向一致
    * 很多框架里,使用了箭头函数,把大部分的`this`指向移除,方便操作
  * 箭头函数的`this`指向用`call`,`apply`,`bind`也不能修改
  * 箭头函数,没有自己的`arguments`,但是可以通过`...arr`展开运算符传入不确定个数的值
  * 可以为箭头函数命名,但是箭头函数本身更适合做**那些原本需要匿名**的地方
  * 箭头函数不能用作**构造函数**

* 比如

  ```jsx
  function fn(name){
      return `my name is ${name}`
  }
  //将其改写为更简单的箭头函数
  ```

  ```jsx
  let fn=name=>`my name is ${name}`
  fn('tom')
  ```



##### 模板字符串

* 特点
  * 一串字符串里,混用字符串和变量拼接,省去之前`+`拼接的麻烦
* 如何
  * 使用` `` `反引号
  * 普通字符串直接写
  * 变量需要套在`${}`中
* `${}`中的内容
  * 可以是变量
  * 一些`api`的调用
  * 三目运算符
  * 执行计算
* 但是不能放`if`,`esle`,`for,while,do-while`等等



##### Let关键词

* 用于代替`var`的块级作用域变量声明词
* 特点
  * 不会声明提前
  * 一次声明,不可再次声明同名变量
  * 可以只声明不赋值,且在声明后可以重新赋值
  * 会和`for`循环形成闭包
    * `for`循环内,用`var`声明的变量,即使在外部也能访问的到
    * `for`循环内,用`let`声明的变量,会把每次循环都形成一个闭包,专门用于操作本次循环的循环体

##### const关键词

* **常量**声明关键词
* 常量?
  * 保存那种一次声明后,**不会发生变动**的数据
* 特点
  * 声明不提前
  * 一次声明,不可再次声明同名常量
  * 声明时必须赋值,不然会报错,且赋值后也不能再进行修改
  * 常量名,习惯上大写

##### 数组方法

* forEach()

  * 用于遍历数组

  * 进行操作的是**原数组**

    ```jsx
    arr.forEach((item,i,arr)=>{
      //item  每个数组元素
      //i     每个数组元素的索引号
      //arr   数组本身
    })
    ```

* filter()

  * 返回满足条件的数组项为一个新数组,主要用于筛选数组

    ```jsx
    arr.filter((item,i,arr)=>value>=20)
    //返回数组里>=20的项为一个新的数组
    ```

* some()

  * 检测数组的元素是否满足条件

    ```jsx
    arr.some((item,i,arr)=>item>20)           
    ```

    * 返回值是布尔值
    * 只要有一个满足就返回`true`
    * 只要有一个满足了,就不会向后找了
    * 如果全不满足,就返回`false`

* map()

  * 对数组进行**遍历和处理**,并且把处理结果返回为一个**新数组**

    ```jsx
    arr.some((item,i,arr)=>item*=2)
    ```

* every()

  * 和`some`类似,不过`every`是判定是否所有元素都符合要求,只要有一个不符合就会返回`false`

    ```jsx
    [1,2,3].every((item,i,arr)=>item>2)     //false
    ```

    * 只要有一个不满足条件,就会返回`false`
    * 只要有一个不满足条件,就会停止执行

* flat()

  * 数组扁平化,也就是将多维数组降为一维

    ```jsx
    [1,2,[2,3,4,[2,2]]].flat(2)
    ```

    * 括号中写的是想要降维的深度
    * 返回的是一个新数组
    * 可以使用`Infinity`为参数,无论数组是多少维一直执行到变成一维为止

* 展开运算符

  * `...数组名`

    ```jsx
    //原先
    let arr=[1,2,3]
    fn.apply(null,arr)  //apply会传递一个数组
    ```

    ```jsx
    //现在
    fn.call(null,...arr)  //...arr会把arr数组打散,每一项作为参数都传进来
    ```

    * 函数重用时

      ```jsx
      function fn(...arr){
        console.log(arr)
      }
      fn(1,2,4,43,5)
      ```

      * 有时我们不确定函数传参时要传多少个
      * `ES6`前,遇到这种情况,我们不设形参,通过`arguments`来获取传来的参数,结果是一个**类数组对象**,不易操作
      * 现在可以直接使用`...arr`,会把我们传进来的参数装进一个数组里

    * 数组拼接时

      ```jsx
      let arr1=[1,2,3]
      let arr2=[4,5,6]
      
      let arr3=[...arr1,...arr2]  //[1,2,3,4,5,6]
      ```

* from()

  * 把**类数组对象**或者**可迭代的对象**转为一个新的,**浅拷贝**的数组实例

    ```jsx
    Array.from(document.querySelectorAll('div'))
    ```

    * 可把类数组对象或可迭代的对象转为数组

* 数组解构

  * 解构赋值法

    ```jsx
    let arr=[1,2,3]
    let [a,b,c]=arr
    ```

    * 会把`arr`的前三项分别赋值给`a`,`b`,`c`

  * 不声明第三个变量,交换两个变量的值

    ```jsx
    let a=1,b=2
    [a,b]=[b,a]
    ```

    * 会把`a`和`b`的直接交换

##### 对象方法

* 对象解构

  ```jsx
  let {uname,age}={uname:'tom',age:20}
  ```

  * 相当于 `let uname='tom',age=20`

  ```jsx
  //变量名和属性名不同的情况
  
  let {name:userName, age} = {name: '狗蛋', age: 18};
  console.log(userName, age);
  ```

  ```jsx
  设置默认值（如果可能解构失败可以设置默认值）
  let {name, age, sex ='女'} = {name: 'zs', age: 18, sex: '男'};
  console.log(name, age, sex);
  ```

* `import xxx` / `import {xxx}`

  *  **不带{}**, 引入的是module中`export default`的函数或变量

  * **带{}**，引入的是module中`export`的函数或变量
  
    

