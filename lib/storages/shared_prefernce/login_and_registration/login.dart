import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/shared_prefernce/login_and_registration/home.dart';
import 'package:flutter_advanced/storages/shared_prefernce/login_and_registration/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: LoginShared(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginShared extends StatefulWidget {
  @override
  State<LoginShared> createState() => _LoginSharedState();
}

class _LoginSharedState extends State<LoginShared> {
  var formkey = GlobalKey<FormState>();
  var uname_controller = TextEditingController();
  var pass_controller = TextEditingController();
  late SharedPreferences preferences;
  late bool newUser;
@override
  void initState() {
   check_if_ser_is_already_Login();
    super.initState();
  } void check_if_ser_is_already_Login() async{
  preferences=await SharedPreferences.getInstance();
  //?? - if the given condition is null statement will execute
  newUser=preferences.getBool('newUser')??true;
  if(newUser==false){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
  }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                   validator: (username) {
        if (username!.isEmpty || !username.contains('@')) {
        return "Invalid Username";
        } else {
        return null;
        }
        },
                  decoration: InputDecoration(hintText: 'username'),
                  controller: uname_controller,
                ),
                TextFormField(validator: (password) {
                  if (password!.isEmpty || password.length < 6) {
                    return " Password must contain atleast 6 character";
                  } else {
                    return null;
                  }
                },decoration: InputDecoration(hintText: 'password'),
                  controller: pass_controller,
                ),
                ElevatedButton(onPressed: () {
                  final valid= formkey.currentState!.validate();
                  if(valid==true){
                    validateInput();
                  }

                }, child: Text("Login")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register_Shared()));
                    },
                    child: Text("Don't have an account?SignUp"))
              ],
            )),
      ),
    );
  }

  void validateInput() async{
    String uname=uname_controller.text;
    String pwd=pass_controller.text;
    preferences=await SharedPreferences.getInstance();
    //if a user is logged in then mark is not a new user
    preferences.setBool('newUser', false);
    //read the registered values in shared prefernces in registr page
    String? stored_uname=preferences.getString('username');/// 'username'
    String? stored_pass=preferences.getString('pass');
    if(stored_uname==uname&&stored_pass==pwd){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
    }
  }


}
