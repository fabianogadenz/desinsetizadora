import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/visita.dart';
import 'package:desinsetizadora/screens/visitas/visita_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class VisitaList extends StatefulWidget {
  @override
  _VisitaListState createState() => _VisitaListState();
}

class _VisitaListState extends State<VisitaList> {
  DateTime data_escolhida = DateTime.now();
  RestApi rest = RestApi();

  var visitas = [
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),
  ];

  void handleNewDate(date) {
    print(date.toString());
    setState(() {
      data_escolhida = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addVisitaClients',
              arguments: data_escolhida.day.toString() + "/" + data_escolhida.month.toString() + "/" + data_escolhida.year.toString());
        },
        child: Icon(Icons.add),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Calendar(
                      onDateSelected: handleNewDate,
                      showCalendarPickerIcon: true,
                      //isExpandable: true,
                      showTodayAction: true,
                      showChevronsToChangeRange: true,
                      initialCalendarDateOverride: DateTime.now(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: FutureBuilder(
                      future: rest.buscaVisitasData(
                          data_escolhida.day.toString() + "/" + data_escolhida.month.toString() + "/" + data_escolhida.year.toString()),
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
                            return createListView(context,snapshot);
                          default:
                            return null;
                        }
                      }),
                ),
              ),
            ],
          )),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Visita> listVisita = snapshot.data;
    if (listVisita.toString() != "null" && listVisita.length.toString() != null && listVisita.length > 0) {
      return Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: listVisita.length,
                itemBuilder: (context, index) {
                  return VisitaListTile(listVisita[index]);
                }))
      ]);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 70.0,
                    color: Colors.black87,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text(
                      "Você não possui visitas neste dia",
                      style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }
  }


}
