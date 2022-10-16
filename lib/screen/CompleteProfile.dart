import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';
import 'package:prabasi_anchalika_sangha/model/CompleteProfileModel.dart';
import 'package:prabasi_anchalika_sangha/screen/homescreen.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  File? imageFile;
  final TextEditingController bloodgroupController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController sanghaController = TextEditingController();

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
  }

  void showPhotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Upload Profile Picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.gallery);
                  },
                  leading: Icon(Icons.photo_album),
                  title: Text("Select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.camera);
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take a photo"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Your Profile'),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  showPhotoOptions();
                },
                padding: EdgeInsets.all(0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      (imageFile != null) ? FileImage(imageFile!) : null,
                  child: (imageFile == null)
                      ? Icon(
                          Icons.person,
                          size: 60,
                        )
                      : null,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: bloodgroupController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.water_rounded),
                      labelText: "Blood Group")),
              TextFormField(
                  controller: sanghaController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.home), labelText: "Sangha")),
              TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.location_city_rounded),
                      labelText: "City")),
              TextFormField(
                  controller: professionController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.work), labelText: "Profession")),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final uid = FirebaseAuth.instance.currentUser?.uid;
                  CompleteProfileModel addOnData = CompleteProfileModel(
                      bloodgroup: bloodgroupController.text.trim(),
                      city: cityController.text.trim(),
                      proffesion: professionController.text.trim(),
                      sangha: sanghaController.text.trim(),
                      uid: uid);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeWidget()),
                  );
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
