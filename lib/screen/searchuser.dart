import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/API/searchAPI.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';
import 'package:prabasi_anchalika_sangha/screen/searchresult.dart';

enum APIType { search, fetchAll }

class SerachUserWidget extends StatefulWidget {
  const SerachUserWidget({Key? key}) : super(key: key);

  @override
  State<SerachUserWidget> createState() => _SerachUserWidgetState();
}

class _SerachUserWidgetState extends State<SerachUserWidget> {
  final TextEditingController SearchController = TextEditingController();
  String searchItem = '';
  APIType? type;
  String? _selectedSearchType;
  userModel? selectebutton;

  userModel? selectUser;

  List<String> searchBy = [
    'Name',
    'Sangha',
    'Blood Group',
    'City',
    'Proffession'
  ];

  List<userModel>? searchResult = [];

  @override
  void initState() {
    super.initState();
    type = APIType.fetchAll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    hint: Text('Search By'),
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
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    underline: Text(''),
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) async {
                        final result = await SearchAPI()
                            .searchfromFirebase(_selectedSearchType, value);
                        setState(() {
                          //searchItem = value;
                          searchResult = result;
                        });
                      },
                      decoration: InputDecoration(
                        // icon: const Icon(Icons.search),
                        labelText: "Search What you want",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const SizedBox(height: 30),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: searchResult?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(searchResult != null
                          ? searchResult![index].name.toString()
                          : ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(searchResult![index].sangha.toString()),
                          Text(searchResult![index].bloodgroup.toString()),
                          Text(searchResult![index].phoneNumber.toString()),
                          Text(searchResult![index].email.toString()),
                          Text(searchResult![index].proffesion.toString()),
                        ],
                      ),
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
