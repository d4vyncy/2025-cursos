const deadpool= {
    nombre: 'Wade',
    apellido: 'Winston',
    poder: 'Regeneración',
    edad: 30,
    getNombre() {
        return `${this.nombre} ${this.apellido} - Poder: ${this.poder}`;
    }
}

function imprimirHeroe({ nombre, apellido, poder,edad }) {
    // const { nombre, apellido, poder } = heroe;
    // nombre='David';
    console.log(nombre, apellido, poder,edad);
}

//imprimirHeroe(deadpool);

const heroes = ['Deadpool', 'Superman', 'Batman'];

const h1 = heroes[0];
const h2 = heroes[1];
const [h3, h4] = heroes;
console.log(h1, h2, h3, h4);


// const nombre = deadpool.nombre;
// const apellido = deadpool.apellido;
// const poder = deadpool.poder;

// console.log(deadpool.getNombre());


// const { nombre, apellido, poder,edad } = deadpool;

// console.log(nombre, apellido, poder,edad);