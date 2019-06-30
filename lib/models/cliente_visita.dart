class ClienteVisita {
  int id;
  String nome;
  String telefone;
  String endereco;
  int maxArmadilhas;
  int idLogin;
  String createdAt;
  String updatedAt;
  String data;
  int idCliente;
  String horaInicio;
  String horaFim;
  String obs;

  ClienteVisita(
      {this.id,
        this.nome,
        this.telefone,
        this.endereco,
        this.maxArmadilhas,
        this.idLogin,
        this.createdAt,
        this.updatedAt,
        this.data,
        this.idCliente,
        this.horaInicio,
        this.horaFim,
        this.obs});

  ClienteVisita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    telefone = json['telefone'];
    endereco = json['endereco'];
    maxArmadilhas = json['max_armadilhas'];
    idLogin = json['id_login'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    data = json['data'];
    idCliente = json['id_cliente'];
    horaInicio = json['hora_inicio'];
    horaFim = json['hora_fim'];
    obs = json['obs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['endereco'] = this.endereco;
    data['max_armadilhas'] = this.maxArmadilhas;
    data['id_login'] = this.idLogin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['data'] = this.data;
    data['id_cliente'] = this.idCliente;
    data['hora_inicio'] = this.horaInicio;
    data['hora_fim'] = this.horaFim;
    data['obs'] = this.obs;
    return data;
  }
}