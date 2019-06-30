import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:desinsetizadora/blocs/armadilhaBloc.dart';

class newArmadilha extends StatefulWidget {
  @override
  _NewArmadilhaState createState() => _NewArmadilhaState();
}

class _NewArmadilhaState extends State<newArmadilha> {
  List _situacoes = ["Disponível", "Ocupado", "Danificado", "Manutenção Pendente", "Em Manutenção"];
  RestApi rest = RestApi();

  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = new TextEditingController();
  TextEditingController obsController = new TextEditingController();
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  String _situacaoArmadilha;
  String cliente_selecionado;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_situacoes);
    _situacaoArmadilha = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List listitems) {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in listitems) {
      items.add(new DropdownMenuItem(value: item, child: new Text(item)));
    }
    return items;
  }

  void changedDropDownItem(String selectedSituacao) {
    setState(() {
      _situacaoArmadilha = selectedSituacao;
    });
  }


  void changedDropDownCliente2(String selectedCliente) {
    setState(() {
      cliente_selecionado = selectedCliente;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Armadilha"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bloc.addSaveArmadilha();
          bloc.ligaArmadilhaCliente(cliente_selecionado);
          await Future.delayed(const Duration(milliseconds: 500));
          bloc.fetchAllArmadilha();
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
                TextField(
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
                TextField(
                  onChanged: bloc.updateObservacao,
                  controller: obsController,
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
                    hintText: "Observação",
                    hintStyle: const TextStyle(color: Colors.black, fontSize: 18.0),
                    contentPadding: const EdgeInsets.only(top: 30, right: 30.0, bottom: 30.0, left: 5.0),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: new Container(
                    decoration: new BoxDecoration(
                      border: new Border(
                        bottom: new BorderSide(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      value: _situacaoArmadilha,
                      items: _dropDownMenuItems,
                      //onChanged: bloc.updateStatus,
                      onChanged: changedDropDownItem,
                    ),
                  ),
                ),

                FutureBuilder<List<Cliente>>(
                    future: rest.fetchCliente(),
                    builder: (BuildContext context, AsyncSnapshot<List<Cliente>> snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      return new Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                            border: new Border(
                              bottom: new BorderSide(
                                color: Colors.green,
                              ),
                            ),
                          ),
                          child:
                          DropdownButton<String>(
                            isExpanded: true,
                            value: cliente_selecionado,
                            items: snapshot.data.map((cli) => DropdownMenuItem(child: Text(cli.nome), value: cli.id.toString(),)).toList(),

                            onChanged: changedDropDownCliente2,
                          ),


                        ),
                      );
                    }),
                SizedBox(height: 20.0),
                cliente_selecionado != null
                    ? Text("Cliente selecionado: " + cliente_selecionado )
                    : Text("No cliente selected"),
              ]
              ))
        ],
      )),
    );
  }
}
