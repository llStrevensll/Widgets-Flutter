import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),//padding en todas las direcciones
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          
          
        ],
      ),
    );
  }

  Widget _cardTipo1(){

    return Card(
      elevation: 10.0,//que tan alta esta la tarjeta en relacion a la sombra que proyectara
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),//bordes circulares
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text('Aquí se presenta el respectivo texto para el subtitulo en la presente card'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,//botones posicionados al final
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2(){

    final card = Container(
      //clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          /*Image(
            image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
          ),¨*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Texto de la imagen')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(//sombra
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,//que tanto se extendera la sombra
            offset: Offset(2.0, 10.0)//imaginar plano cartesiano para posicion donde '-y' es arriba y '+y' abajo
          )
        ]
      ),
      child: ClipRRect(//cortar lo que este fuera del contenedor
        borderRadius: BorderRadius.circular(30.0),
        child: card,//card-> objeto definido arriba

      ),
    );
  }
}