import 'package:desinsetizadora/blocs/armadilhaBloc.dart';
import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/screens/armadilhas/components/armadilhas_list_tile.dart';
import 'package:flutter/material.dart';

class ArmadilhasList extends StatefulWidget {
  @override
  _ArmadilhasListState createState() => _ArmadilhasListState();
}

class _ArmadilhasListState extends State<ArmadilhasList> {
  RestApi api = new RestApi();
  var armadilhas = [
    Armadilha(id: 1, nome: "armadilha 1", obs: "obs teste", situacao: "DISPONIVEL"),
    Armadilha(id: 2, nome: "armadilha 2", obs: "obs teste", situacao: "INDISPONIVEL"),
    Armadilha(id: 3, nome: "armadilha 3", obs: "obs teste", situacao: "DISPONIVEL"),
  ];

  @override
  void initState() {
    bloc.fetchAllArmadilha();
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
          title: Text("Listagem de Armadilhas"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/novaArmadilha');
          },
          child: Icon(Icons.add),
        ),
        body: StreamBuilder(
            stream: bloc.allArmadilha,
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
          return ArmadilhaListTile(snapshot.data[index]);
        });
  }
}
