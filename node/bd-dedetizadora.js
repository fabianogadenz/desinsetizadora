const db = require("./bd-config")

db.sequelize.authenticate().then(function(){
    console.log("conectado")
}).catch(function(erro){
    console.log("erro" + erro)
})

