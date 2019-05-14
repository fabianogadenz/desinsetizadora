class Armadilha{
  int id;
  String nome;
  String obs;
  String situacao;

  Armadilha({this.id, this.nome, this.obs, this.situacao});

  Armadilha.fromJson(Map<String, dynamic> json)
      : id = json["id"];
//        nome = json["nome"],
//        obs = json["obs"],
//        situacao = json["situacao"];
}