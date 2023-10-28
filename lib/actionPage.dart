import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/bookingPage.dart';
import 'package:mobile_app/models/Machine.dart';
import 'package:mobile_app/startNowPage.dart';

class actionPage extends StatelessWidget {
  const actionPage({super.key, required this.room});
  final String room;

  Future<Machine> fetchMachine() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Machine.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appartment No. $room'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Container(
            // Book A day
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: OutlinedButton.icon(
              icon: const Icon(CupertinoIcons.calendar),
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const bookingPage()),
                );
              },
              label: const Text("Book a slot"),

            ),
          ),
          // Start Washing
          Container(
            // Book A day
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.water),
              onPressed: () {
                var machine = fetchMachine();
                var event = fetchMachine();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => startNowPage(machines: machine, events: event)),
                );
              },
              label: const Text("Wash now"),
            ),
          ),
        ],
      ),
    );
  }
}