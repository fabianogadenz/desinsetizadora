const db = require("../bd-config")

const Cliente = db.sequelize.define('cliente', {
    nome: {
        type: db.Sequelize.STRING
    },
    telefone: {
        type: db.Sequelize.STRING
    },
    endereco: {
        type: db.Sequelize.STRING
    },
    max_armadilhas: {
        type: db.Sequelize.INTEGER
    },
    id_login: {
        type: db.Sequelize.INTEGER
    }
})

// Cliente.sync({force: true})
module.exports = Cliente