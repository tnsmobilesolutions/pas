import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/bloc/profile/profile_bloc.dart';
import 'package:prabasi_anchalika_sangha/constant.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key, required this.currentUser}) : super(key: key);
  userModel? currentUser;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? birthDistrict;
  String? profileImage;
  XFile? previewImage;
  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      previewImage = pickedFile;
    });
  }

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

  final nameController = TextEditingController();
  // final emailController = TextEditingController();
  final mobileController = TextEditingController();

  String? dropdownValue;

  final TextEditingController cityController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController sanghaController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text = widget.currentUser?.name ?? '';
    // emailController.text = widget.currentUser?.email ?? ;
    mobileController.text = widget.currentUser?.phoneNumber ?? '';
    dropdownValue = widget.currentUser?.bloodgroup != ""
        ? widget.currentUser?.bloodgroup
        : dropdownValue;
    birthDistrict = widget.currentUser?.birthPlace != ""
        ? widget.currentUser?.birthPlace
        : birthDistrict;
    cityController.text = widget.currentUser?.city ?? '';
    professionController.text = widget.currentUser?.proffesion ?? '';
    sanghaController.text = widget.currentUser?.sangha ?? '';
    profileImage = widget.currentUser?.profilepicURL;

    // TODO: implement initState
    super.initState();
  }

  Future<String?> uploadImageToFirebaseStorage(XFile image) async {
    // print('**************${getImageName(image)}**************');
    Reference storage = FirebaseStorage.instance
        .ref('${widget.currentUser?.name}/${getImageName(image)}');
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
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CupertinoButton(
              onPressed: () {
                showPhotoOptions();
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xFFfa6e0f),
                backgroundImage:
                    previewImage != null && previewImage!.path.isNotEmpty
                        ? Image.file(
                            File('${previewImage?.path}'),
                            fit: BoxFit.cover,
                          ).image
                        : NetworkImage('${widget.currentUser?.profilepicURL}'),
                radius: 60,
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20.0,
                    child: Icon(
                      Icons.camera_alt,
                      size: 25.0,
                      color: Color(0xFF404040),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.bloodtype, color: Colors.green),
                const SizedBox(width: 15),
                Expanded(
                  child: DropdownButtonFormField(
                    value: dropdownValue,

                    elevation: 16,
                    hint: const Text('Select BloodGroup'),
                    // style: const TextStyle(color: Colors.deepPurple),

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
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              onSaved: (newValue) => nameController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xFFfa6e0f),
                  ),
                  // hintText: 'Name',
                  labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: mobileController,
              onSaved: (newValue) => mobileController,
              validator: (value) {
                RegExp regex = RegExp(r'^.{10}$');
                if (value!.isEmpty) {
                  return ("Please enter Phone Number");
                }
                if (!regex.hasMatch(value) && value.length != 10) {
                  return ("Enter 10 Digit Mobile Number");
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xFFfa6e0f),
                  ),
                  // hintText: 'Enter Your Mobile Number',
                  labelText: 'Mobile Number'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: sanghaController,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.temple_buddhist,
                    color: Color(0xFFfa6e0f),
                  ),
                  labelText: "Sangha"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.location_city_rounded,
                    color: Color(0xFFfa6e0f),
                  ),
                  labelText: "City"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: professionController,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.work,
                    color: Color(0xFFfa6e0f),
                  ),
                  labelText: "Profession"),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.home, color: Colors.green),
                    SizedBox(width: 15),
                  ],
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    value: birthDistrict,

                    elevation: 16,
                    hint: const Text('Select District'),
                    // style: const TextStyle(color: Colors.deepPurple),

                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        birthDistrict = value!;
                      });
                    },
                    items: districtList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            //Row

            const SizedBox(height: 20),
            BlocConsumer<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return CupertinoButton(
                  color: const Color(0xFFfa6e0f),
                  onPressed: () async {
                    final uid = FirebaseAuth.instance.currentUser?.uid;
                    profileImage = previewImage != null
                        ? await uploadImageToFirebaseStorage(previewImage!)
                        : null;
                    userModel updatedUser = userModel(
                      name: nameController.text,
                      uid: uid,
                      phoneNumber: mobileController.text,
                      bloodgroup: dropdownValue,
                      sangha: sanghaController.text,
                      city: cityController.text,
                      proffesion: professionController.text,
                      profilepicURL: profileImage,
                      birthPlace: birthDistrict,
                    );
                    await UserAPI().editPprofile(updatedUser);
                    context.read<ProfileBloc>().add(MyprofileEvent());
                  },
                  child: const Text('Submit'),
                );
              },
              listener: (context, state) {
                if (state is MyprofileState) {
                  Navigator.pop(context);
                }
              },
            )
          ]),
        ),
      )),
    );
  }
}
