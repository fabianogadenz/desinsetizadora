// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

List<Cliente> clienteFromJson(String str) => new List<Cliente>.from(json.decode(str).map((x) => Cliente.fromJson(x)));

String clienteToJson(List<Cliente> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Cliente {
  int id;
  String nome;
  String telefone;
  String endereco;
  int maxArmadilhas;
  dynamic idLogin;
  DateTime createdAt;
  DateTime updatedAt;

  Cliente({
    this.id,
    this.nome,
    this.telefone,
    this.endereco,
    this.maxArmadilhas,
    this.idLogin,
    this.createdAt,
    this.updatedAt,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => new Cliente(
    id: json["id"],
    nome: json["nome"],
    telefone: json["telefone"],
    endereco: json["endereco"],
    maxArmadilhas: json["max_armadilhas"],
    idLogin: json["id_login"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "telefone": telefone,
    "endereco": endereco,
    "max_armadilhas": maxArmadilhas,
    "id_login": idLogin,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
