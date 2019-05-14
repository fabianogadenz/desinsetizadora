import 'package:flutter/material.dart';

class NewCliente extends StatefulWidget {
  @override
  _NewClienteState createState() => _NewClienteState();
}

class _NewClienteState extends State<NewCliente> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = new TextEditingController();
  TextEditingController telefoneController = new TextEditingController();
  TextEditingController enderecoController = new TextEditingController();
  TextEditingController max_armadilhasController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Cliente"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pop(context);

          },
          child: Icon(Icons.save),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          new Form(
              key: _formKey,
              child: new Column(children: <Widget>[
                campo(nomeController, "Nome", Icons.people, TextInputType.text),
                campo(telefoneController, "Telefone", Icons.phone, TextInputType.number),
                campo(enderecoController, "Endereço", Icons.location_on, TextInputType.text),
                campo(max_armadilhasController, "Máximo de Armadilhas", Icons.beenhere, TextInputType.text),



              ]))
        ],
      )),
    );
  }


  Widget campo(TextEditingController txtController, var hintText, IconData icon, TextInputType tipo,{var ativo = true}) {
    return new Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: new Container(
        decoration: new BoxDecoration(
          border: new Border(
            bottom: new BorderSide(
              color: Colors.green,
            ),
          ),
        ),
        child: new TextField(
          controller: txtController,
          keyboardType: tipo,
          enabled: ativo,
          //initialValue: "teste@hotmail.com",
          obscureText: false,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
          decoration: new InputDecoration(
            icon: new Icon(
              icon,
              color: Colors.green,
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black, fontSize: 18.0),
            contentPadding: const EdgeInsets.only(top: 30, right: 30.0, bottom: 30.0, left: 5.0),
          ),
        ),
      ),
    );
  }
}
