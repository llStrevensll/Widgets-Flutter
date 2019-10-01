
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';
//import 'package:componentes/pages/home_temp.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
 
void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Español
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the a pp supports
      ],
      initialRoute: '/',
      //home: HomePage(),
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){//generar ruta de manera dinamica en caso de no estar la ruta en routes
         
         print('Ruta llamada: ${settings.name}');

         return MaterialPageRoute(
           builder: (BuildContext context) => AlertPage()
         );
      }
    );
  }
}
