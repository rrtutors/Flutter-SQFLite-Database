 import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/signup_login/SignupPage.dart';

import 'databases/UserDatabase.dart';
import 'home/home.dart';
import 'signup_login/LoginPage.dart';
import 'splashpage.dart';

class RouteSettngsPage extends RouteSettings{
  static Route<dynamic>generateRoute(RouteSettings settings)
  {

    switch(settings.name)
    {
      case "/":
        /*UserDatabase().getUser().then((result){
          if( result > 0)*/
            return MaterialPageRoute(builder: (_)=>SplashPage());
         /* else
            return MaterialPageRoute(builder: (_)=>LoginPage());
        });*/

        //return MaterialPageRoute(builder: (_)=>LoginPage());
        break;
      case "/splash":
        return MaterialPageRoute(builder: (_)=>SplashPage());
        break;
        case "/login":
        return MaterialPageRoute(builder: (_)=>LoginPage());

        break;
      case "/signup":

        return MaterialPageRoute(builder: (_)=>SignupPage());
        break;
      case "/home":

        return MaterialPageRoute(builder: (_)=>Homepage());
        break;

    }
  }
}