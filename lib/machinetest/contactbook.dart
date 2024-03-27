import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyByLvDpI8_baGbs-X7HyllnxTuGHNJrmto",
          appId: "1:769755012205:android:0313220c61fa799ce73364",
          messagingSenderId: "",
          projectId: "sept2projectnew",
          storageBucket: "sept2projectnew.appspot.com"));
  runApp(MaterialApp(
    home: contact_book(),
    debugShowCheckedModeBanner: false,
  ));
}

class contact_book extends StatefulWidget {
  const contact_book({super.key});

  @override
  State<contact_book> createState() => _contact_bookState();
}

class _contact_bookState extends State<contact_book> {
  var name_controller = TextEditingController();
  var contactnumber = TextEditingController();
  late CollectionReference _userCollection;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection("users");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Contact Book",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: name_controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: contactnumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Phonenumber"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (contactnumber.text.length <= 10) {
                    addUser();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.redAccent,
                        content: Text("phone number must atleast 10 didgits")));
                  }
                },
                child: Text("Create Contact")),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: getUser(), builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error${snapshot.error}");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              final users = snapshot.data!.docs;
              return Expanded(child: ListView.builder(
                  itemCount: users.length, itemBuilder: (context, index) {
                final user = users[index];
                final userId = user.id;
                final userName = user['name'];
                final userphone = user['phone'];
                return ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person),),
                  title: Text('$userName'),
                  subtitle: Text('$userphone'),
                  trailing: Wrap(
                    children: [
                      IconButton(onPressed: () {
                        editUser(userId);
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {
                        deleteUser(userId);
                      }, icon: Icon(Icons.delete))
                    ],
                  ),

                );
              }));
            })
          ],
        ),
      ),
    );
  }

  Future<void> addUser() async {
    return _userCollection.add({
      'name': name_controller.text,
      'phone': contactnumber.text
    }).then((value) {
      print("User added sucessfully");
      name_controller.clear();
      contactnumber.clear();
    }).catchError((onError) {
      print("failed to add user $onError");
    });
  }

  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }

  void editUser(var id) {
    showDialog(context: context, builder: (context) {
      final newname_cntlr = TextEditingController();
      final newphone_cntrlr = TextEditingController();
      return AlertDialog(
        title: Text("Update users"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newname_cntlr,
              decoration: InputDecoration(
                  hintText: "Enter text", border: OutlineInputBorder()),
            ), TextField(
              controller: newphone_cntrlr,
              decoration: InputDecoration(
                  hintText: "Enter phone", border: OutlineInputBorder()),
            )
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            updateUser(id, newname_cntlr.text, newphone_cntrlr.text);
            Navigator.pop(context);
          }, child: Text("update"))
        ],
      );
    });
  }

  Future<void> updateUser(var id, String newname, String phone) {
    return _userCollection.doc(id)
        .update({'name': newname, "phone": phone})
        .then((value) {
      print("User updated Successfully");
    }).catchError((error) {
      print(" $error");
    });
  }

  Future <void> deleteUser(var id) {
    return _userCollection.doc(id).delete().then((value) {
      print("User deleted succesfully");
    }).catchError((onError) {
      print("User deletion failed $onError");
    });
  }
}

