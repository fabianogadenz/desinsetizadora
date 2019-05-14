import 'dart:async';
import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/models/cliente.dart';

class Repository{
  final restApiProvider = RestApi();

  Future<List<Armadilha>> fetchAllArmadilha() => restApiProvider.fetchArmadilha();
  Future<List<Cliente>> fetchAllCliente() => restApiProvider.fetchCliente();


}