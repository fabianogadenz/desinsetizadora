import 'package:desinsetizadora/arguments/clienteArgument.dart';
import 'package:desinsetizadora/arguments/visitaStatusArgument.dart';
import 'package:desinsetizadora/screens/armadilhas/armadilhas_clientes_list.dart';
import 'package:desinsetizadora/screens/armadilhas/armadilhas_list.dart';
import 'package:desinsetizadora/screens/armadilhas/edit_armadilha.dart';
import 'package:desinsetizadora/screens/armadilhas/new_armadilha.dart';
import 'package:desinsetizadora/screens/bipagem/atualiza_status.dart';
import 'package:desinsetizadora/screens/bipagem/bipagem_list.dart';
import 'package:desinsetizadora/screens/clientes/cliente_detail.dart';
import 'package:desinsetizadora/screens/clientes/clientes_list.dart';
import 'package:desinsetizadora/screens/clientes/new_cliente.dart';
import 'package:desinsetizadora/screens/home_screen.dart';
import 'package:desinsetizadora/screens/login/login_screen.dart';
import 'package:desinsetizadora/screens/visitas/add_visita_clients.dart';
import 'package:desinsetizadora/screens/visitas/visita_list.dart';
import 'package:flutter/material.dart';
import 'package:desinsetizadora/arguments/visitaArgument.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/armadilhas-clientes':
        if (args is String){
          return MaterialPageRoute(
            builder: (_) => ArmadilhasClientesList(
              id_cliente:args,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => ArmadilhasClientesList());
      case '/armadilhas':
        return MaterialPageRoute(builder: (_) => ArmadilhasList());
      case '/editArmadilha':
        return MaterialPageRoute(builder: (_) => EditArmadilha());
      case '/novaArmadilha':
        return MaterialPageRoute(builder: (_) => newArmadilha());
      case '/clientes':
        return MaterialPageRoute(builder: (_) => ClientesList());
      case '/novoCliente':
        return MaterialPageRoute(builder: (_) => NewCliente());
      case '/visita':
        return MaterialPageRoute(builder: (_) => VisitaList());
      case '/clienteDetail':
        if (args is ClienteArgument){
          return MaterialPageRoute(
            builder: (_) => ClienteDetail(
              cliargument:args,
            ),
          );
        }
        return _errorRoute();
        //return MaterialPageRoute(builder: (_) => ClienteDetail());
      case '/bipagemList':
        if (args is VisitaArgument){
          return MaterialPageRoute(
            builder: (_) => BipagemList(
              visArgument:args,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => BipagemList());
      case '/atualizaStatus':
        if (args is VisitaStatusArgument){
          return MaterialPageRoute(
            builder: (_) => AtualizaStatus(
              visArgument:args,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => AtualizaStatus());
      case '/addVisitaClients':
        if (args is String){
          return MaterialPageRoute(
              builder: (_) => addVisita(
                data:args,
              ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();

    }
  }


  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text('Erro'),
          centerTitle: true,
        ),
        body: Center(
          child: Text("err"),
        ),
      );
    });
  }
}
