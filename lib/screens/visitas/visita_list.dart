import 'package:desinsetizadora/models/visita.dart';
import 'package:desinsetizadora/screens/visitas/visita_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';


class CalendarViewApp extends StatelessWidget {
  var visitas = [
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),
    Visita(id: 1, data: "01/01/2019", hora_fim: "01/01/2019", hora_inicio: "01/01/2019", id_cliente: 2),

    ];
  void handleNewDate(date) {
    print("handleNewDate ${date}");
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        title: Text("Visitas"),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, '/addVisitaClients');

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
                        initialCalendarDateOverride: DateTime.now(),
                        onSelectedRangeChange: (range) =>
                            print("Range is ${range.item1}, ${range.item2}"),
                       // isExpandable: true,
                      ),


                    ],
                  ),
                ),
              Expanded(
                child: ListView.builder(
                    itemCount: visitas.length,
                    itemBuilder: (context, index) {
                      return VisitaListTile(visitas[index]);
                    }),
              ),
            ],
          )),
    );
  }
}