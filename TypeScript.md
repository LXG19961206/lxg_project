### `TypeScript`

* 是什么

  * `TypeScript`是`JavaScript`的一个超集
  * 由`微软`开发的基于`js`的语言,带有`js`的所有特性,并且拓展出一些更有用的功能

* 如何安装

  ```cmd
  npm i -g typescript
  ```

* 最新版本

  * `typescript@3.8.3`

* 如何使用TypeScript

  - `ts`文件不能被浏览器直接执行,需要他通过`typescript`工具进行编译,转为`js`文件执行

  - `ts`需要编译后转为`js`文件才能被浏览器识别

  - 在`ts`文件所在目目录下,输入如下命令,就会自动转为`js`文件

  - ```
    tsc xxx.ts
    ```

  

* 特性

  ```typescript
  function show(word:String){
    console.log(word.toUpperCase());
  }
  show('monica hava girl friend')
  ```

  * 参数可以规定数据类型:`js`原本是弱类型语言,声明变量时候无需标明类型,`ts`语法一定程度上改善了这一点
  * 注明了类型后,编译器知道了参数值的类型,会给予相应的代码提示,对程序员很友好
  * 注明了类型,如果存放了其他类型,`ts`会自动猜测出代码中存在的错误

  ```typescript
  class Emp{
   name:String;
   nickname:String;
   ename='';
   age:Number;
   age1=20;
   show(){
     this.age1
   }
  }
  ```

  * `ts`语言,在类里面`变量名:类型`的形式,并不是赋值,只是单纯地标明该变量的类型,方便编译器提示,也方便程序员开发

    ```typescript
    Array<String>     //只能存放字符串的数组
    String            //只能存放字符串
    any               //可以存放任何类型
    Number            //只能存放Number类型的
    Object            //只能存放对象类型
    ```

  * 函数返回值的类型

    ```typescript
    getData(a):String{
     reutn a
    }
    // 返回值类型要写在小括号外,如果返回值类型不是所写的内容,会报错
    ```

  * 类中的访问控制词

    ```typescript
    public //公开的,在类内类外子类都可以访问的到,不写则默认为此权限 
    protected //保护的,只能在类内以及子类中才能访问的到
    private// 私有的,只能在类内才能访问的到
    ```

    ```typescript
    class Wife{
        protected money=5000//将money属性保护起来,类外不能访问到,只能在类内才能访问到的
        private movie='www.baidu.com'
        public getMoney(){
            return this.money
        }
    }
    let cuiHua=new Wife();
    cuiHua.money //访问失败,money收到了保护,只能在其类中以及子类中才能访问到
    cuihua.getMoney //可以访问getMoney是公开的,如果什么都不写,默认是public
    
    class son extends Wife{  //设置子类集成父类
        show(){ 
            //子类可以使用父类的保护权限,公开权限
            console.log(this.money)
            //但是不能访问父类的私有属性(设置了private的属性)
            console.log(this.movie) //不能访问,因为设置了private权限,子类和类外皆不能访问
        }
    }
    ```

  * 接口特性:所谓接口,可以认为是协议,定义一套标准,让其他人来完成这个标准

    ```typescript
    interface xxx{        //接口中的方法都是未实现的标准
      maiFang():any;
      maiChe():any;
      cunkuan();any;
    }
    
    class Yunlong implements xxx{    //  implements 就是遵循xxx接口   
        //这个时候,会判定这个类是否符合接口的条件,不符合就会抛错
    }
    
    class LXG implements xxx{
        maiFang(){}
        maiChe(){}
        cunkuan(){}
        //只有像这样,符合接口的要求,才能正确遵循,不会报错
    }
    ```

    

### `HttpClient`

* 是什么

  * `angular`原声提供的网络操作服务
  * 在`angular`中,我们使用网络操作一般用原生的`HttpClient`或者`axios`

