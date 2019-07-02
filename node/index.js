const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const Login = require("./models/login")
const Cliente = require("./models/cliente")
const Visita = require("./models/visita")
const Armadilhas_Visita = require("./models/armadilhas_visita")
const Armadilhas_Clientes = require("./models/armadilhas_clientes")
const Armadilha = require("./models/armadilha")
const { to, ReE, ReS } = require('./util.service');
const {sequelize, Sequelize} = require("./bd-config");



//body parce
app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())


//pegar: GET
app.get('/login', async function(req, res) {
    
    [err, logins] = await to(Login.findAll());
    if (err) return ReE(res, err, 500);
	return ReS(res, logins, 200);

});
app.get('/teste/:id', async function(req, res) {
    
    [err, teste] = await to(sequelize.query("select * from clientes c, visita v  where c.id = "+req.params.id+" and c.id = v.id_cliente  and v.data = (select max(data) from visita where id_cliente = "+req.params.id+")limit 1;", {type: 
    sequelize.QueryTypes.SELECT}));
    if (err) return ReE(res, err, 500);
    console.log(teste);
	return ReS(res, teste, 200);

});

app.get('/visita_cliente_info/:id', async function(req, res) {
    
    [err, teste] = await to(sequelize.query("select * from clientes c, visita v  where v.id = "+req.params.id+" and c.id = v.id_cliente limit 1;", {type: 
    sequelize.QueryTypes.SELECT}));
    if (err) return ReE(res, err, 500);
    console.log(teste);
	return ReS(res, teste, 200);

});

app.get('/armadilhas_clientes/:id', async function(req, res) {
    
    [err, teste] = await to(sequelize.query(" select a.id, a.nome, a.obs, a.situacao, a.createdAt, a.updatedAt  from armadilhas a, armadilhas_clientes b where a.id = b.id_armadilha and b.id_cliente = "+req.params.id, {type: 
    sequelize.QueryTypes.SELECT}));
    if (err) return ReE(res, err, 500);
    console.log(teste);
	return ReS(res, teste, 200);

});


app.get('/last_armadilha', async function(req, res) {
    
    [err, teste] = await to(sequelize.query("select max(id) as ultima_armadilha from armadilhas;", 
    {type: sequelize.QueryTypes.SELECT}));
    if (err) return ReE(res, err, 500);
    console.log(teste);
	return ReS(res, teste, 200);

});


app.get('/login1', async function(req, res) {
    // [ err, login ] = await to(Login.create(req.body));
	// if (err) return ReE(res, err, 422);
    // return ReS(res, { 'MSG:': 'Criado com Sucesso Login :' + login.email }, 201);
    [err, logins] = await to(Login.findByPk(req.headers.email));
    if (err) return ReE(res, err, 500);
	return ReS(res, logins, 200);

});


app.get('/login/:id', async function(req, res) {
    
    [err, login] = await to(Login.findByPk(req.params.id));
    if (err) return ReE(res, err, 500);
	return ReS(res, login, 200);

});


app.get('/armadilhas', async function(req, res) {
    
    [err, armadilha] = await to(Armadilha.findAll());
    if (err) return ReE(res, err, 500);
	return ReS(res, armadilha, 200);

});
app.get('/armadilhas/:id', async function(req, res) {
    
    [err, armadilha] = await to(Armadilha.findByPk(req.params.id));
    if (err) return ReE(res, err, 500);
	return ReS(res, armadilha, 200);

});


app.get('/clientes', async function(req, res) {
    
    [err, clientes] = await to(Cliente.findAll());
    if (err) return ReE(res, err, 500);
	return ReS(res, clientes, 200);

});
app.get('/visitas', async function(req, res) {
    
    [err, visita] = await to(Visita.findAll());
    if (err) return ReE(res, err, 500);
	return ReS(res, visita, 200);

});

app.get('/visitas/:data', async function(req, res) {
    var data = req.params.data;
    data = data.split("-").join("/");
    [err, visita] = await to(Visita.findAll({where : {data:data}}));
    if (err) return ReE(res, err, 500);
	return ReS(res, visita, 200);

});

app.get('/visita/:id', async function(req, res) {
    [err, visita] = await to(Visita.findByPk(req.params.id));
    if (err) return ReE(res, err, 500);
	return ReS(res, visita, 200);

});


//DELETE

