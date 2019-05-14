import 'package:flutter/material.dart';
import 'package:desinsetizadora/models/armadilha.dart';

class ArmadilhaBipagemTile extends StatelessWidget {

  final Armadilha armadilha;

  ArmadilhaBipagemTile(this.armadilha);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text(armadilha.nome),
            leading: Icon(Icons.aspect_ratio, size: 40,),
            onTap: () {
              Navigator.pushNamed(context, '/atualizaStatus');
            },
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Text("${armadilha.situacao}"),
          ),
        )
      ],
    );
  }
}
