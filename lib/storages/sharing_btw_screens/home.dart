import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/sharing_btw_screens/to_stateful/stateful.dart';
import 'package:flutter_advanced/storages/sharing_btw_screens/to_stateless/statelessScreen.dart';
void main(){
  runApp(MaterialApp(home: DataHome(),debugShowCheckedModeBanner: false,));
}
class DataHome extends StatelessWidget {
  String name="Luminar";
  String phone="888888999";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Passing "),
      ),body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(name:name,phone:phone)));
          }, child: Text("To Stateless Screen")),

          SizedBox(height:12 ,),
          ElevatedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen1(name:name,phone:phone)));}, child: Text("to Stateful Screen"))
        ],
      ),
    ),
    );
  }
}
