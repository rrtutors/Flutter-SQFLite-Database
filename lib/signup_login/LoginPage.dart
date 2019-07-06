import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/databases/UserDatabase.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }

}
class LoginState extends State<LoginPage>
{
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _mobileController=TextEditingController();
  final _passwordController=TextEditingController();
  final FocusNode _mobileFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return new Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children:<Widget>[
          Image.asset("splash_img.png",fit: BoxFit.cover,
          width: size.width,
          height: size.height,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Form(
                key: _formKey,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),

                    TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,

                      focusNode: _mobileFocus,
                      onFieldSubmitted: (term){
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                      validator: (value){
                        if(value.isEmpty)
                        {
                          return "Enter mobile number";
                        }
                        return null;
                      },
                      style: getTextStyle(),
                      decoration: customInputDecoration("Enter mobile number"),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,

                      obscureText: true,
                      focusNode: _passwordFocus,
                      validator: (value){
                        if(value.isEmpty)
                        {
                          return "Enter Password";
                        }
                        return null;
                      },
                      style: getTextStyle(),
                      decoration: customInputDecoration("Enter password"),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed: (){

                      if(_formKey.currentState.validate())
                      {

                        UserDatabase.instance.checkUserLogin(_mobileController.text,_passwordController.text).then((result){

                          if(result==null)
                          {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Please enter valid details")));
                          }
                          else
                          {
                            Navigator.pushReplacementNamed(context, "/home");
                          }
                        });
                      }

                    }, shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                      color: Colors.pink,
                      child: Text("Login", style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),

                    FlatButton(
                      child: Text("Don't have account, Signup?"),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, "/signup");
                      },
                    )
                  ],
                )
            ),
          )
        ] ,
      ),
    );
  }
  TextStyle getTextStyle(){
    return TextStyle(
        fontSize: 18,
        color: Colors.pink
    );
  }

  InputDecoration customInputDecoration(String hint)
  {

    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          color: Colors.teal
      ),
      contentPadding: EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Colors.pink
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Colors.pink
          )
      ),

    );
  }
}