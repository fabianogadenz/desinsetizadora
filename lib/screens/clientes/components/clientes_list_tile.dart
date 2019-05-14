import 'package:flutter/material.dart';
import 'package:desinsetizadora/models/cliente.dart';

class ClientesListTile extends StatelessWidget {

  final Cliente clientes;

  ClientesListTile(this.clientes);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text(clientes.nome),
            leading: Icon(Icons.people, size: 40,),
            onTap: () {

            },
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Text("${clientes.telefone}"),
          ),
        )
      ],
    );
  }
}
