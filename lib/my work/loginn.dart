import 'package:flutter/material.dart';
import 'package:flutter_advanced/my%20work/signuppp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homiee.dart';
void main(){
  runApp(MaterialApp(home: loginnnn(),debugShowCheckedModeBanner: false,));
}

class loginnnn extends StatefulWidget {
  @override
  State<loginnnn> createState() => _Loginstate();
}

class _Loginstate extends State<loginnnn> {
  late   var usernew;
  @override
  void initState() {


     checkuser_already_exist();
    super.initState();
  }
  void checkuser_already_exist() async{ preferences= await SharedPreferences.getInstance();
   usernew= preferences.getBool("usercheck");
   if(usernew==false){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>homepagee()));

   }else{
     usernew=true;
   }

  }
  late SharedPreferences preferences;
  var emailcntrl = TextEditingController();
  var pwdcntrl = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: emailcntrl,
                validator: (email) {
                  if (email!.isEmpty && !email.contains("@")) {
                    return "Invalid entry";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "username",
                    label: Text("username")),
              ),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),hintText:"Password",label: Text("password")),
                controller: pwdcntrl,
                validator: (pwd) {
                  if (pwd!.isEmpty && pwd.length > 6) {
                    return "must contains 6 characters atleast";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    final valid = formkey.currentState?.validate();
                    if (valid == true) {
                      validatedataa();
                    }
                  },
                  child: Text("Login")),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  child: Text("not having an account?Signup"))
            ],
          ),
        ),
      ),
    );
  }

 Future <void> validatedataa() async{
    preferences=await SharedPreferences.getInstance();
    String unamee = emailcntrl.text.trim();
      String pwdd = pwdcntrl.text.trim();
      preferences.setBool("usercheck", false);
     var checkusername= preferences.getString("uname");
     var checkpwd=preferences.getString("password");
     if(unamee==checkusername&&pwdd==checkpwd){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>homepagee()));
     }
 }



  // Future<void> storedata() async {
  //   preferences = await SharedPreferences.getInstance();
  //
  //   preferences.setString("uname", unamee);
  //   preferences.setString("password", pwdd);
  // }
}
