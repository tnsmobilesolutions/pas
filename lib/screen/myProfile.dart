import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';

import 'package:prabasi_anchalika_sangha/bloc/profile/profile_bloc.dart';

import 'package:prabasi_anchalika_sangha/screen/editProfile.dart';
import 'package:prabasi_anchalika_sangha/screen/theme.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  File? imageFile;
  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
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
  // userModel? state.currentUser
  // initialData() async {
  //   final user = await UserAPI().currentUser();
  //   setState(() {
  //     currentUser = user;
  //   });
  // }

  // @override
  // void initState() {
  //   initialData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is MyprofileState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Profile'),
              actions: [
                IconButton(
                    onPressed: (() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return EditProfile(currentUser: state.currentUser);
                        },
                      ));
                    }),
                    icon: const Icon(Icons.edit))
              ],
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        showPhotoOptions();
                      },
                      child: CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 60,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name',
                                style: CurrentTheme().kProfileKeyTextStyle),
                            Text(state.currentUser.name.toString(),
                                style: CurrentTheme().kprofilrDatastyle),
                            CurrentTheme().kProfileDivider
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: CurrentTheme().kProfileKeyTextStyle,
                            ),
                            Text(state.currentUser.email.toString(),
                                style: CurrentTheme().kprofilrDatastyle),
                            CurrentTheme().kProfileDivider
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone Number',
                                style: CurrentTheme().kProfileKeyTextStyle),
                            Text(state.currentUser.phoneNumber.toString(),
                                style: CurrentTheme().kprofilrDatastyle),
                            CurrentTheme().kProfileDivider
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Blood Group',
                                style: CurrentTheme().kProfileKeyTextStyle),
                            Text(state.currentUser.bloodgroup.toString(),
                                style: CurrentTheme().kprofilrDatastyle),
                            CurrentTheme().kProfileDivider
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sangha',
                                style: CurrentTheme().kProfileKeyTextStyle),
                            Text(state.currentUser.sangha.toString(),
                                style: CurrentTheme().kprofilrDatastyle),
                            CurrentTheme().kProfileDivider
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            Text(state.currentUser.city.toString(),
                                style: CurrentTheme().kprofilrDatastyle),
                            CurrentTheme().kProfileDivider
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Profession',
                                style: CurrentTheme().kProfileKeyTextStyle),
                            Text(state.currentUser.proffesion.toString(),
                                style: CurrentTheme().kprofilrDatastyle),
                            CurrentTheme().kProfileDivider
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
      listener: (context, state) {},
    );
  }
}
