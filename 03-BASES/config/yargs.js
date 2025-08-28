const yargs = require('yargs/yargs');
const { hideBin } = require('yargs/helpers');

// inicializamos yargs con los argumentos que vienen de la terminal
const argv = yargs(hideBin(process.argv))
    .option('b', {
        alias: 'base',
        type: 'number',
        demandOption: true,
        describe: 'Base de la tabla de multiplicar'
    })
    .option('h', {
        alias: 'hasta',
        type: 'number',
        demandOption: true,
        describe: 'hasta que numero la tabla debe multiplicar'
    })
    .option('l', {
        alias: 'listar',
        type: 'boolean',
        demandOption: false,
        describe: 'Listar o no la tabla'
    })
    .check((argv) => {
        if (isNaN(argv.b)) {
            throw new Error('La base tiene que ser un número');
        }
        return true;
    })
    .argv;

module.exports = argv;