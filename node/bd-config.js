//conexao com o banco
const Sequelize = require('sequelize');
const sequelize = new Sequelize('dedetizadora', 'root', 'SUASENHA', {
    host: "localhost",
    dialect: 'mysql'
})
sequelize.authenticate().then(function(){
    console.log("conectado")
}).catch(function(erro){
    console.log("erro" + erro)
})

module.exports = {
    Sequelize: Sequelize,
    sequelize: sequelize
}