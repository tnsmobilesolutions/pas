import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/editProfile.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  userModel? currentUser;
  initialData() async {
    final user = await UserAPI().currentUser();
    setState(() {
      currentUser = user;
    });
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EditProfile(currentUser: currentUser);
                  },
                ));
              }),
              icon: Icon(Icons.edit))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name : ${currentUser?.name}'),
              SizedBox(
                height: 10,
              ),
              Text('email : ${currentUser?.email}'),
              Text('phoneNumber : ${currentUser?.phoneNumber}'),
              Text('bloodgroup : ${currentUser?.bloodgroup}'),
              Text('sangha : ${currentUser?.sangha}'),
              Text('city : ${currentUser?.city}'),
              Text('proffesion : ${currentUser?.proffesion}'),
              Text('userId : ${currentUser?.userId}'),
            ],
          ),
        ),
      )),
    );
  }
}
