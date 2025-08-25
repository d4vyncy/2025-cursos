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


getInfoUsuario = async (id) => {
    try {
        const empleado = await getempleadoByID(id);
        const salario = await getsalarioByID(id);
        return `El empleado ${empleado.nombre} tiene un salario de ${salario.salario}`;
    } catch (error) {
        return error;
    }
}

const id = 10;
getInfoUsuario(id)
    .then(msg => {
        console.log('TODO BIEN!!!');
        console.log(msg);
    })
    .catch(err =>{
        console.log('TODO MAL!!!');
        console.log(err);        
    } )
    ;


