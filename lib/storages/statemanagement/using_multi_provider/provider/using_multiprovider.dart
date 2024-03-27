import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/statemanagement/provider_ex/controller/counter_controller.dart';
import 'package:flutter_advanced/storages/statemanagement/using_multi_provider/provider/auth_provider.dart';
import 'package:flutter_advanced/storages/statemanagement/using_multi_provider/provider/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
      home: MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => count_provider()),
      ChangeNotifierProvider(create: (context) => Auth_Provider())
    ],
 child: Multi_Providerr(), )));
}

class Multi_Providerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Counter Value",
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<count_provider>(context, listen: false).increment();
              },
              child: Text("Increment Coounter")),
          Text(
            "Count value:${Provider.of<count_provider>(context).count}",
            style: TextStyle(fontSize: 30),
          ),Text("Auth Details")
        ,ElevatedButton(onPressed: (){
          Provider.of<Auth_Provider>(context,listen: false).login?
              Provider.of<Auth_Provider>(context,listen: false).logedOut():
              Provider.of<Auth_Provider>(context,listen: false).logedin();
          }, child: Text("Switch login")),
        Consumer<Auth_Provider>(builder: (context,authprovider,child){
          return Text("User is${authprovider.login?"Logged In":"Logged Out"}");
        })],
      ),
    );
  }
}
