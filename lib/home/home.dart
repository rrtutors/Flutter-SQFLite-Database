import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/databases/UserDatabase.dart';
import 'package:flutter_firebase_app/models/user.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return HomeState();
  }

}

class HomeState extends State<Homepage>{
  Size size;
  User user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserDatabase.instance.getUserData().then((result){
      setState(() {
        user=result;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

          Row(

            mainAxisAlignment: MainAxisAlignment.end,

            children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: RaisedButton(
                     onPressed: (){

                       UserDatabase.instance.deleteUser(user.mobile).then((res){
                         if(res==1)
                           {
                             Navigator.pushReplacementNamed(context, "/login");
                           }

                       });
                     },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),

                      ),
                        color:Colors.pink,
                       child: Text("Logout", style: TextStyle(color: Colors.white
                       ),)
                    ),
                 )
            ],
          ),
          Container(

            height:size.height-200 ,
            child: Center(
              child: (user==null)?null:Text("Welcome User "+user.name),
            ),
          ),
        ],
      )
    );
  }

}