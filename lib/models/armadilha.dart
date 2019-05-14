// To parse this JSON data, do
//
//     final armadilha = armadilhaFromJson(jsonString);

import 'dart:convert';

List<Armadilha> armadilhaFromJson(String str) => new List<Armadilha>.from(json.decode(str).map((x) => Armadilha.fromJson(x)));

String armadilhaToJson(List<Armadilha> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Armadilha {
  int id;
  String nome;
  String obs;
  String situacao;
  DateTime createdAt;
  DateTime updatedAt;

  Armadilha({
    this.id,
    this.nome,
    this.obs,
    this.situacao,
    this.createdAt,
    this.updatedAt,
  });

  factory Armadilha.fromJson(Map<String, dynamic> json) => new Armadilha(
    id: json["id"],
    nome: json["nome"],
    obs: json["obs"] == null ? null : json["obs"],
    situacao: json["situacao"] == null ? null : json["situacao"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "obs": obs == null ? null : obs,
    "situacao": situacao == null ? null : situacao,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
