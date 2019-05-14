import 'package:flutter/material.dart';

class EditArmadilha extends StatefulWidget {
  @override
  _EditArmadilhaState createState() => _EditArmadilhaState();
}

class _EditArmadilhaState extends State<EditArmadilha> {
  List _situacoes = ["Disponível", "Ocupado", "Danificado", "Manutenção Pendente", "Em Manutenção"];
  List _clientes = ["Cliente 1", "Cliente 2", "Cliente 3", "Cliente 4", "Cliente 5"];

  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = new TextEditingController();
  TextEditingController obsController = new TextEditingController();
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<DropdownMenuItem<String>> _dropDownClientes;

  String _situacaoArmadilha;
  String _cliente;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_situacoes);
    _dropDownClientes = buildAndGetDropDownMenuItems(_clientes);
    _situacaoArmadilha = _dropDownMenuItems[0].value;
    _cliente = _dropDownClientes[0].value;
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
  void changedDropDownCliente(String selectedSituacao) {
    setState(() {
      _cliente = selectedSituacao;
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
              onPressed: () {
              })
        ],
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
                campo(nomeController, "Nome", Icons.center_focus_strong, TextInputType.text),
                campo(obsController, "Observação", Icons.edit, TextInputType.text),
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
                      onChanged: changedDropDownItem,
                    ),
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
                      value: _cliente,
                      items: _dropDownClientes,
                      onChanged: changedDropDownCliente,
                    ),
                  ),
                ),
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
