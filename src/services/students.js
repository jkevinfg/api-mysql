const MysqlLib = require('../lib/mysql');


class StudentsService {
    constructor() {
        this.table = 'estudiante',
        this.mySQL = new MysqlLib();
    }

    async getStudents() {
        const students = await this.mySQL.getAll(this.table);
        console.log(students)
        return students || [];
    }

}

module.exports = StudentsService;