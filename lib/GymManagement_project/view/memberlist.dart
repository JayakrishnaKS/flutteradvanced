import 'package:flutter/material.dart';

class memberlist extends StatefulWidget {
  const memberlist({super.key});

  @override
  State<memberlist> createState() => _memberlistState();
}

class _memberlistState extends State<memberlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF473F97),
        title: Text(
          "Members",
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
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("username:jk\nPhonenumber:984567899 "),
              trailing: Wrap(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                ],
              ),
              subtitle: Text("Amount Payed:400"),
            ),
          )
        ],
      ),
    );
  }

 Future <void> adduser(BuildContext context) async {
    showModalBottomSheet(context: (context), builder: (context){return Form(child:Column(children: [ TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
      hintText: "member name",
    ),
      ),
      TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Phone number",
      ),
      ),
      TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "address",
      ),
      ),
      TextField(
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Amount payed",
      ),
      )],) );});

  }
}
