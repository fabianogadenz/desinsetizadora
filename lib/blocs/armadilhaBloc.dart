import 'package:desinsetizadora/models/armadilha.dart';
import 'package:desinsetizadora/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ArmadilhaBloc{
  final _repository = Repository();
  final _armadilhaFetcher = PublishSubject<List<Armadilha>>();

  Observable<List<Armadilha>> get allArmadilha => _armadilhaFetcher.stream;

  fetchAllArmadilha() async{
    List<Armadilha> armadilha = await _repository.fetchAllArmadilha();
    _armadilhaFetcher.sink.add(armadilha);
  }

  dispose(){
    _armadilhaFetcher.close();
  }
}

final bloc = ArmadilhaBloc();