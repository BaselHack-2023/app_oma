import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/bookingPage.dart';
import 'package:mobile_app/homePage.dart';
import 'package:mobile_app/startNowPage.dart';

class actionPage extends StatelessWidget {
  const actionPage({super.key, required this.room});
  final String room;

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
            child: FilledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const bookingPage()),
                );
              },
              child: Text("Book a wash"),
            ),
          ),
          // Start Washing
          Container(
            // Book A day
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: FilledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const startNowPage()),
                );
              },
              child: Text("Start Washing"),
            ),
          ),
        ],
      ),
    );
  }
}