* 最常见的网络请求分为两种

  * `get`:获取,常用于从服务器获取数据

  * 但是真正发送请求时,是<b>由服务器决定的</b>

    ```typescript
   //在总的配置文件里
    import {HttpClientModule} from '@angular/common/http';
     imports: [
        BrowserModule,
        AppRoutingModule,
        HttpClientModule
      ] 
    //然后在单个页面ts文件里
    import {HttpClient} from '@angular/common/http';
    constructor(private http:HttpClient) { }
    //或者也可以写成这样,其实就是上面的完整格式
    parivate http:HttpClient;
    constructor(http:Httpclient){
        this.http=http
    }
      ngOnInit(): void {
          //生命周期:组件启动时会自动触发这个周期
          //ctrl加左键点击此地址,可以在浏览器进行验证
          let url='http://101.96.128.94:9999/mfresh/data/news_select.php'
          //使用方法
          //subscribe订阅请求完毕的时机,请求完毕会把请求内容告知
          this.http.get(url).subscribe(res=>{
              this.data=res //把请求得来的数据赋值给data变量,方便使用
          })
      }
    
    ```
  
  * 注意网络请求是异步的:发送请求时,不会阻拦页面的渲染操作.但是在网络请求未完成之前,页面渲染时候没有数据,此时读取数据就会报错

    * 解决方案: 判断数据如果不存在,就先不要用data
  
      ```html
      <div *ngIf="data">
       <p *ngFor="let item of data.data">
        {{item.title}}
       </p>
      </div>
      ```
  
      
  
  * `post`:传递,传输,常用于向服务器发送数据
  
    ```typescript
     let postUrl='http://101.96.128.94:9999/mfresh/data/user_login.php'
     let body='unameOrPhone=sunny&upwd=123456'
     //发送post请求必须根据服务器的设定来,书写特定的请求头
     let options={
         headers:{
             //这一部分必须这么写,不然写错的话,会报跨域错误
             'content-type':'application/x-www-form-urlencoded'
         }
     }
     this.http.post(postUrl,body,option).subscribe(res=>{
         console.log(res)
     })
    ```
  
    

### `Angular生命周期`

```typescript
1、ngOnChanges // 当数据绑定输入属性的值发生变化时调用
2、ngOnInit // 在第一次 ngOnChanges 后调用
3、ngDoCheck // 自定义的方法，用于检测和处理值的改变
4、ngAfterContentInit // 在组件内容初始化之后调用
5、ngAfterContentChecked // 组件每次检查内容时调用
6、ngAfterViewInit // 组件相应的视图初始化之后调用
7、ngAfterViewChecked // 组件每次检查视图时调用
8、ngOnDestroy // 指令销毁前调用
```

### `父向子组件传参`

* 方法:和`vue`类似,利用属性进行传参

```html
<app-myc06 name='tom' age='21'></arr-myc06>  //在父组件上直接在子组件的标签上写属性
```

```typescript
 @Input() name:String;  //在子组件中接收
```

* 但是如果想要别的类型的参数

```html
<app-myc06 name='tom' [age]='21'></arr-myc06>  //在父组件上直接在子组件的标签上写属性
```

```typescript
 @Input() age:Number;  //在子组件中接收
```

###  `子向父组件传参`

* 原理

  * 父通过属性的方式传递一个方法给子

    * `(事件名)='自身方法($event)'`

  * 子再通过触发父传入的方法,将值传给父

    * `@Output() 事件名 = new EventEmitter<Class>();`

    * `事件属性.emit(参数)`

```typescript
<app-myc06 (msgEvent)='showName($event)'><app-myc06>          //传递父的一个方法给子
    //msgEvent是子中声明的事件名
    //(事件名)='js代码'  表示事件触发时,就会执行''中的代码
    //比如(click)='show()'代表点击时,会触发'show()'
```

```typescript
//同时在父的ts文件里写入这个方法
showName(name:String){
 //此方法会传递给子,参数name会由子传递 
  alert(name)
}
```

```typescript
//同时在子的ts文件里output刚才的msgEvent,两者一定要对应上,表示向外输出一个事件触发器msgEvent
//触发器的触发场景:由子来决定,触发写法:this.msgEvent.emit(参数)
@Output() msgEvent = new EventEmitter<Class>();
```

