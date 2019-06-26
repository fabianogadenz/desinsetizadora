import 'dart:convert';

import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:desinsetizadora/models/visita.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'package:flutter/foundation.dart';

class RestApi {
  Client clientHttp = Client();
  static final BASE_URL = "http://localhost:8081";
  static final CLIENTES_URL = BASE_URL + "/clientes";
  static final CLIENTE_URL = BASE_URL + "/cliente";
  static final ARMADILHAS_URL = BASE_URL + "/armadilhas";
  static final ADD_ARMADILHA_URL = BASE_URL + "/armadilha";
  static final VISITA_URL = BASE_URL + "/visita";
  static final VISITAS_URL = BASE_URL + "/visitas";

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
      throw Exception("Falha ao carregar.");
    }
  }



  Future addCliente(nome, telefone, endereco, maxArmadilhas) async{
    final response = await clientHttp.post(CLIENTE_URL, body: {
      "nome":nome.toString(),
      "telefone": telefone.toString(),
      "endereco": endereco.toString(),
      "max_armadilhas": maxArmadilhas.toString(),
      "id_login": 2.toString()
    });
    if(response.statusCode == 200){
      print("status code 200");
      return response;
    }else{
      throw Exception("Falha ao inserir Cliente.");
    }
  }

  Future addArmadilha(nome, observacao, status) async{
    print(nome.toString() + " "+ observacao.toString() + " " + status.toString());
    final response = await clientHttp.post(ADD_ARMADILHA_URL, body: {
      "nome":nome.toString(),
      "obs": observacao.toString(),
      "situacao": status.toString(),
    });
    if(response.statusCode == 200){
      print("status code 200");
      return response;
    }else{
      throw Exception("Falha ao inserir Armadilha.");
    }
  }

  Future<List<Visita>> buscaVisitasData(String data) async {
    List<Visita> listVisita = [];
    try {
      final response = await clientHttp.get(VISITAS_URL+ "/"+ data.replaceAll("/", "-"));
      var jsonData = json.decode(response.body);
      print(jsonData.toString());

      for (var u in jsonData) {

        listVisita.add(new Visita.fromJson(u));
      }
      return listVisita;
    } on Exception catch (_) {}
  }

  Future addVisita(Cliente cli, data) async{
    final response = await clientHttp.post(VISITA_URL, body: {
      "data":data,
      "id_cliente": cli.id.toString(),
    });
    if(response.statusCode == 200){
      print("status code 200");
      return response.statusCode;
    }else{
      throw Exception("Falha ao inserir visita.");
    }
  }

  Future<Visita> buscaVisitaId(int id) async {
    Visita vis;
    try {
      final response = await clientHttp.get(VISITA_URL+ "/"+ id.toString());
      var jsonData = json.decode(response.body);

      vis = Visita.fromJson(jsonData);
      return vis;
    } on Exception catch (_) {}
  }

}
