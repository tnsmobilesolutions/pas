import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

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
        actions: [IconButton(onPressed: (() {}), icon: Icon(Icons.edit))],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name : ${currentUser?.name}'),
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
          ),
        ),
      )),
    );
  }
}
