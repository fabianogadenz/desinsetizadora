import 'package:desinsetizadora/models/visita.dart';
import 'package:desinsetizadora/screens/visitas/visita/visita_screen.dart';
import 'package:flutter/material.dart';

class VisitaListTile extends StatelessWidget {
  final Visita visita;

  VisitaListTile(this.visita);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text(visita.id_cliente.toString()),
            leading: Icon(Icons.people, size: 40,),
            onTap: () {
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new VisitaScreen(1)));
            },
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Text("${visita.data}"),
          ),
        )
      ],
    );
  }
}
