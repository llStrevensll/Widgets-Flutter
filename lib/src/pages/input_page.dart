import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email  = '';
  String _fecha  = '';
  String _opcionSeleccionada = 'Correr';

  List<String> _habilidades = ['Correr', 'Saltar', 'Planear', 'Adaptar'];

  TextEditingController _inputFieldDateController = new TextEditingController();//controlador para el field de fecha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),//opciones
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,//Mayuscula - miniscula
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la Persona',//similar a placeholder
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {//redibujar widget
          _nombre = valor;
        });
  
      },
    );
  }

  Widget _crearEmail(){

    return TextField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',//similar a placeholder
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() {//redibujar widget
          _email = valor;
        })
    );

  }

  Widget _crearPassword(){
    return TextField(
      //autofocus: true,
      obscureText: true,// ocultar password *****
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',//similar a placeholder
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState(() {//redibujar widget
          _email = valor;
        })
    );
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,//controlador
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',//similar a placeholder
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {//onTap
        FocusScope.of(context).requestFocus(new FocusNode());//quitar el foco 
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{
    
    DateTime picked = await showDatePicker(//es de tipo Future<DateTime>
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState((){
        _fecha = picked.toString();
        //colocar la fecha seleccionada por el usuario
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _habilidades.forEach((habilidad) {
      
      lista.add(DropdownMenuItem(
        child: Text(habilidad),
        value: habilidad,
      ));
    });

    return lista;
  }
  Widget _crearDropdown(){

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
              _opcionSeleccionada = opt; 
              });
            },
          ),
        ),
      ],
    );
    
    
    
  }








  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),//texto al final
    );
  }
}