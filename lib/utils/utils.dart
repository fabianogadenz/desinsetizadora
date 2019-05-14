
import 'package:desinsetizadora/models/cliente.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatDtFromString(String data) {
    if (data.toString() == "null")
      return "";
    var dataAtualizada = data.split("-");
    return (dataAtualizada[2] +
        "/" +
        dataAtualizada[1] +
        "/" +
        dataAtualizada[0])
        .toString();
  }

  static String formatDtFromDateTime(DateTime data) {
    if (data.toString() == "null")
      return "";
    return "${DateFormat("dd/MM/yyyy").format(data)}";
  }

  static String formatDateTime(String data) {
    if (data.toString() == "null")
      return "";
    var dtsplit = data.split(" ");
    var hora = dtsplit[1].split('.');
    var dataAtualizada = dtsplit[0].split("-");
    return "${dataAtualizada[2]}/${dataAtualizada[1]}/${dataAtualizada[0]} ${hora[0]}".toString();
  }


  static List<Cliente> clientFilter(filter, list) {
    List<Cliente> filtrados = [];
    for (Cliente l in list) {
      if (l.nome.toLowerCase().trim().replaceAll(" ", "").contains(filter.toString().toLowerCase().trim().replaceAll(" ", ""))) {
        filtrados.add(l);
      }
      else if (l.nome.contains(filter.toString()))
        filtrados.add(l);
    }
    return filtrados;
  }
}