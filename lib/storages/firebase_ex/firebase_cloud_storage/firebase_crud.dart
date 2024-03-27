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
    home: Firebase_crud(),
    debugShowCheckedModeBanner: false,
  ));
}

class Firebase_crud extends StatefulWidget {
  const Firebase_crud({super.key});

  @override
  State<Firebase_crud> createState() => _Firebase_crudState();
}

class _Firebase_crudState extends State<Firebase_crud> {
  var name_controller = TextEditingController();
  var email_controller = TextEditingController();
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
        title: Text("Firebase Cloud storage"),
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
              controller: email_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "uname"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: Text("Add user")),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(stream:getUser(), builder: (context,snapshot){
              if(snapshot.hasError){
                return Text("Error${snapshot.error}");
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              final users=snapshot.data!.docs;
              return Expanded(child: ListView.builder(itemCount: users.length,itemBuilder: (context,index){
                final user=users[index];
                final userId=user.id;
                final userName=user['name'];
                final userEmail=user['email'];
                return ListTile(
                  title: Text('$userName'),
                  subtitle: Text('$userEmail'),
                  trailing:  Wrap(
                    children: [
                      IconButton(onPressed: (){
                        editUser(userId);}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){deleteUser(userId);}, icon: Icon(Icons.delete))],
                  ) ,

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
      'email': email_controller.text
    }).then((value) {
      print("user added sucessfully");
      name_controller.clear();
      email_controller.clear();
    }).catchError((onError) {
      print("failed to add user $onError");
    });
  }

 Stream<QuerySnapshot> getUser()  {
    return _userCollection.snapshots();

 }

   void editUser(var id) {
    showDialog(context: context, builder: (context){
      final newname_cntlr=TextEditingController();
      final newemail_cntrlr=TextEditingController();
      return AlertDialog(
        title: Text("Update users"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newname_cntlr,
              decoration:InputDecoration(hintText: "Enter text",border: OutlineInputBorder()) ,
            ),TextField(
              controller: newemail_cntrlr,
              decoration:InputDecoration(hintText: "Enter text",border: OutlineInputBorder()) ,
            )
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            updateUser(id,newname_cntlr.text,newemail_cntrlr.text);
       Navigator.pop(context);   }, child: Text("update"))
        ],
      );
    });
   }

Future<void > updateUser( var id, String newname, String newemail) {
    return _userCollection.doc(id).update({'name':newname,"email":newemail}).then((value) {
      print("User updated Successfully");}).catchError((error){
        print(" $error");
    });
    }

 Future <void> deleteUser(var id) {return _userCollection.doc(id).delete().then((value){
   print("User deleted succesfully");
 }).catchError((onError){
   print("User deletion failed $onError");
 });}
}

