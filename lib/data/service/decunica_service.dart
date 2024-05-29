import 'package:TrackingASL/data/decunica.dart';
import 'package:TrackingASL/data/provider/token_api.dart';
import 'package:TrackingASL/data/provider/user_api.dart';
import 'package:TrackingASL/data/token.dart';
import 'package:TrackingASL/data/provider/decunica_api.dart';
import 'package:TrackingASL/data/user.dart';
import 'package:TrackingASL/dto/filtro.dart';


class DecunicaService {

  final _decunica_api = DecunicaApi();
  final _token_api = TokenApi();
  final _user_api = UserApi();

  Future<List<Decunica>?> getAll(String longtail, Filtro filtro) async {
    if(longtail.isNotEmpty && longtail.length >= 2 || filtro.seleccionado) {
      return _decunica_api.getAll(longtail, filtro);
    }
    return [];
  }

  Future<Token?> login({String? username, String? password}) async {
    return _token_api.login(username: username, password: password);
  }

  Future<User?> user() async {
    return _user_api.user();
  }

}
