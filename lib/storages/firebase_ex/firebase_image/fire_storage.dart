import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

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
    home: Fire_Img_storage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Fire_Img_storage extends StatefulWidget {
  const Fire_Img_storage({super.key});

  @override
  State<Fire_Img_storage> createState() => _Fire_Img_storageState();
}

class _Fire_Img_storageState extends State<Fire_Img_storage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Store"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload('Camera'),
                    icon: Icon(Icons.camera_alt_outlined),
                    label: Text("camera")),
                ElevatedButton.icon(
                    onPressed: () => upload('Gallery'),
                    icon: Icon(Icons.upload),
                    label: Text("Upload"))
              ],
            ),
          ),
          Expanded(child: FutureBuilder(future: loadMedia(), builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              return ListView.builder(itemCount: snapshot.data?.length??0,itemBuilder: (context, index){
                final image=snapshot.data![index];

                return Card(
                  child: ListTile(
                    leading: Image.network(image['imageurl']),
                    title: Text((image['uploaded_by'])
                    ),
                    subtitle: Text(image['time']),
                    trailing: IconButton(onPressed: ()=>deleteMedia('path')

                    , icon: Icon(Icons.delete)),
                  ),
                );
              });
            }return CircularProgressIndicator();
          }))
        ],
      ),
    );
  }

  Future<void> upload(String imageFrom) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source:
              imageFrom == "camera" ? ImageSource.camera : ImageSource.gallery);
      final String filename = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);
      try {
        await storage.ref(filename).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': "Phone_name",
              'time': "Some description"
            }));
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<List<Map<String, dynamic>>> loadMedia() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;
   await Future.forEach(allFiles, (singleFile) async {
      final String fileUrl = await singleFile.getDownloadURL();
      final FullMetadata metadata = await singleFile.getMetadata();
      images.add(
        {'imageurl': fileUrl,
          'path': singleFile.fullPath,
          'uploaded_by':metadata.customMetadata?['uploaded_by']??"NoData"
        ,"time":metadata.customMetadata?['time']??" No time Found"},
      );
    });
    return images;
  }

 Future<void> deleteMedia(String imagePath) async{
    await storage.ref(imagePath).delete();
    setState(() {
      
    });
 }
}
