import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/bloc/profile/profile_bloc.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/loginscreen.dart';
import 'package:prabasi_anchalika_sangha/screen/myProfile.dart';
import 'package:prabasi_anchalika_sangha/screen/searchuser.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  userModel? curUser;

  fetchlist() async {
    final user = await UserAPI().currentUser();
    setState(() {
      curUser = user;
    });
  }

  @override
  void initState() {
    fetchlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              // curve: Curves.bounceIn,
              decoration: const BoxDecoration(
                color: Color(0xFFf6f6f6),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFFfa6e0f),
                        backgroundImage:
                            NetworkImage('${curUser?.profilepicURL}'),
                        child: curUser?.profilepicURL == null
                            ? const Icon(
                                Icons.person,
                                size: 40,
                              )
                            : null,
                      ),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${curUser?.name}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color(0xFFfa6e0f),
                  ),
                  title: const Text('My Profile'),
                  onTap: () {
                    context.read<ProfileBloc>().add(MyprofileEvent());
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MyProfile();
                      },
                    ));
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.search,
                color: Color(0xFFfa6e0f),
              ),
              title: const Text('Search'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SerachUserWidget()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Color(0xFFfa6e0f),
              ),
              title: const Text('Log out'),
              onTap: () {
                UserAPI().logout();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage(
                      title: 'Welcome',
                    );
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
