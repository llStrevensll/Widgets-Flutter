import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearItemsCorta()
      ),
    );

  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {//recorrer arreglo de opciones

      final tempWidget = ListTile(//cada opcion es agregado en un listtile
        title: Text(opt)
      );

      //Operador de cascada
      lista..add(tempWidget)
            ..add(Divider());
    }
    return lista;//retornar la lista de tipo widget
  }

  List<Widget> _crearItemsCorta(){

    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.ac_unit),//leading -> widget al incio
            trailing: Icon(Icons.keyboard_arrow_right),//trailing -> widget al final
            onTap: (){},//poder presionar
          ),
          Divider()
        ],
      );
    }).toList();//convertir a lista

  }
}