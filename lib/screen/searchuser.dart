import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/searchAPI.dart';
import 'package:prabasi_anchalika_sangha/constant.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

enum APIType { search, fetchAll }

class SerachUserWidget extends StatefulWidget {
  const SerachUserWidget({Key? key}) : super(key: key);

  @override
  State<SerachUserWidget> createState() => _SerachUserWidgetState();
}

class _SerachUserWidgetState extends State<SerachUserWidget> {
  final TextEditingController searchController = TextEditingController();
  String searchItem = '';
  APIType? type;
  String? birthDistrict;
  String? _selectedSearchType;
  userModel? selectebutton;

  userModel? selectUser;

  List<userModel>? searchResult = [];

  @override
  void initState() {
    super.initState();
    type = APIType.fetchAll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search User'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: DropdownButton(
                          focusColor: Colors.grey,
                          hint: const Text('Search By'),
                          borderRadius: BorderRadius.circular(15),
                          value: _selectedSearchType,
                          onChanged: (value) {
                            setState(() {
                              _selectedSearchType = value;
                            });
                          },
                          items: searchBy.map(
                            (val) {
                              return DropdownMenuItem(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          iconEnabledColor: Colors.blue,
                          iconDisabledColor: Colors.blue,
                          iconSize: 40,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          underline: const Text(''),
                        ),
                      ),
                      _selectedSearchType != 'Birth Place'
                          ? Expanded(
                              child: TextFormField(
                                controller: searchController,
                                onChanged: (value) async {
                                  final result = await SearchAPI()
                                      .searchfromFirebase(
                                          _selectedSearchType, value);
                                  setState(() {
                                    //searchItem = value;
                                    searchResult = result;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: "Search Text",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: DropdownButtonFormField(
                                value: birthDistrict,

                                elevation: 16,
                                hint: const Text('Select District'),
                                // style: const TextStyle(color: Colors.deepPurple),

                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    birthDistrict = value!;
                                    searchController.text =
                                        birthDistrict.toString();
                                  });
                                },
                                items: districtList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final result = await SearchAPI().searchfromFirebase(
                            _selectedSearchType, searchController.text);
                        setState(() {
                          //searchItem = value;
                          searchResult = result;
                        });
                      },
                      child: const Text('Search')),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 30),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: searchResult?.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: FlipCard(
                                    flipOnTouch: true,

                                    fill: Fill
                                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                                    direction:
                                        FlipDirection.HORIZONTAL, // default
                                    front: Container(
                                      color: const Color(0xFFfefefe),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    const Color(0xFFfa6e0f),
                                                backgroundImage: searchResult?[
                                                                index]
                                                            .profilepicURL !=
                                                        null
                                                    ? NetworkImage(
                                                        '${searchResult?[index].profilepicURL}')
                                                    : null,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ListTile(
                                                title: Text(searchResult != null
                                                    ? searchResult![index]
                                                        .name
                                                        .toString()
                                                    : ''),
                                                subtitle: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (searchResult![index]
                                                                .sangha !=
                                                            null &&
                                                        searchResult![index]
                                                                .sangha !=
                                                            "")
                                                      Text(searchResult![index]
                                                          .sangha
                                                          .toString()),
                                                    if (searchResult![index]
                                                                .bloodgroup !=
                                                            null &&
                                                        searchResult![index]
                                                                .sangha !=
                                                            "")
                                                      Text(searchResult![index]
                                                          .bloodgroup
                                                          .toString()),
                                                    GestureDetector(
                                                      onTap: () {
                                                        UrlLauncher.launch(
                                                            "tel://${searchResult![index].phoneNumber}");
                                                      },
                                                      child: Text(
                                                        searchResult![index]
                                                            .phoneNumber
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                    Text(searchResult![index]
                                                        .email
                                                        .toString()),
                                                    if (searchResult![index]
                                                                .proffesion !=
                                                            null &&
                                                        searchResult![index]
                                                                .proffesion !=
                                                            "")
                                                      Text(searchResult![index]
                                                          .proffesion
                                                          .toString()),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    back: Container(
                                      color: const Color(0xFFfefefe),
                                      child: Center(
                                          child: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xFFfa6e0f),
                                        radius: 30,
                                        child: IconButton(
                                            onPressed: () {
                                              UrlLauncher.launch(
                                                  "tel://${searchResult![index].phoneNumber}");
                                            },
                                            icon: const Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                            )),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 0.3,
                              color: const Color(0xFFfa6e0f),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // )
                          ],
                        ),
                      );
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
