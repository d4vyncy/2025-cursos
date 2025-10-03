const http = require('http');

http.createServer((req, res) => {
  // res.writeHead(200, { 'Content-Type': 'application/json' });
  //   const persona = {
  //   id: 1,
  //   nombre: 'David'
  // }
//res.write(JSON.stringify(persona));

  // res.setHeader('Content-Disposition','attachment; filename=lista.csv')
  // res.writeHead(200, { 'Content-Type': 'application/csv' });
  
  
  // res.write('id, nombre\n');
  // res.write('1, David\n');
  // res.write('2, Luly\n');
  // res.write('3, Alejandro\n');
  // res.end();
}).listen(3000, () => {
  console.log('Server running at http://localhost:3000/');
});
