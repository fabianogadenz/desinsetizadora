import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/screens/armadilhas/components/armadilhas_list_tile.dart';
import 'package:flutter/material.dart';

class ArmadilhasList extends StatefulWidget {
  @override
  _ArmadilhasListState createState() => _ArmadilhasListState();
}

class _ArmadilhasListState extends State<ArmadilhasList> {
  var armadilhas = [
    Armadilha(id: 1, nome: "armadilha 1", obs: "obs teste", situacao: "DISPONIVEL"),
    Armadilha(id: 2, nome: "armadilha 2", obs: "obs teste", situacao: "INDISPONIVEL"),
    Armadilha(id: 3, nome: "armadilha 3", obs: "obs teste", situacao: "DISPONIVEL"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem de Armadilhas"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/novaArmadilha');
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
                    itemCount: armadilhas.length,
                    itemBuilder: (context, index) {
                      return ArmadilhaListTile(armadilhas[index]);
                    }),
              ),
            ],
          )),
    );
  }
}
