import 'package:desinsetizadora/models/cliente.dart';
import 'package:desinsetizadora/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ClienteBloc{
  final _repository = Repository();
  final _clienteFetcher = PublishSubject<List<Cliente>>();
  final _nome = BehaviorSubject<String>();
  final _telefone = BehaviorSubject<String>();
  final _endereco = BehaviorSubject<String>();
  final _maxArmadilhas = BehaviorSubject<String>();

  Observable<List<Cliente>> get allCliente => _clienteFetcher.stream;
  Function(String) get updateNome => _nome.sink.add;
  Function(String) get updateTelefone => _telefone.sink.add;
  Function(String) get updateEndereco => _endereco.sink.add;
  Function(String) get updateMaxArmadilhas => _maxArmadilhas.sink.add;

  fetchAllCliente() async{
    List<Cliente> armadilha = await _repository.fetchAllCliente();
    _clienteFetcher.sink.add(armadilha);
  }

  addSaveCliente(){
    print("save cliente" + _nome.value);
    _repository.addSaveCliente(_nome.value, _telefone.value, _endereco.value, _maxArmadilhas.value);
  }


  dispose(){
    _clienteFetcher.close();
    _nome.close();
    _telefone.close();
    _endereco.close();
  }
}

final bloc = ClienteBloc();