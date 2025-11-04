require('dotenv').config();


const express = require('express')
const app = express()

app.get('/', function(req,res){
    res.send('Hola david...')
})

app.listen(process.env.PORT, ()=>{
    console.log('servidor corriendo en puerto',process.env.PORT);
})