```html
 <!--同时在子html文件中-->
 <!--msgEvent事件触发器,触发的方法是父赋值的 showName()  -->
 <button (click)='msgEvent.emit(`猪猪侠`)'>text</button>
```

### `路由`

* 正常操作

  * 创建项目时,第一个就会询问就会询问是否要开启路由,此时输入`y`回车即可		

* 对于已有项目

  * 在`src/app`下创建`app-routing.moudle.ts`文件
  * 在此文件中书写固定的代码,可以使用插件`ng-routing`自动生成

* 如何

  ```html
  <!--总的html文件里-->
  <router-outlet></router-outlet>
  <!--会根据路由呈现出对应的状态-->
  
  <a [routerLink]=['/index']>首页</a>
  ```

  ```typescript
  //去总的routing.ts文件里
  import {IndexComponent} from './index/index.component'
  import {Lxg01Component} from './lxg01/lxg01.component'
  //然后再挂载在路由字典数组上,和vue及其类似
  const routes: Routes = [
    {
      path:'',component:IndexComponent
    },
    {
      path:'**',component:Lxg01Component
    }
  ]; 
  ```

  `**`代表通配符,匹配以上所有路径的其他路径,所以只要不是以上的路径,就会跳到这个页面

### `ionic`

* 是什么

  * 一款第三方的**混编库**,用于使用前端语言来制作`iso`,`Android`

* **混编**:混合编译

* 手机端整体和前端非常像,很多前端程序员也想开发手机软件,但是又不想学习新的语言

  * Facebook开发了最初的`ReactNative`,可以利用js来书写,经过编译之后,会变为手机的软件
  * 写一次,就可以分别编译成`安卓`和`ios`版本同时执行

* 缺点:混编项目的运行效率以及可实现的功能,没有原生强,因此适合对客户体验要求不高的小项目

* 主流框架:

  * **ionic**

    * 适合基于`vue`,`angular`,`react`都可以做开发
    * 更趋近与网页方式呈现页面

  * **ReactNative**

    * 基于`React`进行开发

    * 特色:更趋近原生的`app`,效率更高,能够调用更多的原生`api`

      

* 官网 https://ionicframework.com

* 文档 https://ionicframework.com/docs

* **ionic**脚手架启动流程

  在ionic项目文件夹下

  ```cmd
  ionic start '项目名'
  
  ionic serve 
  ```

* 常用标签

  * `ion-app`标签,相当于我们的`html`标签

  ```html
  <ion-app></ion-app>                                
  ```

  * `ion-header`标签,程序的头部

  ```html
  <ion-header>
      <ion-toolbar>
        <ion-title>Header</ion-title>
      </ion-toolbar>
  </ion-header>
  
  <!--苹果和安卓设备的显示效果会有差异-->
  ```

  * `ion-content`类似于`body`,用于存放主要代码

  ```html
  <ion-content></ion-content>
  ```

