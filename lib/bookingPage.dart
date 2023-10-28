import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookingPage extends StatelessWidget {
  const bookingPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a time slot'),
      ),
    );
  }
}

