import 'dart:convert';

import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'package:flutter/foundation.dart';

class RestApi {
  Client clientHttp = Client();
  static final BASE_URL = "http://localhost:8081";
  static final CLIENTES_URL = BASE_URL + "/clientes";
  static final ARMADILHAS_URL = BASE_URL + "/armadilhas";

  Future<List<Cliente>> buscaClientes() async {
    List<Cliente> listCli = [];
    try {
      final response = await clientHttp.get(CLIENTES_URL);
      var jsonData = json.decode(response.body);
      print(jsonData.toString());

      for (var u in jsonData) {
        listCli.add(new Cliente.fromJson(u));
      }
      return listCli;
    } on Exception catch (_) {}
  }

//  Future<List<Armadilha>> buscaArmadilhas() async {
//    List<Armadilha> listArmadilhas = [];
//    try {
//      http.Response response = await http.get(ARMADILHAS_URL);
//      var jsonData = json.decode(response.body);
//      print(jsonData.toString());
//
//      for (var u in jsonData) {
//        listArmadilhas.add(new Armadilha.fromJson(u));
//      }
//      return listArmadilhas;
//    } on Exception catch (_) {}
//  }

  Future<List<Armadilha>> fetchArmadilha() async {
    print('entrou no fetch armadilha do http');

    final response = await clientHttp.get(ARMADILHAS_URL);
    if (response.statusCode == 200) {
      return compute(armadilhaFromJson, response.body);
    } else {
      throw Exception("Falha ao carregar");
    }
  }

  Future<List<Cliente>> fetchCliente() async {
    print('entrou no fetch cliente do http');

    final response = await clientHttp.get(CLIENTES_URL);
    if (response.statusCode == 200) {
      return compute(clienteFromJson, response.body);
    } else {
      throw Exception("Falha ao carregar");
    }
  }
}
