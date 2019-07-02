const db = require("../bd-config")

const Armadilha = db.sequelize.define('armadilha', {
    nome: {
        type: db.Sequelize.STRING
    },
    obs: {
        type: db.Sequelize.TEXT
    },
    situacao: {
        type: db.Sequelize.STRING
    },
})

// Armadilha.sync({force: true})
module.exports = Armadilha