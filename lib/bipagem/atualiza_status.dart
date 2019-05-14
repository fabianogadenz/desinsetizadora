import 'package:flutter/material.dart';

class AtualizaStatus extends StatefulWidget {
  @override
  _AtualizaStatusState createState() => _AtualizaStatusState();
}

class _AtualizaStatusState extends State<AtualizaStatus> {
  List _situacoes = ["Disponível", "Ocupado", "Danificado", "Manutenção Pendente", "Em Manutenção"];


  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  String _situacaoArmadilha;

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Armadilha"),
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
              Text("TODO: dados pertinentes para a bipagem"),
              new Form(
                  key: _formKey,
                  child: new Column(children: <Widget>[
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


                  ]))
            ],
          )),
    );
  }
}
