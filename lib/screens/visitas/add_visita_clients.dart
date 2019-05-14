import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:desinsetizadora/utils/utils.dart';
import 'package:flutter/material.dart';

class addVisita extends StatefulWidget {
//  final DateTime data;
//  addVisita(this.data);

  @override
  _addVisitaState createState() => _addVisitaState();
}

class _addVisitaState extends State<addVisita> {
  final myController = TextEditingController();
  RestApi rest = new RestApi();
  List<Cliente> listCli, listCliFiltrados;
  int quantidadeCli = 0;
  int t =0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Criando visita dia 22/22/2222"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/ClienteDetail');
      },
      child: Text("a"),),
      body: Column(
        children: <Widget>[
          TextField(
            controller: myController,
            decoration: InputDecoration(
                hintText: "Digite o nome do cliente",
                prefixIcon: Icon(Icons.search)
            ),
            onChanged: (value){
              setState(() {
                listCliFiltrados = Utils.clientFilter(value, listCli);
                quantidadeCli = listCliFiltrados.length;
              });

            },
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: load(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    default:
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.only(top: 10.0),
                                itemCount: quantidadeCli,
                                itemBuilder: (context, index) {
                                  return WidgetTeste(listCliFiltrados[index]);
                                }),
                          )
                        ],
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  load() async {
    if  (t==0){
      listCli = listCliFiltrados = await rest.buscaClientes();
      quantidadeCli = await listCliFiltrados.length;
      t++;
    }

  }

  Widget WidgetTeste(Cliente Cli) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text(Cli.id.toString() + " - " + Cli.nome),
            subtitle: Text(Cli.endereco + Cli.telefone),
            leading: Icon(Icons.person),
            onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => cliente_screen(widget.data, Cli.id)));
            },
          ),
        )
      ],
    );
  }
}
