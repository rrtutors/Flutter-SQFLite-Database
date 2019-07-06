
class User{
   int id;
   String name;
   String email;
   String pasword;
   String mobile;
   User(this.name,this.email,this.pasword,this.mobile);
   Map<String,dynamic>toUserMap(){
     return {
       'name':name,
       'email':email,
       'password':pasword,
       'mobile':mobile,

     };
   }

  static  fromMap(Map<String, dynamic> c) {

     return User(c['name'],c['email'],c['passowrd'],c['mobile']);


  }

}