const fs = require('fs');
const colors=require('colors');
// getcrearArchivo = async (base) => {
//     try {
//         return await crearArchivo(base);
//     } catch (error) {
//         return error;
//     }
// }

const crearArchivo = async (base = 5,hasta=10, listar = false) => {
    try {
        let salida = '';
        for (let i = 1; i <= hasta; i++) {
            salida += `\n ${base} x ${i} = ${base * i}`;
        }
        if (listar) {
            console.log('================'.green);
            console.log('Tabla del '.green, colors.blue(base));
            console.log('================'.green);
            console.log(salida);
        }
        fs.writeFileSync(`./salida/tabla-${base}.txt`, salida);
        return `tabla-${base}.txt`;
    } catch (error) {
        return error;
    }
}

module.exports = {
    crearArchivo
};