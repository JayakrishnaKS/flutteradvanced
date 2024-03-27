import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/sqflitee/login_and%20_registration/sqflite_functions.dart';

class UserHome extends StatefulWidget {
  final data;

  UserHome({super.key, required this.data});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var name,email;
  @override
  void initState() {
     name=widget.data[0]['name'];
     email=widget.data[0]['email'];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    var cemail = TextEditingController();
    var cname = TextEditingController();
    void editData() {
      setState(() {
        cemail.text=email;
        cname.text=name;
      });
      showDialog(
          context: context,
          builder: (context) {
            return Column(
              children: [
                Text(
                  "Edit Data",
                  style: TextStyle(fontSize: 15),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "name"),
                  controller: cname,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Email"),
                  controller: cemail,
                ),
                ElevatedButton(onPressed: () {
                  updateUser();
                  Navigator.of(context).pop();
                  // cname.text='';
                  // cemail.text='';
                }, child: Text("update"))
              ],
            );
          });
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
        elevation: 5,
      ),
      body: Card(
        child: ListTile(
          leading: Icon(Icons.person_outline),
          title: Text(
            '$name',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('$email'),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  name=cname.text;
                  email=cemail.text;
                });
                editData();
              },
              icon: Icon(Icons.edit)),
        ),
      ),
    );
  }

  void updateUser() async{
    await SQL_Functions.update(widget.data[0]['id'],name,email);
  }
}
