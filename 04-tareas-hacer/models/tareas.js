/**
 * _listado: 
 *  { 'uuid-12345-67890': { id:12, desc: asdasd, completadoEn: 92231 }},
 *  { 'uuid-09876-54321': { id:12, desc: asdasd, completadoEn: 92231 }},
 *  { 'uuid-45678-12345': { id:12, desc: asdasd, completadoEn: 92231 }}
 * }    
 */

const Tarea = require("./tarea");

class Tareas {

    _listado = {};

    constructor() {
        this._listado = {};
    }

    cargarTareasFromArray(tareas = []) {
        tareas.forEach(tarea => {
            this._listado[tarea.id] = tarea;
        });
    }

    crearTarea(desc = '') {
        const tarea = new Tarea(desc);
        this._listado[tarea.id] = tarea;
    }

    listadoCompleto() {
        this.listadoArr.forEach((tarea, i) => {
            const idx = `${i + 1}.`.green;
            const { desc, completadoEn } = tarea;
            const estado = (completadoEn)
                ? 'Completada'.green
                : 'Pendiente'.red;

            console.log(`${idx} ${desc} :: ${estado}`);
        });

    }

    listadoPendientesCompletadas(completadas = true) {
        this.listadoArr.forEach((tarea, i) => {
            const { desc, completadoEn } = tarea;
            const idx = `${i + 1}.`.green;
            const estado = (completadoEn)
                ? 'Completada'.green
                : 'Pendiente'.red;
            if (completadas) {
                if (completadoEn) {
                    console.log(`${idx} ${desc} :: ${completadoEn.green}`);
                }
            } else {
                if (!completadoEn) {
                    console.log(`${idx} ${desc} :: ${estado}`);
                }
            }
        });
    }

    borrarTarea(id = '') {
        if (this._listado[id]) {
            delete this._listado[id];
        }
    }

    get listadoArr() {
        const listado = [];
        Object.keys(this._listado).forEach(key => {
            const tarea = this._listado[key];
            listado.push(tarea);
        });

        return listado;
    }
}


module.exports = Tareas;