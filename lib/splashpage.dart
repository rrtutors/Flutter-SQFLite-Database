import 'package:flutter/material.dart';

import 'databases/UserDatabase.dart';
import 'home/home.dart';
import 'main.dart';
import 'models/user.dart';
import 'signup_login/LoginPage.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }


}

class SplashState extends State<SplashPage>
{

  int login=101;
  int loginData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginData=login;
    new Future.delayed(const Duration(seconds: 1), () {
      UserDatabase.instance.getUser().then((result){
        setState(() {
          loginData=result;
          if(loginData==0)
            Navigator.pushReplacementNamed(context, "/login");
          else  Navigator.pushReplacementNamed(context, "/home");
          print("Called Return value on state  $loginData");
        });
      });

    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          child: Image.asset("splash_img.png",fit: BoxFit.cover,),

        ));

  }
}