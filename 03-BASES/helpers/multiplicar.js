const fs = require('fs');

getcrearArchivo = async (base) => {
    try {
        return await crearArchivo(base);
    } catch (error) {
        return error;
    }
}

const crearArchivo = async (base = 5) => {
    try {
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
    } catch (error) {
        return error;
    }
}

module.exports = {
    getcrearArchivo
};