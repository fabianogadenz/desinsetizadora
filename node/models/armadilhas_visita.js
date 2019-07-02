const db = require("../bd-config")

const Armadilhas_Visita = db.sequelize.define('armadilhas_visita', {
    id_armadilha: {
        type: db.Sequelize.INTEGER
    },
    id_cliente: {
        type: db.Sequelize.INTEGER
    },
    id_visita: {
        type: db.Sequelize.INTEGER
    },
    status_antigo: {
        type: db.Sequelize.STRING
    },
    status_novo: {
        type: db.Sequelize.STRING
    },
    posicao: {
        type: db.Sequelize.STRING
    },
    data: {
        type: db.Sequelize.STRING
    },
})

 //Armadilhas_Visita.sync({force: true})
module.exports = Armadilhas_Visita