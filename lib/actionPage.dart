import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/homePage.dart';

class actionPage extends StatelessWidget {
  const actionPage({super.key, required this.room});
  final String room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appartment No. $room'),
      ),
    );
  }
}