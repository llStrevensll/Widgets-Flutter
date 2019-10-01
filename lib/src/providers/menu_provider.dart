import 'package:flutter/services.dart' show rootBundle;//para leer json
import 'dart:convert';


class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider(){
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async{//archivo json

    final resp = await rootBundle.loadString('data/menu-opts.json');
    
    Map dataMap = json.decode(resp);//decodifica json y asigna a un map
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();//instancia