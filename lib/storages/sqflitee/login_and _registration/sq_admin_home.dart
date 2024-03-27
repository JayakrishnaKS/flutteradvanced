import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/sqflitee/login_and%20_registration/sqflite_functions.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Map<String, dynamic>> users = [];
  @override
  void initState() {
    getAllUsers();
    // TODO: implement initState
    super.initState();
  } void getAllUsers() async{
    var usersFromDb=await SQL_Functions.getAllUsers();
    setState(() {
      users=usersFromDb;
    });

  }//to store the details .of all the users
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        elevation: 8,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(users[index]['name']),
                subtitle: Text(users[index]['email']),
                trailing: IconButton(onPressed: (){
                  deleteUser(users[index]['id']);
                }, icon: Icon(Icons.delete)),
              ),
            );
          }),
    );
  }

  void deleteUser(int id) async{
    await SQL_Functions.dltUser(id);
    getAllUsers();
  }


}
