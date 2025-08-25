const empleados = [
    { id: 1, nombre: 'Juan' },
    { id: 2, nombre: 'Ana' },
    { id: 3, nombre: 'Pedro' }
];

const salarios = [
    { id: 1, salario: 1000 },
    { id: 2, salario: 1500 }
];

const getempleadoByID = (id) => {


    return new Promise((resolve, reject) => {
        const empleado = empleados.find(e => e.id === id);
        (empleado)
            ? resolve(empleado)
            : reject(`No existe empleado con ID ${id}`);


    });
}

const getsalarioByID = (id) => {


    return new Promise((resolve, reject) => {
        const salario = salarios.find(e => e.id === id);
        (salario)
            ? resolve(salario)
            : reject(`No existe salario con ID ${id}`);


    });
}


const id = 10;
// getempleadoByID(id)
//     .then(empleado => {
//         console.log(empleado);
//         getsalarioByID(id)
//             .then(salario => console.log(salario))
//             .catch(err => console.log(err))
//             .finally(() => console.log('Operación finalizada'));
//     })
//     .catch(err => console.log(err))
//     .finally(() => console.log('Operación finalizada'));

let nombre;

getempleadoByID(id)
    .then(empleado => {
        nombre = empleado.nombre;
        return getsalarioByID(id);
    })
    .then(salario => console.log(`El empleado ${nombre} tiene un salario de ${salario.salario}`))
    .catch(err => console.log(err))
    ;