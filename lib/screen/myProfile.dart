import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prabasi_anchalika_sangha/bloc/profile/profile_bloc.dart';

import 'package:prabasi_anchalika_sangha/screen/editProfile.dart';
import 'package:prabasi_anchalika_sangha/screen/theme.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage('${state.currentUser.profilepicURL}'),
                      child: state.currentUser.profilepicURL == null
                          ? const Icon(
                              Icons.person,
                              size: 60,
                            )
                          : null,
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
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
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
                        const SizedBox(height: 10),
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
