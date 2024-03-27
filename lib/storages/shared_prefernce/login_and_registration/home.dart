import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/shared_prefernce/login_and_registration/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
 late SharedPreferences preferences;
  String? username;
 @override
  void initState() {
    fetchData();
    super.initState();
  } void fetchData() async{
   preferences=await SharedPreferences.getInstance();
   setState(() {
     username=preferences.getString('username')!;
   });
 }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username!!!!"),

elevation: 4,      ),body: Center(
      child: ElevatedButton(onPressed: (){preferences.setBool('newUser', true);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginShared()));}, child:Text('Logout') ),
    ),

    );
  }

 
}
