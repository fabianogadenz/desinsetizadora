import 'package:desinsetizadora/models/cliente.dart';
import 'package:desinsetizadora/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ClienteBloc{
  final _repository = Repository();
  final _clienteFetcher = PublishSubject<List<Cliente>>();

  Observable<List<Cliente>> get allCliente => _clienteFetcher.stream;

  fetchAllCliente() async{
    List<Cliente> armadilha = await _repository.fetchAllCliente();
    _clienteFetcher.sink.add(armadilha);
  }

  dispose(){
    _clienteFetcher.close();
  }
}

final bloc = ClienteBloc();