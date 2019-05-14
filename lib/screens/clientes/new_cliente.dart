import 'package:desinsetizadora/blocs/clienteBloc.dart';
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
        onPressed: () async{
          bloc.addSaveCliente();
          await Future.delayed(const Duration(milliseconds: 500));
          bloc.fetchAllCliente();
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
                    new Container(
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
                          onChanged: bloc.updateNome,
                          controller: nomeController,
                          keyboardType: TextInputType.text,
                          enabled: true,
                          //initialValue: "teste@hotmail.com",
                          obscureText: false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            icon: new Icon(
                              Icons.people,
                              color: Colors.green,
                            ),
                            border: InputBorder.none,
                            hintText: "Nome",
                            hintStyle: const TextStyle(color: Colors.black, fontSize: 18.0),
                            contentPadding: const EdgeInsets.only(top: 30, right: 30.0, bottom: 30.0, left: 5.0),
                          ),
                        ),
                      ),
                    ),
                    new Container(
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
                          onChanged: bloc.updateTelefone,
                          controller: telefoneController,
                          keyboardType: TextInputType.number,
                          enabled: true,
                          obscureText: false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            icon: new Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                            border: InputBorder.none,
                            hintText: "Telefone",
                            hintStyle: const TextStyle(color: Colors.black, fontSize: 18.0),
                            contentPadding: const EdgeInsets.only(top: 30, right: 30.0, bottom: 30.0, left: 5.0),
                          ),
                        ),
                      ),
                    ),
                    new Container(
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
                          onChanged: bloc.updateEndereco,
                          controller: enderecoController,
                          keyboardType: TextInputType.text,
                          enabled: true,
                          //initialValue: "teste@hotmail.com",
                          obscureText: false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            icon: new Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                            border: InputBorder.none,
                            hintText: "Endereço",
                            hintStyle: const TextStyle(color: Colors.black, fontSize: 18.0),
                            contentPadding: const EdgeInsets.only(top: 30, right: 30.0, bottom: 30.0, left: 5.0),
                          ),
                        ),
                      ),
                    ),
                    new Container(
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
                          onChanged: bloc.updateMaxArmadilhas,
                          controller: max_armadilhasController,
                          keyboardType: TextInputType.text,
                          enabled: true,
                          //initialValue: "teste@hotmail.com",
                          obscureText: false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          decoration: new InputDecoration(
                            icon: new Icon(
                              Icons.beenhere,
                              color: Colors.green,
                            ),
                            border: InputBorder.none,
                            hintText: "Máximo de Armadilhas",
                            hintStyle: const TextStyle(color: Colors.black, fontSize: 18.0),
                            contentPadding: const EdgeInsets.only(top: 30, right: 30.0, bottom: 30.0, left: 5.0),
                          ),
                        ),
                      ),
                    )
                  ]))
            ],
          )),
    );
  }

  Widget campo(TextEditingController txtController, var hintText, IconData icon, TextInputType tipo, {var ativo = true}) {
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
