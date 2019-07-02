const db = require("../bd-config")

const Armadilhas_Clientes = db.sequelize.define('armadilhas_clientes', {
    id_armadilha: {
        type: db.Sequelize.INTEGER
    },
    id_cliente: {
        type: db.Sequelize.INTEGER
    },
})

// Armadilhas_Clientes.sync({force: true})
// Armadilhas_Clientes.sync({force: true})
module.exports = Armadilhas_Clientes