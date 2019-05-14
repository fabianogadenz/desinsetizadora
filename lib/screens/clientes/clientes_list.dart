import 'package:desinsetizadora/blocs/clienteBloc.dart';
import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:desinsetizadora/screens/clientes/components/clientes_list_tile.dart';
import 'package:flutter/material.dart';

class ClientesList extends StatefulWidget {
  @override
  _ClientesListState createState() => _ClientesListState();
}

class _ClientesListState extends State<ClientesList> {
  @override
  void initState() {
    bloc.fetchAllCliente();
    super.initState();
  }

//  @override
//  void dispose() {
//    bloc.dispose();
//    super.dispose();
//  }

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
      body:StreamBuilder(
          stream: bloc.allCliente,
          builder: (context, AsyncSnapshot<List<Cliente>> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }));

//      Container(
//          height: double.infinity,
//          width: double.infinity,
//          child: Column(
//            children: <Widget>[
//              Expanded(
//                child: ListView.builder(
//                    padding: EdgeInsets.only(top: 10.0),
//                    itemCount: clientes.length,
//                    itemBuilder: (context, index) {
//                      return ClientesListTile(clientes[index]);
//                    }),
//              ),
//            ],
//          )),
//    );
  }

  Widget buildList(AsyncSnapshot<List<Cliente>> snapshot) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ClientesListTile(snapshot.data[index]);
        });
  }
}
