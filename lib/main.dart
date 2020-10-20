import 'package:flutter/material.dart';


import 'home/home.dart';
import 'route_settings.dart';
import 'splashpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  int login;
  MyApp();


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      //home: Homepage(),
      onGenerateRoute: RouteSettngsPage.generateRoute,
    );
  }

}
