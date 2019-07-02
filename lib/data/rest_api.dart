import 'dart:convert';

import 'package:desinsetizadora/arguments/visitaStatusArgument.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/models/cliente.dart';
import 'package:desinsetizadora/models/cliente_visita.dart';
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
  static final VISITS_CLIENTE_INFO_URL = BASE_URL + "/visita_cliente_info";
  static final LAST_ARMADILHA = BASE_URL + "/last_armadilha";
  static final ARMADILHAS_CLIENTES = BASE_URL + "/armadilhas_clientes";
  static final VISITA_CHECKIN = BASE_URL + "/visita-checkin";
  static final VISITA_CHECKOUT = BASE_URL + "/visita-checkout";
  static final ARMADILHAS_VISITAS = BASE_URL + "/armadilhas-visita";


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
      "situacao": "DISPONIVEL",
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

  Future<ClienteVisita> buscaVisitaClienteInfo(int id) async {
    ClienteVisita _cliVisInfo;
    try {
      final response = await clientHttp.get(VISITS_CLIENTE_INFO_URL+ "/"+ id.toString());
      var jsonData = json.decode(response.body);

      print(jsonData.toString());
      _cliVisInfo = ClienteVisita.fromJson(jsonData[0]);
      print(_cliVisInfo.id.toString());
      return _cliVisInfo;
    } on Exception catch (_) {}
  }

  Future<int> buscaIdUltimaArmadilha() async {
    try {
      final response = await clientHttp.get(LAST_ARMADILHA);
      var jsonData = json.decode(response.body);
      return int.parse(jsonData[0]["ultima_armadilha"].toString());
    } on Exception catch (_) {}
  }

  Future addArmadilhasClientes(id_armadilha, id_cliente, situacao) async{
    final response = await clientHttp.post(ARMADILHAS_CLIENTES, body: {
      "id_armadilha":id_armadilha.toString(),
      "id_cliente": id_cliente.toString(),
      "situacao": situacao.toString(),
    });
    if(response.statusCode == 200){
      print("status code 200");
      return response;
    }else{
      throw Exception("Falha ao inserir DADOS.");
    }
  }

  Future<List<Armadilha>> buscaArmadilhasIdCliente(String idCliente) async {
    print(ARMADILHAS_CLIENTES+ "/"+ idCliente);
    List<Armadilha> listArmadilhas = [];
    try {
      final response = await clientHttp.get(ARMADILHAS_CLIENTES+ "/"+ idCliente);
      var jsonData = json.decode(response.body);
      for (var u in jsonData)
        listArmadilhas.add(new Armadilha.fromJson(u));
      return listArmadilhas;
    } on Exception catch (_) {}
  }
  Future checkinVisita(int id, String data) async{
    final response = await clientHttp.put(VISITA_CHECKIN+ "/"+ id.toString(), body: {
      "hora_inicio":data,
    });
    if(response.statusCode == 200){
      print("status code 200");
    }else{
      throw Exception("Falha ao inserir Cliente.");

    }
  }
  Future checkOutVisita(int id, String data) async{
    final response = await clientHttp.put(VISITA_CHECKOUT+ "/"+ id.toString(), body: {
      "hora_fim":data,
    });
    if(response.statusCode == 200){
      print("status code 200");
    }else{
      throw Exception("Falha ao inserir Cliente.");

    }
  }

  Future addArmadilhaClienteCheck(VisitaStatusArgument visData) async{
    print("oioi");
    final response = await clientHttp.post(ARMADILHAS_VISITAS, body: {
      "id_armadilha":visData.idArmadilha.toString(),
      "id_cliente": visData.idCliente.toString(),
      "id_visita": visData.idVisita.toString(),
      "status_antigo": visData.status_antigo.toString(),
      "status_novo": visData.status_novo.toString(),
      "posicao": visData.posicao.toString(),
      "data": visData.data.toString()
    });
    final response2 = await clientHttp.put(ADD_ARMADILHA_URL+ "/"+ visData.idArmadilha.toString(), body: {
      "situacao":visData.status_novo.toString(),
    });

//    if(response.statusCode == 200 && response2.statusCode == 200){
    if( response.statusCode == 200){
      print("testestatus code 200");
      return response;
    }else{
      throw Exception("Falha ao inserir.");
    }
  }




}
