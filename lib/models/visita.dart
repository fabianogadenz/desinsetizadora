class Visita{
  int id;
  String data;
  int id_cliente;
  //Cliente cliente;
  String hora_inicio;
  String hora_fim;
  String obs;
  DateTime createdAt;
  DateTime updatedAt;


  Visita(
  {this.id,
  this.data,
  this.id_cliente,
  this.hora_inicio,
  this.hora_fim,
  this.obs,
  this.createdAt,
  this.updatedAt});


  Visita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    id_cliente = json['id_cliente'];
    hora_inicio = json['hora_inicio'];
    hora_fim = json['hora_fim'];
    obs = json['obs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['id_cliente'] = this.id_cliente;
    data['hora_inicio'] = this.hora_inicio;
    data['hora_fim'] = this.hora_fim;
    data['obs'] = this.obs;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}