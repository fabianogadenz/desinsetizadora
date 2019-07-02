import 'package:desinsetizadora/blocs/armadilhaBloc.dart';
import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/screens/armadilhas/components/armadilhas_list_tile.dart';
import 'package:flutter/material.dart';

class ArmadilhasClientesList extends StatefulWidget {
  final String id_cliente;

  ArmadilhasClientesList({Key key, @required this.id_cliente}) : super(key: key);

  @override
  _ArmadilhasClientesListState createState() => _ArmadilhasClientesListState();
}

class _ArmadilhasClientesListState extends State<ArmadilhasClientesList> {
  RestApi rest = new RestApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listagem de Armadilhas do Cliente"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: rest.buscaArmadilhasIdCliente(widget.id_cliente),
            builder: (context, AsyncSnapshot<List<Armadilha>> snapshot) {
              if (snapshot.hasData) {
                return buildList(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget buildList(AsyncSnapshot<List<Armadilha>> snapshot) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {

          return Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(snapshot.data[index].nome),
                  leading: Icon(Icons.aspect_ratio, size: 40,),
                  subtitle: Text("${snapshot.data[index].situacao}"),
                ),
              )
            ],
          );

          //return ArmadilhaListTile(snapshot.data[index]);
        });
  }
}
