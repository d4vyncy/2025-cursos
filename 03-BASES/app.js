
const { getcrearArchivo } = require('./helpers/multiplicar');

console.clear();
const base = 16;
getcrearArchivo(base)
    .then(nombreArchivo => console.log(nombreArchivo, 'creado'))
    .catch(err => console.log(err));



