const MysqlLib = require('../lib/mysql');


class StudentsService {
    constructor() {
        this.table = 'persona',
        this.mySQL = new MysqlLib();
    }

    async getStudents() {
        const students = await this.mySQL.getAll(this.table);
        return students ;
    }



}

module.exports = StudentsService;