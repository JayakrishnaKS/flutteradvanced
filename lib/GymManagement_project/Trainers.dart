import 'package:flutter/material.dart';

class Trainers extends StatefulWidget {


  @override
  State<Trainers> createState() => _trainerlistState();
}

class _trainerlistState extends State<Trainers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF473F97),
        title: Text(
          "Trainers",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          adduser(context);
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: List.generate(6, (index){return  Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("username:jk\nPhonenumber:984567899 \n Salary:30k"),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete))
              ],
            ),
            subtitle: Text("Amount Payed:400"),
          ),
        );})


      ),
    );
  }

  void adduser(BuildContext context) {
    TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "member name",
      ),
    );
    TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Phone number",
      ),
    );
    TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "address",
      ),
    );
    TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Amount payed",
      ),
    );
  }
}
