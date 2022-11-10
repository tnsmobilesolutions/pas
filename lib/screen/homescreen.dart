import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/lunchURLAPI.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/fetchDataModel.dart';
import 'package:prabasi_anchalika_sangha/model/promotionsModel.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/loginscreen.dart';
import 'package:prabasi_anchalika_sangha/screen/myProfile.dart';
import 'package:prabasi_anchalika_sangha/screen/searchuser.dart';
import 'package:url_launcher/url_launcher.dart';

enum APIType { search, fetchAll }

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String searchItem = '';

  APIType? type;

  String? _selectedSearchType;

  userModel? selectUser;
  static List<EventModel> events = [];
  static List<PromotionsModel> titles = [];
  userModel? curUser;

  List<String> searchBy = [
    'Name',
    'Sangha',
    'Blood Group',
    'City',
    'Proffession'
  ];

  fetchlist() async {
    final ev = await UserAPI().fetchAllevents();
    final promo = await UserAPI().fetchAllPromotions();
    final user = await UserAPI().currentUser();
    setState(() {
      events = ev;
      titles = promo;
      curUser = user;
    });
  }

  @override
  void initState() {
    fetchlist();
    super.initState();
    type = APIType.fetchAll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f6f6),
      appBar: AppBar(
        // elevation: 0,
        // backgroundColor: const Color(0xFFf6f6f6),
        // automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFFfa6e0f)),
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SerachUserWidget()));
            }),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                curve: Curves.bounceIn,
                decoration: const BoxDecoration(
                  color: Color(0xFFf6f6f6),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${curUser?.name}',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                ),
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MyProfile();
                    },
                  ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.search,
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
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.0 * (titles.length),
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CupertinoButton(
                          color: const Color(0xFFfa6e0f),
                          child: Text(titles[index].title.toString()),
                          onPressed: (() async {
                            final _url = await titles[index].weburl.toString();
                            Urllunch().launchURLApp(_url);
                          }),
                        ),
                      );
                    },
                  ),
                ),
                const Text('Events',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Flexible(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          tileColor: Colors.white,
                          //visualDensity: VisualDensity(vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),

                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(events[index].eventName.toString()),
                              const Spacer(),
                              Text(events[index].date.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return CircularProgressIndicator();
  }
}
