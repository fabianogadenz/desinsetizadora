import 'package:desinsetizadora/screens/bipagem/armadilha_bipagem_tile.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:flutter/material.dart';

class BipagemList extends StatefulWidget {
  @override
  _BipagemListState createState() => _BipagemListState();
}

class _BipagemListState extends State<BipagemList> {
  var armadilhas = [
    Armadilha(id: 1, nome: "armadilha 1", obs: "obs teste", situacao: "DISPONIVEL"),
    Armadilha(id: 2, nome: "armadilha 2", obs: "obs teste", situacao: "INDISPONIVEL"),
    Armadilha(id: 3, nome: "armadilha 3", obs: "obs teste", situacao: "DISPONIVEL"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Armadilhas da Visita"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Navigator.pushNamed(context, '/novaArmadilha');
        },
        child: Icon(Icons.aspect_ratio),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text("Armadilhas pendentes: 3"),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: armadilhas.length,
                    itemBuilder: (context, index) {
                      return ArmadilhaBipagemTile(armadilhas[index]);
                    }),
              ),
            ],
          )),
    );
  }
}
