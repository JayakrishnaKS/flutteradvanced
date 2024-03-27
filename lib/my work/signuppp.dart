import'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginn.dart';
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  late SharedPreferences preferences;
var emailcntrl=TextEditingController();
  var pwdcntrl=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup"),),
      body: Form(
        key: formkey,
        child: Center(child: Column(
          children: [
            TextFormField(
              controller: emailcntrl,
              validator: (email){
              if( email!.isEmpty&& !email.contains("@")){
               return "Invalid entry";
              }else{
                return null;
              }
            },
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "username",label: Text("username")),
            ),
            TextFormField(controller: pwdcntrl,
              validator: (pwd){
                if(pwd!.isEmpty&& pwd.length>6){
                 return "must contains 6 characters atleast";
                }else{
                  return null;
                }
              },
            ),ElevatedButton(onPressed: (){
              final valid=formkey.currentState?.validate();
              if(valid==true){
                storedata();
              }
            }, child: Text("signup"))

          ],
        ),),
      ),

    );
  }

 Future <void> storedata() async{
    preferences=await SharedPreferences.getInstance();
    String unamee=emailcntrl.text.trim();
    String pwdd=pwdcntrl.text.trim();
    preferences.setString("uname",unamee);
    preferences.setString("password", pwdd);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginnnn()));


 }
}
