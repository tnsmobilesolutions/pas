import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/bloc/profile/profile_bloc.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/editProfile.dart';
import 'package:prabasi_anchalika_sangha/screen/theme.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Name : ${state.currentUser.name}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'email : ${state.currentUser.email}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'phoneNumber : ${state.currentUser.phoneNumber}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'bloodgroup : ${state.currentUser.bloodgroup}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'sangha : ${state.currentUser.sangha}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'city : ${state.currentUser.city}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'proffesion : ${state.currentUser.proffesion}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'userId : ${state.currentUser.userId}',
                    style: CurrentTheme().kprofilrTextstyle,
                  ),
                  const SizedBox(height: 10),
                ],
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