* 组件

  * 徽章组件

  ```html
   <ion-badge color="primary" mode="ios">123</ion-badge>
  <!--还有其他很多颜色,secondary,success,warning,danger,light,dark,medium等等,详见官方文档 -->
  ```

  * icon组件
    * ionic提供了很多常用的小图标

  ```html
   <ion-icon name="add"></ion-icon>
   <ion-icon name="star-outline"></ion-icon>
   <ion-icon name="star"></ion-icon>
  <!--还有很多自带icon,具体详见官方文档-->
  ```

  * card组件
  
  ```html
   <ion-card  button='true'>  <!--声明了button属性的卡片,点击后会放大和缩小-->
      <!--其他属性详见官方文档-->
      <ion-img src=""></ion-img> <!--卡片图-->          
      <ion-card-header>
        <ion-card-subtitle>Awesome Subtitle</ion-card-subtitle> <!--子标题-->          
        <ion-card-title>Awesome Title</ion-card-title>  <!--主标题-->
      </ion-card-header>
      <ion-card-content>
        内容
      </ion-card-content>
    </ion-card>
  ```
  
  * input组件
  
  ```html
  <!--输入框组件-->
  <ion-input type="text" placeholder="请输入姓名" autofocus></ion-input>   <!--autofocus自动获取焦点-->
  <ion-input type="password" placeholder="请输入密码" clearInput></ion-input>  <!--会提供一个清空该输入框内容的小叉-->
  <ion-input type="password" placeholder="请输入密码" clear></ion-input>   
  ```
  
  * item组件
  
    * 类似`html`里的`div`标签
    * 自带下分割线
      * lines属性,有三种不同的样式
        * full
        * none
        * inset
      * href属性
        * 在实现其他功能的同时,还可以进行类似`a`标记的跳转功能
  
  * label组件
  
    * 用于书写文本,类似`html`里的`SPAN`
    * 书写长度超长了的话,会把超过的部分变为`...`
  
  * avatar
  
    * 带有头像的item
  
    ```html
    <ion-avatar slot='start'>
      <img [src]="image"/>
    </ion-avatar>
    ```
  
    * 会自动把内部的图片变为圆形,给一种类似头像的样式
    * `slot`属性:控制图片位置
  
  * thumbnail
  
    * 带有缩略图的item,图是方形的
  
    ```html
    <ion-thumbnail>
      <img src="image"/>
    </ion-thumbnail>
    ```
  
  * 按钮组件
  
    * 原生`button`可以在`ionic`上面使用,但是样式上会有很大效果,不推荐使用
  
    * `ionic`默认提供了`ion-button`
  
      ```html
      <ion-button>
            Click me
      </ion-button>
      ```
  
      * 可在`ion-button`里添加`icon`标签,为按钮添加`icon`	
  
    * 属性
  
      * size : 大小
      * expand: 按钮的风格
      * fill: 填充
      * 颜色: danger,primary,warning等等,详见文档
      * disabled:可用或者不可用
  
  * alert组件
  
    * 弹出框组件
  
      ```html
      <ion-button (click)="show()">
            Click me
      </ion-button>
      ```
  
      ```typescript
      import {AlertController} from '@ionic/angular'  //引入弹出框组件
      constructor(
          private alertC: AlertController
        ) {
          this.initializeApp();
        }
      
      show(){
         let options={
             header:'标题',
             message:'内容',
             buttons:[
             {text:'讲过',handler:()=>console.log(1)},
             {text:'没讲过',handler:()=>console.log(0)}
             ]
         };
          //create()方法接收一个对象类型的配置项,配置弹出框中的所有内容
         this.alertC.create(options).then(dialog=>{
            //dialog:就是创建出来的对话框,这个是认为定义的参数
             dialog.present();//就是让弹出框出现的意思
         })
      }
      ```
  
      
  
  * slides
  
    * 滚动组件
  
      ```html
      <ion-slides mode="ios" pager="ios" scrollbar="ios">
         <ion-slide *ngFor="let item of imgs">
            <ion-img [src]="item.src"></ion-img>
         </ion-slide>
      </ion-slides>
      ```
  
  * grid栅格系统
  
    ```html
    <ion-grid fixed>
        <ion-row>
          <ion-col size="6"></ion-col>
          <ion-col size="6"></ion-col>
        </ion-row>
    </ion-grid>  <!--类似bootStrap的row和col-n-->
    <!--如果不写size,会把屏幕宽度充满-->
    <!--如果不写size,并且写了好几个ion-col,那这几个就会平分页面-->
    ```
  
  * infinite Scroll 
  
    * 无限列表刷新
  
      ```html
      <ion-infinite-scroll threshold="25%" [disabled]="true" position="bottom" (ionInfinite)="loadData($event)">
          <ion-infinite-scroll-content loadingSpinner="bubbles" loadingText="Loading more data...">
          </ion-infinite-scroll-content>
      </ion-infinite-scroll>
      ```
  
      * `threshold="25%"`剩余未显示区域占据屏幕高度的25%时,加载更多方法

