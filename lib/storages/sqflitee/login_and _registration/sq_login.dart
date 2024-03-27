import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/sqflitee/login_and%20_registration/sq_admin_home.dart';
import 'package:flutter_advanced/storages/sqflitee/login_and%20_registration/sq_user_home.dart';
import 'package:flutter_advanced/storages/sqflitee/login_and%20_registration/sqflite_functions.dart';
void main(){
  runApp(MaterialApp(home: Sq_Login(),debugShowCheckedModeBanner: false,));
}
class Sq_Login extends StatelessWidget {

  var name_cntrl=TextEditingController();
  var pass_cntrl=TextEditingController();
  var email_cntrl=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    void loginUser(String email, String pwd)async {
      if(email=='admin@gmail'&& pwd=='admin1234'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHome()));
      }else{
        var data=await SQL_Functions.checkUserExist(email,pwd);
        if(data.isNotEmpty){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserHome(data:data)));
        }
      }

    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0,right: 28,top: 28),
              child: TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Name"),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 28.0,right: 28,top: 28),
              child: TextFormField(validator: (email){
                if(email!.isEmpty||!email.contains('@')){
                  return "invalid username or the field is empty";
                }else{
                  return null;
                }
              },
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "email"),
              ),
            ),//TextFormField(validator: (pass){
            //   if(pass!.isEmpty||pass.length<6){
            //     return "password length should  contain atleast 6 character";
            //   }else{
            //     return  null;
            //   }
            // },
              //decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Password"),

            ElevatedButton(onPressed: (){
              var valid=formkey.currentState!.validate();
              if(valid){
                loginUser(email_cntrl.text,pass_cntrl.text);
              }
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }

}
