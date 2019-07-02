import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dedetizadora'),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Fabiano Gadenz",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("fabianogadenz@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "F",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text('Armadilhas'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, '/armadilhas');
                },
              ),
              ListTile(
                title: Text('Clientes'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, '/clientes');
                },
              ),
              ListTile(
                title: Text('Visitas'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(context, '/visita');
                },
              ),
              Divider(
                height: 2.0,
              ),
              ListTile(
                title: Text('Sair'),
                trailing: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.pushNamed(context, '/');

                  // Update the state of the app
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              width: double.infinity,
              child: Center(
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.green,
                  size: 250.0,
                ),
              ),
            ),
            Text("Inserir dados pertinentes aqui.")
          ],
        ));
  }
}
