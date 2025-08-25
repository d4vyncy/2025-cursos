const empleados = [
    { id: 1, nombre: 'Juan' },
    { id: 2, nombre: 'Ana' },
    { id: 3, nombre: 'Pedro' }
];

const salarios = [
    { id: 1, salario: 1000 },
    { id: 2, salario: 1500 },
    { id: 4, salario: 2000 }
];

const getempleadoByID = (id, callback) => {
    const empleado = empleados.find(e => e.id === id);

    if (empleado) {
        callback(null, empleado);
    } else {
        callback(`Empleado con ID ${id} no encontrado`);
    }
}

const getsalarioByID = (id, callback) => {
    const salario = salarios.find(e => e.id === id);

    if (salario) {
        callback(null, salario);
    } else {
        callback(`Salario con ID ${id} no encontrado`);
    }
}
const id = 3;
getempleadoByID(id, (err, empleado) => {
    if (err) {
        console.log('Error al obtener el empleado');
        return console.error(err);;
    }

    //console.log('Empleado encontrado: ', empleado);
    getsalarioByID(id, (err, salario) => {
        if (err) {
            console.log('Error al obtener el salario');
            return console.error(err);;
        }

        console.log('El empletado: ', empleado.nombre, 'tiene un salario de: ', salario.salario + ' euros al mes'       );

    });
});

