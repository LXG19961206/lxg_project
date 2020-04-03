//app.js 服务器端程序
//1:下载第三方模块
//  express express-session
//  mysql cors
//  示例
//  npm i express express-session mysql cors 回车
//2:引入第三方模块
//web服务器
const express = require("express");
//session对象
const session = require("express-session");
//mysql驱动
const mysql =require("mysql");
//跨域
const cors=require("cors");
//3:创建数据库连接池
var pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    database:"lxg2",
    port:3306,
    connectionLimit:15
});
//4:配置跨域模块:允许脚手架访问服务器
var server = express();
server.use(cors({
  //允许:脚手架访问服务器
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  //每次请求加验证
  credentials:true
}))
//5:配置session !!!
//6:创建服务器对象
//6.1:配置静态目录
server.use(express.static("public"));
//6.2:配置session对象
server.use(session({
  secret:"128位安全字符串",//加密条件
  resave:true,//请求更新数据
  saveUninitialized:true //保存初始数据
}))
//7:为服务器对象绑定端口 4000
server.listen(4000);

server.get('/index',function(req,res){
	var arr=[];
	pool.query('select * from product',[],function(err,result)
	{
		arr.push(result);
		pool.query('select * from video',[],function(err,result)
		{
		arr.push(result);
		pool.query('select * from news',[],function(err,result)
		{
		arr.push(result);
		res.send(arr);
		})})
	})
})


server.get('/details',function(req,res){
	console.log(req.query.pid)
	pool.query(`SELECT * FROM product WHERE pid=?`,[Number(req.query.pid)+1],function(err,result)
	{
		if(err)throw err
		res.send(result)
	})
})

server.get('/login',function(req,res){
	var uname=req.query.uname
	var upwd=req.query.upwd
	pool.query(`SELECT uname FROM userlist WHERE uname=? and upwd=?`,[uname,upwd],function(err,result)
	{	
		
		if(err)throw err
		
		if(result.length>0){
			req.session.uid=result[0].uname
			console.log(req.session.uname)
			
		}
		res.send(result)
	})
})

server.get('/loginstatus',function(req,res){
	console.log(req.session)
	var uid=req.session.uid
	console.log(req.session.uid)
	
	pool.query(`SELECT uname FROM userlist WHERE uid=?`,[uid],function(err,result)
	{
		if(err)throw err
		console.log(result)
		res.send(result)
	})
})

server.get('/reg',function(req,res){
	var obj=req.query
	
	pool.query(`INSERT INTO userlist SET?`,[obj],function(err,result)
	{
		if(err)throw err
		if(result.affectedRows>0){
			res.send('1')
		}else{
			res.send('0')
		}
	})
})


server.get('/user',function(req,res){
	var uname=req.query.uname
	
	pool.query(`SELECT * FROM userlist WHERE uname=?`,[uname],function(err,result)
	{
		if(err)throw err
		if(result.length>0){
			console.log(result)
			res.send(result)
		}else{
			res.send('0')
		}
	})
})

server.get('/news',function(req,res){
	
	pool.query(`SELECT * FROM news`,[],function(err,result)
	{
		if(err)throw err
		if(result.length>0){
			console.log(result)
			res.send(result)
		}else{
			res.send('0')
		}
	})
})

server.get('/newsdetails',function(req,res){
	var id=req.query.newsid
	pool.query(`SELECT * FROM news WHERE news_id=?`,[id],function(err,result)
	{
		if(err)throw err
		if(result.length>0){
			console.log(result)
			res.send(result)
		}else{
			res.send('0')
		}
	})
})

server.get('/coursedetails',function(req,res){
	var id=req.query.cid
	pool.query(`SELECT * FROM course WHERE cid=?`,[id],function(err,result)
	{
		if(err)throw err
		if(result.length>0){
			console.log(result)
			res.send(result)
		}else{
			res.send('0')
		}
	})
})

server.get('/cartnum',function(req,res){
	var uname=req.query.uname
	pool.query(`SELECT * FROM cart WHERE uname=?`,[uname],function(err,result)
	{
		if(err)throw err
		if(result.length>0){
			console.log(result)
			res.send(result)
		}else{
			res.send('0')
		}
	})
})


