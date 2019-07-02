import 'package:desinsetizadora/arguments/visitaArgument.dart';
import 'package:desinsetizadora/arguments/visitaStatusArgument.dart';
import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:flutter/material.dart';

class BipagemList extends StatefulWidget {
  final VisitaArgument visArgument;

  BipagemList({Key key, @required this.visArgument}) : super(key: key);
  @override
  _BipagemListState createState() => _BipagemListState();
}

class _BipagemListState extends State<BipagemList> {

  RestApi rest = new RestApi();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Armadilhas da Visita"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(widget.visArgument.idCliente.toString());
          //Navigator.pushNamed(context, '/novaArmadilha');
        },
        child: Icon(Icons.aspect_ratio),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text("Armadilhas pendentes: 3"),
              Expanded(
                child: FutureBuilder(
                  future: rest.buscaArmadilhasIdCliente(widget.visArgument.idCliente.toString()),
                    builder: (context, AsyncSnapshot<List<Armadilha>> snapshot) {
                      if (snapshot.hasData) {
                        return buildList(snapshot);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Center(child: CircularProgressIndicator());
                    }
                ),
              ),
            ],
          )),
    );
  }
  Widget buildList(AsyncSnapshot<List<Armadilha>> snapshot) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {

          return Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(snapshot.data[index].nome),
                  leading: Icon(Icons.aspect_ratio, size: 40,),
                  onTap: () {
                    VisitaStatusArgument visitaStatus = VisitaStatusArgument(
                        snapshot.data[index].id.toString(),
                        widget.visArgument.idCliente,
                        widget.visArgument.idVisita,
                        snapshot.data[index].situacao.toString(),
                        "",
                        DateTime.now().day.toString() + "/"+ DateTime.now().month.toString() + "/" + DateTime.now().year.toString(),
                        "location");
                    Navigator.pushNamed(context, '/atualizaStatus', arguments: visitaStatus);
                  },
                  subtitle: Text("${snapshot.data[index].situacao}"),
                ),
              )
            ],
          );

          //return ArmadilhaListTile(snapshot.data[index]);
        });
  }
}

