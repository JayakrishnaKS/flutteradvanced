import 'dart:math';

import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Orientations(),debugShowCheckedModeBanner: false,));
}

class Orientations extends StatelessWidget {

  var orientation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orientation==Orientation.portrait?ListScreen ():GridScreen(),
    );
  }
}

class GridScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Gridscreen"),),
      body: GridView.count(crossAxisCount: 4,crossAxisSpacing: 10,mainAxisSpacing: 10,children: List.generate(
          20, (index) => Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
        ),
        child: Center(child: Text("Grid $index",style: TextStyle(fontSize: 20),),),
      )),),
    );
  }
}

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListScreen"),
      ),
      body: ListView.builder(itemBuilder:(context,index){
        return Padding(padding: EdgeInsets.all(18),
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/gym3.jpg"))),
        ),);
      } ),
    );
  }
}
