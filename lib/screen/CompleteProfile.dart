import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';

import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/homescreen.dart';

class CompleteProfile extends StatefulWidget {
  CompleteProfile({Key? key, this.newuser}) : super(key: key);
  userModel? newuser;

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  List<String> bloodGrouplist = <String>[
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  String? profileImage;
  XFile? previewImage;
  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      previewImage = pickedFile;
    });
  }

  File? imageFile;
  String? dropdownValue;
  final TextEditingController cityController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController sanghaController = TextEditingController();

  void showPhotoOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Upload Profile Picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.gallery);
                  },
                  leading: const Icon(Icons.photo_album),
                  title: const Text("Select from Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    selectImage(ImageSource.camera);
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Take a photo"),
                ),
              ],
            ),
          );
        });
  }

  Future<String?> uploadImageToFirebaseStorage(XFile image) async {
    // print('**************${getImageName(image)}**************');
    Reference storage = FirebaseStorage.instance
        .ref('${widget.newuser?.name}}/${getImageName(image)}');
    await storage.putFile(File(image.path));
    return await storage.getDownloadURL();
  }

  //return image name
  String getImageName(XFile image) {
    return image.path.split("/").last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f6f6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf6f6f6),
        elevation: 0,
        title: const Text(
          'Complete Your Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    showPhotoOptions();
                  },
                  padding: const EdgeInsets.all(0),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFFfa6e0f),
                    radius: 60,
                    backgroundImage:
                        imageFile != null ? FileImage(imageFile!) : null,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.bloodtype, color: Colors.green),
                        SizedBox(width: 15),
                        Text('Blood Group'),
                      ],
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward,
                          color: Color(0xFFfa6e0f)),
                      elevation: 16,
                      hint: const Text('Select BloodGroup'),
                      // style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: const Color(0xFFfa6e0f),
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: bloodGrouplist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: sanghaController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.temple_buddhist), labelText: "Sangha"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.location_city_rounded),
                      labelText: "City"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: professionController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.work), labelText: "Profession"),
                ),
                const SizedBox(height: 30),
                CupertinoButton(
                  color: const Color(0xFFfa6e0f),
                  onPressed: () async {
                    final uid = FirebaseAuth.instance.currentUser?.uid;
                    profileImage = previewImage != null
                        ? await uploadImageToFirebaseStorage(previewImage!)
                        : null;
                    userModel addOnData = userModel(
                        bloodgroup: dropdownValue,
                        city: cityController.text.trim(),
                        proffesion: professionController.text.trim(),
                        sangha: sanghaController.text.trim(),
                        profilepicURL: profileImage,
                        uid: uid);
                    UserAPI().addcompleteProfileData(addOnData);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeWidget()),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CupertinoButton(
                child: Row(
                  children: const [
                    Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFfa6e0f)),
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Color(0xFFfa6e0f),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeWidget(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
