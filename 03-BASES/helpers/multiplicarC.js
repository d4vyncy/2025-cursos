const fs = require('fs');

const getcrearArchivo = async (base = 5) => {
    return new Promise((resolve, reject) => {
        console.log('================');
        console.log('Tabla del ', base);
        console.log('================');
        let salida = '';
        for (let i = 1; i <= 10; i++) {
            salida += `\n ${base} x ${i} = ${base * i}`;
        }
        console.log(salida);

        fs.writeFileSync(`./salida/tabla-${base}.txt`, salida);
        console.log('Archivo creado');
    } );
}

module.exports = {
    getcrearArchivo
};