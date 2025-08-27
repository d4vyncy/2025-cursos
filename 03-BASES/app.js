
const { getcrearArchivo } = require('./helpers/multiplicar');

console.clear();

const [
    , , arg3 = 'base=5'
] = process.argv;
const [, base] = arg3.split('=');

console.log(base);

// const base = 16;
getcrearArchivo(base)
    .then(nombreArchivo => console.log(nombreArchivo, 'creado'))
    .catch(err => console.log(err));



