import 'package:desinsetizadora/data/rest_api.dart';
import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ArmadilhaBloc{
  final _repository = Repository();
  final _armadilhaFetcher = BehaviorSubject<List<Armadilha>>();
  final _nome= BehaviorSubject<String>();
  final _observacao = BehaviorSubject<String>();
  final _status = BehaviorSubject<String>();
//  final _cliente = BehaviorSubject<String>();
  final restApiProvider = RestApi();

  Observable<List<Armadilha>> get allArmadilhas => _armadilhaFetcher.stream;
  Function(String) get updateNome => _nome.sink.add;
  Function(String) get updateObservacao => _observacao.sink.add;
  Function(String) get updateStatus => _status.sink.add;
//  Function(String) get updateCliente => _cliente.sink.add;

  fetchAllArmadilha() async{
    List<Armadilha> armadilha = await _repository.fetchAllArmadilha();
    _armadilhaFetcher.sink.add(armadilha);
  }

  addSaveArmadilha(){
    print("save armadilha" + _nome.value);
    _repository.addSaveArmadilha(_nome.value, _observacao.value, _status.value);
  }

  ligaArmadilhaCliente(String idCliente){
    print("id cliente" + idCliente);
    if(idCliente != null)
      restApiProvider.buscaIdUltimaArmadilha().then((id){
        print(id.toString());
        Future.delayed(Duration(milliseconds: 500));
        int idArmadilha = int.parse(id.toString());
          restApiProvider.addArmadilhasClientes(idArmadilha, idCliente, "DISPONIVEL");
      });
  }

  dispose(){
    _armadilhaFetcher.close();
  }
}

final bloc = ArmadilhaBloc();