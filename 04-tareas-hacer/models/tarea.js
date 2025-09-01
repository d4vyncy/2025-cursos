const { v4 : uuidv4 } = require('uuid');

class Tarea {
    id = '';    
    desc = '';
    completadoEn = null;

    constructor(desc) {
        //this.id = Math.random().toString(36).substring(2, 15);
        this.id =uuidv4();
        this.desc = desc;
        this.completadoEn = null;
    }   

}

module.exports = Tarea;
