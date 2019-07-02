const db = require("../bd-config")

const Visita = db.sequelize.define('visita', {
    data: {
        type: db.Sequelize.TEXT
    },
    id_cliente: {
        type: db.Sequelize.INTEGER
    },
    hora_inicio: {
        type: db.Sequelize.TEXT
    },
    hora_fim: {
        type: db.Sequelize.TEXT
    },
    obs: {
        type: db.Sequelize.TEXT
    },
})

// Login.create({
//     email: "fabiano@gmail.com",
//     senha: "123456"
// })


//Visita.sync({force: true})

module.exports = Visita