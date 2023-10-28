import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/actionPage.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appartmentNumber = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (text) {
                appartmentNumber = text;
              },
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Appartment number',
              ),
            ),
          ),


          FilledButton(
            child: const Text('Confirm'),
            onPressed: () {
              // Navigate to second route when tapped.
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => actionPage(room: appartmentNumber)),
              );
            },
          ),
        ],
      ),
    );
  }
}