server.get('/cart',function(req,res){
	var obj={
		pid:Number(req.query.pid)+1,
		uname:req.query.uname,
		num:1
	}
	
	pool.query('SELECT * FROM cart WHERE pid=? and uname=?',[obj.pid,obj.uname],function(err,result){
		if(err)throw err;
		if(result.length>0&&result[0].num>=1){
			var numsave=result[0].num+1
		pool.query(`UPDATE cart SET num=? WHERE uname=? and pid=?`,[numsave,obj.uname,obj.pid],function(err,result)
		{
			if(err)throw err
			if(result.length>0){
				console.log(result)
			}else{
				res.send('0')
			}
		})}else{
			pool.query(`INSERT INTO cart SET?`,[obj],function(err,result){
				if(err)throw err;
				if(result.length>0){
					console.log(result)
				}else{
					res.send('0')}
			})
		}
	})
	
})



server.get('/udtcart',function(req,res){
	var obj=req.query
	pool.query(`UPDATE cart SET? WHERE uname=? and pid=?`,[obj,obj.uname,obj.pid],function(err,result)
	{
		if(err)throw err
		if(result.length>0){
			console.log(result)
			res.send(result)
		}else{
			res.send('0')
		}
	})
})   



server.get('/rmcart',function(req,res){
	var obj=req.query
	pool.query(`DELETE FROM cart WHERE uname=? and pid=?`,[obj.uname,obj.pid],function(err,result)
	{
		if(err)throw err
		if(result.length>0){
			console.log(result)
			res.send(result)
		}else{
			res.send('0')
		}
	})
})  
 
 server.get('/pay',function(req,res){
 	var obj=req.query.arr
		console.log(obj)
	var uname=JSON.parse(obj[0]).uname
	
	pool.query(`DELETE FROM pay WHERE uname=?`,[uname],function(err,result){
		if(err)throw err;
		if(result.length>0){
			console.log(result)
		}
		for(var i=0;i<obj.length;i++){
			var item=JSON.parse(obj[i])
			console.log(item)
			item.buydate=new Date().toLocaleString()
			pool.query(`INSERT INTO pay SET?`,[item],function(err,result){
				if(err)throw err;
				if(result.length>0){
					console.log(result)
				}
			})
		}
		res.send(result)
	})
 })   
 
 server.get('/paymethod',function(req,res){
 	var uname=req.query.uname
 	pool.query(`SELECT * FROM pay WHERE uname=?`,[uname],function(err,result)
 	{
 		if(err)throw err
 		if(result.length>0){
 			console.log(result)
 			res.send(result)
 		}else{
 			res.send('0')
 		}
 	})
 })
 
 server.get('/payfinish',function(req,res){
 	var obj=req.query
 	console.log(obj)
	for(var key in obj){
		var item=JSON.parse(obj[key])
		console.log(item)
		pool.query(`DELETE FROM cart WHERE uname=? AND pid=?`,[item.uname,item.pid],function(err,result){
				if(err)throw err;
				console.log(result)
			pool.query(`DELETE FROM pay WHERE uname=?`,[item.uname],function(err,result){
				if(err)throw err;
				console.log(result)
			})
		})
	}
 })
 
 server.get('/paid',function(req,res){
 	var obj=req.query
 	for(var key in obj){
 		var item=JSON.parse(obj[key])
		item.buydate=new Date()
 		pool.query(`INSERT INTO paid SET?`,[item],function(err,result){
 			if(err)throw err;
 			console.log(result)
 		})}
	res.send('1')
 })
 
 server.get('/paidlist',function(req,res){
 	var uname=req.query.uname
 	pool.query(`SELECT * FROM paid WHERE uname=?`,[uname],function(err,result){
 		if(err)throw err;
 		result.length>0?res.send(result):res.send('0')
 	}) 	
 })
 
 server.get('/job',function(req,res){
 	pool.query(`SELECT * FROM joboffer`,[],function(err,result){
 		if(err)throw err;
 		result.length>0?res.send(result):res.send('0')
 	}) 	
 })
 
 server.get('/course',function(req,res){
 	pool.query(`SELECT * FROM course`,[],function(err,result){
 		if(err)throw err;
 		result.length>0?res.send(result):res.send('0')
 	}) 	
 })
 
 server.get('/search',function(req,res){
 	if(req.query.keyword){
	pool.query(`SELECT * FROM product WHERE pname LIKE '%${req.query.keyword}%'`,[],function(err,result){
		if(err)throw err;
		
		result.length>0?res.send(result):res.send('0')
	})}else{
		pool.query(`SELECT * FROM product WHERE pclass LIKE '%${req.query.pclass}%'`,[],function(err,result){
			if(err)throw err;
			
			result.length>0?res.send(result):res.send('0')
		})
	}
 })