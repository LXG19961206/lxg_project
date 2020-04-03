const express=require('express');
const pool=require('../pool.js');
let router=express.Router();
router.get('/login/:phone&:checks',function(req,res)
	{
		let obj=req.params;
        console.log(obj);
	    let sql='select * from user where phone=? and checks=? or (uname=? and checks=?)'
		pool.query(sql,[obj.phone,obj.checks,obj.phone,obj.checks],function(err,result)
			{
			  res.send(result);
			  
			  
			})
	})
module.exports=router;