import 'package:flutter/material.dart';

import 'equipmentsscreen.dart';

void main() {
  runApp(MaterialApp(home: screen1(),debugShowCheckedModeBanner: false,));
}

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF473F97),
        title: Text("Equipments",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEquipments()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
          children: List.generate(5, (index) {
        return
            Card(
              child: ListTile(focusColor:Colors.white54,
                leading:
                    Icon(Icons.fitness_center),
               
              
                title: Text("Dumbell"),
                subtitle: Text("Service date:2024"),
              ),
            );


      })),
    );
  }
}
