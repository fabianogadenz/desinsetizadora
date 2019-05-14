import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:desinsetizadora/screens/armadilhas/components/armadilhas_list_tile.dart';
import 'package:desinsetizadora/screens/clientes/components/clientes_list_tile.dart';
import 'package:flutter/material.dart';

class ClientesList extends StatefulWidget {
  @override
  _ClientesListState createState() => _ClientesListState();
}

class _ClientesListState extends State<ClientesList> {
  var clientes = [
    Cliente(id: 1, nome: "cliente 1", endereco: "endereco teste", telefone: "991025167", max_armadilhas: 12),
    Cliente(id: 2, nome: "cliente 2", endereco: "endereco teste", telefone: "991025167", max_armadilhas: 22),
    Cliente(id: 3, nome: "cliente 3", endereco: "endereco teste", telefone: "991025167", max_armadilhas: 32),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem de Clientes"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/novoCliente');
        },
        child: Icon(Icons.add),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: clientes.length,
                    itemBuilder: (context, index) {
                      return ClientesListTile(clientes[index]);
                    }),
              ),
            ],
          )),
    );
  }
}
