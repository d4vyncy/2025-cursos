const express = require('express')
const hbs = require('hbs');
require('dotenv').config();

const app = express()
const port = process.env.PORT;
// const port = 8080;


// Handlebars
app.set('view engine','hbs')
hbs.registerPartials(__dirname + '/views/partials',function(err){});

// Servir contenido estatito
app.use(express.static('public'));

app.get('/', (req, res) => {
  res.render('home',{
    nombre: 'David Serrudo',
    titulo: 'Curso de Node'
  });
});

app.get('/generic', (req, res) => {
  res.render('generic',{
    nombre: 'David Serrudo',
    titulo: 'Curso de Node'
  });
});

app.get('/elements', (req, res) => {
  res.render('elements',{
    nombre: 'David Serrudo',
    titulo: 'Curso de Node'
  });
});

// app.get('/generic', (req, res) => {
//   res.sendFile(__dirname + '/public/generic.html')
// });

// app.get('/elements', (req, res) => {
//   res.sendFile(__dirname + '/public/elements.html')
// });

// app.get('/*',(req,res) => {
//   res.send('public/404.html')
// });

app.listen(port,()=>{
  console.log(`Example app listening at http://localhost:${port}`)
})