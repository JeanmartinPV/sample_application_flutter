import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jpv_flutter/src/UI/person_search/models/dni_response.dart';

class Services with ChangeNotifier {
  final String _url = 'dni.optimizeperu.com';
  //Late para decir que este valor será inicializado despues
  DniResponse persona = DniResponse();
  String _dni = '';
  String get dni => _dni;

  set dni(String valor) {
    if (valor == 'clean') {
      _dni = '';
      notifyListeners();
    } else {
      if (_dni.length < 8) {
        _dni = valor;
        notifyListeners();
      }
    }
  }

  borrar() {
    if (_dni.isNotEmpty) {
      _dni = dni.substring(0, _dni.length - 1);
      notifyListeners();
    }
  }

  //variable para decir que esta cargando
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool valor) {
    _isLoading = valor;
    notifyListeners();
  }

  bool _mostrar = false;
  bool _efectocircular = true;

  bool get efectocircular => _efectocircular;

  void efectoCircular(bool valor) {
    _efectocircular = valor;
    notifyListeners();
  }

  bool get mostrar => _mostrar;
  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }

  getResult(String valor) async {
    if (valor.length == 8) {
      _isLoading = true;
      DniResponse dniRespuesta = DniResponse();
      loading(false);
      final uri = Uri.https(_url, '/api/persons/$valor');
      if (valor == '03032021') {
        dniRespuesta = DniResponse(
            name: 'Dash', firstName: 'Nilay', lastName: 'Yener', dni: valor);
      } else {
        final respuestaDni = await http.get(uri);
        if (respuestaDni.statusCode == 200) {
          dniRespuesta = dniResponseFromJson(respuestaDni.body);
        }
      }
      loading(true);
      persona = dniRespuesta;
    }
  }

  void loading(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
