import 'dart:convert';

import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/models/armadilhas.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:http/http.dart' as http;

class RestApi {
  static final BASE_URL = "http://localhost:8081";
  static final CLIENTES_URL = BASE_URL+ "/clientes";


  Future<List<Cliente>> buscaClientes() async {
    List<Cliente> listCli = [];
    try {
      http.Response response = await http.get(CLIENTES_URL);
      var jsonData = json.decode(response.body);
      print(jsonData.toString());

      for (var u in jsonData) {
        listCli.add(new Cliente.fromJson(u));
      }
      return listCli;
    } on Exception catch (_) {}
  }
}



