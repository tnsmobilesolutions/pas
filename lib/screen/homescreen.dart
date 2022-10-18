import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/screen/searchuser.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

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
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Card(
                      elevation: 10,
                      shadowColor: const Color(0xFFfa6e0f),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                backgroundColor: Color(0xFFfa6e0f),
                                radius: 20.0,
                                child: Icon(Icons.person)),
                          ),
                          Expanded(
                            child: ListTile(
                              tileColor: const Color(0xFFfefefe),
                              //visualDensity: VisualDensity(vertical: 4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(height: 10),
                                  Text('Name'),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(height: 10),
                                  Text('Proffession'),
                                  Text('Sangha'),
                                  Text('Email'),
                                  Text('City'),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                backgroundColor: Color(0xFFfa6e0f),
                                radius: 20.0,
                                child: Icon(Icons.bloodtype)),
                          ),
                          const VerticalDivider(
                            color: Colors.white30,
                          ),
                        ],
                      )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
