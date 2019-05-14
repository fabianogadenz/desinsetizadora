class Cliente{
  int id;
  String nome;
  String telefone;
  String endereco;
  int max_armadilhas;
  int id_responsavel;

  Cliente({this.id, this.nome, this.telefone, this.endereco, this.max_armadilhas, this.id_responsavel});

  factory Cliente.fromJson(Map<String, dynamic> parsedJson) {

    return Cliente(
        id: parsedJson["id"] as int,
        nome: parsedJson["nome"] as String,
        telefone: parsedJson["telefone"] as String,
        endereco: parsedJson["endereco"] as String,
        max_armadilhas: parsedJson["max_armadilhas"] as int,
        id_responsavel: parsedJson["id_login"] as int);
  }


}