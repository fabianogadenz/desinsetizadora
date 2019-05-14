import 'package:desinsetizadora/models/armadilha.dart';

class Armadilhas {
  final List<Armadilha> armadilhas;

  Armadilhas(this.armadilhas);

  Armadilhas.fromJson(Map<String, dynamic> json)
      : armadilhas =
  (json["results"] as List).map((i) => new Armadilha.fromJson(i)).toList();


}