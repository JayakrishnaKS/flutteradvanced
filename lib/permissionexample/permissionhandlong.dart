import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: permissionhandling(), debugShowCheckedModeBanner: false,));
}

class permissionhandling extends StatelessWidget {
  const permissionhandling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [Padding(padding: EdgeInsets.all(12), child: Row(
          children: [
            ElevatedButton(onPressed: () {
              askCameraPermission(context);
            }, child: Text("Camera")),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              askMultiplePermission();
            }, child: Text("Multiple permission")),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              askSettingPermission();
            }, child: Text("Settings"))
          ],
        ),)
        ],
      ),
    );
  }

  void askCameraPermission(BuildContext context) async {
    var status = await Permission.camera.status;
    if (await Permission.camera
        .request()
        .isGranted) {
      var picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
    } else if (status.isDenied) {}
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Permission denied"), backgroundColor: Colors.red,));
  }

  void askMultiplePermission() async {
    Map<Permission, PermissionStatus>status =
    await [
      Permission.location,
      Permission.contacts,
      Permission.microphone,
      Permission.storage
    ].request();
    print("status location ${status[Permission
        .location]}Contact ${status[Permission
        .contacts]}Microphone ${status[Permission.microphone] }Storage ${status[Permission.storage]}");
  }

  void askSettingPermission() async {
    openAppSettings();
  }
}
