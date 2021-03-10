
import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/models/dni_response.dart';
import 'package:http/http.dart' as http;

class Services with ChangeNotifier {

  String _url = 'dni.optimizeperu.com';
  //Late para decir que este valor será inicializado despues
   DniResponse persona = DniResponse();
  String _dni = '';
  String get dni => this._dni;

  set dni(String valor){
    if (valor == 'clean') {
      this._dni = '';
      notifyListeners();
    }else{
    if(this._dni.length < 8){
      this._dni = valor;
      notifyListeners();
    }
    }
  }

  borrar(){
    if(this._dni.length > 0) {
    this._dni = this.dni.substring(0, this._dni.length - 1);
    notifyListeners(); 
    }
  }

  //variable para decir que esta cargando
  bool _isLoading = false;
  bool get isLoading => this._isLoading;
  set isLoading (bool valor){
      this._isLoading = valor;
      notifyListeners();
  }

  bool _mostrar = false;
  bool _efectocircular = true;

  bool get efectocircular => this._efectocircular; 


   void  efectoCircular(bool valor){
      this._efectocircular = valor;
      notifyListeners();
    }


  bool get mostrar => this._mostrar;
   set mostrar (bool valor){
      this._mostrar = valor;
      notifyListeners();
  }


  getResult(String valor) async{

    if (valor.length == 8) {
      this._isLoading = true;
      DniResponse dniRespuesta = DniResponse();
       loading(false);   
      final uri = Uri.https(_url, '/api/persons/$valor');
      if (valor == '03032021') {
          dniRespuesta = DniResponse(
          name: 'Dash',
          firstName: 'Nilay',
          lastName: 'Yener',
          dni: valor

        );
      } else{
        final respuestaDni = await http.get(uri);
        if (respuestaDni.statusCode == 200) {
          dniRespuesta = dniResponseFromJson(respuestaDni.body);
        }
      }
      loading(true);
      persona = dniRespuesta;
    }
  }

    void  loading(bool valor){
      this._mostrar = valor;
      notifyListeners();
    }

 



}