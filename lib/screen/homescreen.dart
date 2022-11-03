import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/fetchDataModel.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/loginscreen.dart';
import 'package:prabasi_anchalika_sangha/screen/searchuser.dart';

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

  List<String> searchBy = [
    'Name',
    'Sangha',
    'Blood Group',
    'City',
    'Proffession'
  ];

  eventlist() async {
    final ev = await UserAPI().fetchAllevents();
    setState(() {
      events = ev;
    });
  }

  @override
  void initState() {
    eventlist();
    super.initState();
    type = APIType.fetchAll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f6f6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFf6f6f6),
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFfa6e0f),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
          IconButton(
            onPressed: () {
              UserAPI().logout();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage(
                    title: 'Welcome',
                  );
                },
              ));
            },
            icon: Icon(
              Icons.logout_rounded,
              color: Color(0xFFfa6e0f),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: ListTile(
                    tileColor: const Color(0xFFfefefe),
                    //visualDensity: VisualDensity(vertical: 4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10),
                        Text(events[index].eventName.toString()),
                        Text(events[index].date.toString()),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
    // return CircularProgressIndicator();
  }
}
