
import 'dart:core';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
//import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

    //provider data json
    //FutureBuilder
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){


        return ListView(
          children: _listaItem(snapshot.data, context),
        );
      },
    );
    
  }
      
  List<Widget>_listaItem(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt) {

      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color:Colors.blue),
        onTap: (){

            Navigator.pushNamed(context, opt['ruta']);//ruta de la lista
            /*final route = MaterialPageRoute(
              builder: (context) => AlertPage()
            );

            Navigator.push(context, route);*/
        },
      );  

      opciones..add(widgetTemp) //adicionar las opciones a la lista de widgets
              ..add(Divider());
    });

    return opciones;
    
  }
}