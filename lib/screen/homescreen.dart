import 'package:flutter/material.dart';

import 'package:prabasi_anchalika_sangha/API/lunchURLAPI.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/fetchDataModel.dart';
import 'package:prabasi_anchalika_sangha/model/promotionsModel.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

import 'package:prabasi_anchalika_sangha/screen/navigationDrawer.dart';
import 'package:prabasi_anchalika_sangha/screen/searchuser.dart';
import 'package:prabasi_anchalika_sangha/screen/urlLunchWebView.dart';

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
        drawer: NavDrawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Actions',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 60.0 * (titles.length),
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          // color: const Color(0xFFfa6e0f),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFfa6e0f)),
                          ),

                          onPressed: (() async {
                            final urll = titles[index].weburl.toString();
                            Urllunch().launchURLApp(urll);
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) =>
                            //             UrlLunchWebView(url: urll),
                            //       ));
                          }),
                          child: Text(
                            titles[index].title.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                          title: Text(events[index].eventName.toString()),
                          subtitle: Text(events[index].date.toString()),

                          // title: Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(events[index].eventName.toString()),
                          //     const Spacer(),
                          //     Text(events[index].date.toString()),
                          //   ],
                          // ),
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
