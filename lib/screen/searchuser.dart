import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prabasi_anchalika_sangha/screen/searchresult.dart';


class SerachUserWidget extends StatelessWidget {
  const SerachUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search User'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  const SizedBox(height: 10),
                  TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person), labelText: "Name")),
                  TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.home), labelText: "Sangha")),
                  TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.water_rounded),
                          labelText: "Blood Group")),
                  TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.location_city_rounded),
                          labelText: "City")),
                  TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.work), labelText: "Proffession")),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SerachResultWidget()),
                      );
                    },
                    child: const Text('Search'),
                  )
                ]))));
  }
}
