const db = require("../bd-config")

const Login = db.sequelize.define('login', {
    email: {
        type: db.Sequelize.STRING
    },
    senha: {
        type: db.Sequelize.STRING
    },
    nome: {
        type: db.Sequelize.STRING
    },
})

// Login.create({
//     email: "fabiano@gmail.com",
//     senha: "123456"
// })


//Login.sync({force: true})

module.exports = Login