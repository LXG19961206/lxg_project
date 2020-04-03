const express=require('express');
const Router=require('./routes/user.js')
const bodyParser=require('body-parser');
let app=express();
app.listen(8080);
app.use(express.static('./public'));
app.use(bodyParser.urlencoded({extended:false}));
app.use('/user',Router);