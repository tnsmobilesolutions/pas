import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/bloc/profile/profile_bloc.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key, required this.currentUser}) : super(key: key);
  userModel? currentUser;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  // final emailController = TextEditingController();
  final mobileController = TextEditingController();
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
  String? dropdownValue;
  final TextEditingController bloodgroupController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController sanghaController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text = widget.currentUser?.name ?? '';
    // emailController.text = widget.currentUser?.email ?? '';
    mobileController.text = widget.currentUser?.phoneNumber ?? '';
    dropdownValue = widget.currentUser?.bloodgroup ?? '';
    cityController.text = widget.currentUser?.city ?? '';
    professionController.text = widget.currentUser?.proffesion ?? '';
    sanghaController.text = widget.currentUser?.sangha ?? '';

    // TODO: implement initState
    super.initState();
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
                  icon: Icon(Icons.person),
                  // hintText: 'Name',
                  labelText: "Name"),
            ),
            const SizedBox(height: 10),
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
                  icon: Icon(Icons.phone),
                  // hintText: 'Enter Your Mobile Number',
                  labelText: 'Mobile Number'),
            ),
            const SizedBox(height: 10),
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
                  icon: Icon(Icons.location_city_rounded), labelText: "City"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: professionController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.work), labelText: "Profession"),
            ),
            const SizedBox(height: 20),
            BlocConsumer<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return CupertinoButton(
                  color: const Color(0xFFfa6e0f),
                  onPressed: () async {
                    final uid = FirebaseAuth.instance.currentUser?.uid;
                    userModel updatedUser = userModel(
                        name: nameController.text,
                        uid: uid,
                        phoneNumber: mobileController.text,
                        bloodgroup: bloodgroupController.text,
                        sangha: sanghaController.text,
                        city: cityController.text,
                        proffesion: professionController.text);
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
