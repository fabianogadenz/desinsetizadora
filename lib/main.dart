import 'package:desinsetizadora/screens/bipagem/atualiza_status.dart';
import 'package:desinsetizadora/screens/bipagem/bipagem_list.dart';
import 'package:desinsetizadora/screens/armadilhas/armadilhas_list.dart';
import 'package:desinsetizadora/screens/armadilhas/edit_armadilha.dart';
import 'package:desinsetizadora/screens/clientes/cliente_detail.dart';
import 'package:desinsetizadora/screens/clientes/clientes_list.dart';
import 'package:desinsetizadora/screens/clientes/new_cliente.dart';
import 'package:desinsetizadora/screens/home_screen.dart';
import 'package:desinsetizadora/screens/login/login_screen.dart';
import 'package:desinsetizadora/screens/visitas/add_visita_clients.dart';
//import 'package:desinsetizadora/screens/visitas/list_clients_screen.dart';
import 'package:desinsetizadora/screens/visitas/visita_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dedetizadora',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/armadilhas': (context) => ArmadilhasList(),
        '/novaArmadilha': (context) => EditArmadilha(),
        '/clientes': (context) => ClientesList(),
        '/novoCliente': (context) => NewCliente(),
        '/visita': (context) => CalendarViewApp(),
        '/addVisitaClients': (context) => addVisita(),
        '/clienteDetail': (context) => ClienteDetail(),
        '/bipagemList': (context) => BipagemList(),
        '/atualizaStatus': (context) => AtualizaStatus(),




      },
    );
  }
}
