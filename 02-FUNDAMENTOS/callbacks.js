
// setTimeout(() => {
//     console.log('Hola Mundo');
// }, 1000); // Ejecuta después de 1 segundo
// // setTimeout es una función que recibe un callback y un tiempo en milisegundos 

const getUsuarioByID = (id, callback) => {
    const usuario = {
        id: id,
        nombre: 'David'
    };

    setTimeout(() => {
        callback(usuario);
    }, 1500); // Simula una llamada a una base de datos
}

getUsuarioByID(10, (usuario) => {
    console.log(usuario.id);
    console.log(usuario.nombre.toUpperCase());
}); 

