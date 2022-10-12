// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SerachResultWidget extends StatelessWidget {
  SerachResultWidget({Key? key}) : super(key: key);

  List devotee = [
    'degeryugey',
    'Atanu Sabyasachi',
    'Amrutanshu Panda',
    'Sangram Mallik',
    'Manmatha Jena',
    'egruyuy',
    'abcd'
  ];

  List branch = [
    'Mumbai Saraswata Sangha',
    'kendra Sevaka Sangha',
    'N/A',
    'Naukana',
    'Byasa Nagar',
    'N/A',
    'N/A',
  ];
  List bloodGroup = ["O", 'B', "AB", 'AB', 'O', 'O', 'B'];
  List contactNumber = [
    '8097376538',
    '1215845155',
    '8787878787',
    '4454845485',
    '8787878897',
    '8878454475',
    '8788787785',
  ];

  List colors = [
    [
      Color.fromARGB(255, 88, 221, 250),
      Color.fromARGB(255, 17, 125, 184),
    ],
    [
      Color.fromARGB(255, 88, 221, 250),
      Color.fromARGB(255, 17, 125, 184),
    ],
    [
      Color.fromARGB(255, 88, 221, 250),
      Color.fromARGB(255, 17, 125, 184),
    ],
    [
      Color.fromARGB(255, 88, 221, 250),
      Color.fromARGB(255, 17, 125, 184),
    ],
    [
      Color.fromARGB(255, 88, 221, 250),
      Color.fromARGB(255, 17, 125, 184),
    ],
    [
      Color.fromARGB(255, 88, 221, 250),
      Color.fromARGB(255, 17, 125, 184),
    ],
    [
      Color.fromARGB(255, 88, 221, 250),
      Color.fromARGB(255, 17, 125, 184),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      backgroundColor: Colors.grey[10],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: devotee.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(7),
                      gradient: LinearGradient(colors: colors[index]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 110),
                              CircleAvatar(
                                  backgroundColor: Colors.white30, radius: 20.0),
                            ],
                          ),
                        ),
                        Container(
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          devotee[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          branch[index],
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 10),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          contactNumber[index],
                                          style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ),
                        VerticalDivider(
                          color: Colors.white30,
                        ),
                        Container(
                          width: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                bloodGroup[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                '+ve',
                                style: TextStyle(color: Colors.white54),
                              ), ],
                          ),
                        ),
                      ],
                    )
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}