app.delete('/login/:id', async function(req, res) {
    [ err, login ] = await to(Login.destroy({ where: { id: req.params.id } }));
	if (err) return ReE(res, err, 500);
    return ReS(res, { 'MSG:': 'Login de ID: ' + req.params.id + ' deletado!' }, 201);
});

//update
app.put('/login/:id', async function(req, res) {
    let loginToUpdate = req.body;
    [ err, login ] = await to(Login.update(loginToUpdate, { where: { id: req.params.id } }));
	if (err) return ReE(res, err, 422);
	return ReS(res, { 'MSG:': 'Atualizado com Sucesso Login de ID: ' + req.params.id }, 201);

});

app.put('/cliente/:id', async function(req, res) {
    let clienteToUpdate = req.body;
    [ err, cliente ] = await to(Cliente.update(clienteToUpdate, { where: { id: req.params.id } }));
	if (err) return ReE(res, err, 422);
	return ReS(res, { 'MSG:': 'Atualizado com Sucesso cliente de ID: ' + req.params.id }, 201);

});


app.put('/visita-checkin/:id', async function(req, res) {
    let visitToUpdate = req.body;
    [ err, login ] = await to(Visita.update(visitToUpdate, { where: { id: req.params.id } }));
	if (err) return ReE(res, err, 422);
	return ReS(res, { 'MSG:': 'Atualizado com Sucesso'}, 201);

});

app.put('/visita-checkout/:id', async function(req, res) {
    let visitToUpdate = req.body;
    [ err, login ] = await to(Visita.update(visitToUpdate, { where: { id: req.params.id } }));
	if (err) return ReE(res, err, 422);
	return ReS(res, { 'MSG:': 'Atualizado com Sucesso'}, 201);

});

app.put('/armadilha/:id', async function(req, res) {
    let armadilhaData = req.body;
    [ err, login ] = await to(Armadilha.update(armadilhaData, { where: { id: req.params.id } }));
	if (err) return ReE(res, err, 422);
	return ReS(res, { 'MSG:': 'Atualizado com Sucesso'}, 201);

});


//add: POST
app.post("/login", async function(req, res){
    [ err, login ] = await to(Login.create(req.body));
	if (err) return ReE(res, err, 422);
    return ReS(res, { 'MSG:': 'Criado com Sucesso Login :' + login.email }, 201);
    
    // Login.create(req.body).then(function(){
    //     res.send("criado")
    // }).catch(function(erro){
    //     res.send("erro"+ erro)
    // })
});

app.post("/cliente", function(req, res){
    Cliente.create({
        nome: req.body.nome,
        telefone: req.body.telefone,
        endereco: req.body.endereco,
        max_armadilhas: req.body.max_armadilhas,
        id_login: req.body.id_login,
    }).then(function(){
        res.send("criado")
    }).catch(function(erro){
        res.send("erro"+ erro)
    })
});

app.post("/visita", function(req, res){
    Visita.create({
        data: req.body.data,//verificar a data, está pegando mm/dd/aaaa
        id_cliente: req.body.id_cliente,
    }).then(function(){
        res.send("criado")
    }).catch(function(erro){
        res.send("erro"+ erro)
    })
});

app.post("/armadilha", function(req, res){
    Armadilha.create({
        nome: req.body.nome,
        obs: req.body.obs,
        situacao: req.body.situacao,
    }).then(function(){
        res.send("criado")
    }).catch(function(erro){
        res.send("erro"+ erro)
    })
});

app.post("/armadilhas_clientes", function(req, res){
    Armadilhas_Clientes.create({
        id_armadilha: req.body.id_armadilha,
        id_cliente: req.body.id_cliente,
        situacao: req.body.situacao,
    }).then(function(){
        res.send("criado")
    }).catch(function(erro){
        res.send("erro"+ erro)
    })
});

app.post("/armadilhas-visita", function(req, res){
    Armadilhas_Visita.create({
        id_armadilha: req.body.id_armadilha,
        id_cliente: req.body.id_cliente,
        id_visita: req.body.id_visita,
        status_antigo: req.body.status_antigo,
        status_novo: req.body.status_novo,
        posicao: req.body.posicao,
        data: req.body.data,
    }).then(function(){
        res.send("criado")
    }).catch(function(erro){
        res.send("erro"+ erro)
    })
});




app.get("/ola/:nome", function(req, res){
    res.send("testsse "+ req.params.nome)
});

app.listen(8081, function(){
    console.log("servidor rodando na url localhost:8081")
});
//localhost:8081