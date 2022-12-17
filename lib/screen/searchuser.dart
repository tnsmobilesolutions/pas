import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/searchAPI.dart';
import 'package:prabasi_anchalika_sangha/constant.dart';

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
        title: Text('Search User'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
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
                  Expanded(
                    child: _selectedSearchType != 'Birth Place'
                        ? TextFormField(
                            controller: searchController,
                            onChanged: (value) async {
                              if (_selectedSearchType == 'Birth Place') {
                                value = birthDistrict.toString();
                              }
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
                          )
                        : DropdownButton(
                            value: birthDistrict,

                            elevation: 16,
                            hint: const Text('Select Your Native District'),
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
                                .map<DropdownMenuItem<String>>((String value) {
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
                  child: Text('Search')),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 30),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: searchResult?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFfa6e0f),
                        backgroundImage: searchResult != null
                            ? NetworkImage(
                                '${searchResult![index].profilepicURL}')
                            : null,
                      ),
                      Expanded(
                        child: Card(
                          child: ListTile(
                            title: Text(searchResult != null
                                ? searchResult![index].name.toString()
                                : ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(searchResult![index].sangha.toString()),
                                Text(
                                    searchResult![index].bloodgroup.toString()),
                                Text(searchResult![index]
                                    .phoneNumber
                                    .toString()),
                                Text(searchResult![index].email.toString()),
                                Text(
                                    searchResult![index].proffesion.toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
