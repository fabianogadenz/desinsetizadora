import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/models/visita.dart';
import 'package:desinsetizadora/screens/armadilhas/components/armadilhas_list_tile.dart';
import 'package:flutter/material.dart';

class VisitaScreen extends StatefulWidget {
  int _codigoVisita;

  VisitaScreen(this._codigoVisita);

  @override
  _VisitaScreenState createState() => _VisitaScreenState();
}

class _VisitaScreenState extends State<VisitaScreen> {
  RestApi rest = new RestApi();
  var armadilhas = [
    Armadilha(id: 1, nome: "armadilha 1", obs: "obs teste", situacao: "DISPONIVEL"),
    Armadilha(id: 2, nome: "armadilha 2", obs: "obs teste", situacao: "INDISPONIVEL"),
    Armadilha(id: 3, nome: "armadilha 3", obs: "obs teste", situacao: "DISPONIVEL"),
  ];
  var localizacao;
  var dateTimeCheckin;
  var dateTimeCheckOut;
  var latitude;
  var longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text("Detalhe da Visita: " + widget._codigoVisita.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/bipagemList');
        },
        child: Text("Iniciar"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 270.0,
                  width: double.infinity,
                  color: Colors.green,
                ),
                Positioned(
                  top: 40.0,
                  right: 120.0,
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(200.0), color: Color.fromRGBO(255, 255, 255, 0.1)),
                  ),
                ),
                Positioned(
                  top: 90.0,
                  left: 180.0,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(200.0), color: Color.fromRGBO(255, 255, 255, 0.1)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 180.0,
                        width: 180.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://assetsv2.fiverrcdn.com/assets/v2_globals/fiverr-logo-new-green-64920d4e75a1e04f4fc7988365357c16.png'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 1.5, color: Colors.grey),
                          color: Color.fromRGBO(250, 250, 250, 1.0),
                          borderRadius: const BorderRadius.all(const Radius.circular(100.0)),
                        ),
                      ),
                    ),
                    FutureBuilder(
                        future: rest.buscaVisitaId(widget._codigoVisita),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            case ConnectionState.done:
                              return conteudoVisita(snapshot.data);
                            default:
                              return null;
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/armadilhas');
                          },
                          child: Text("Ver Armadilhas Alocadas"),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget LinhaTabela(String nome, String conteudo, bool zebrado) {
    int zebradoCor = 255;
    if (zebrado) zebradoCor = 240;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
              color: Color.fromRGBO(zebradoCor, zebradoCor, zebradoCor, 1.0),
              borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  nome,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    conteudo,
                    style: TextStyle(fontSize: 15.0),
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget conteudoVisita(Visita vis) {
    print(vis.id);
    return Container(
        margin: EdgeInsets.all(5.0),
        color: Colors.white,
        child: ExpansionTile(
            title: Text(
              "Detalhes da visita",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.grey[700]),
            ),
            leading: Icon(
              Icons.description,
              color: Colors.grey,
            ),
            initiallyExpanded: true,
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                LinhaTabela("Cliente", vis.id_cliente.toString(), true),
                LinhaTabela("Telefone", "teste", false),
                LinhaTabela("Max armadilhas", "teste", true),
                LinhaTabela("Armadilhas alocadas", "teste", false),
                LinhaTabela("Hora início", vis.hora_inicio.toString(), true),
                LinhaTabela("Hora fim", vis.hora_fim.toString(), false),
              ])
            ]));
  }
}
