import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class startNowPage extends StatelessWidget {
  const startNowPage({machines, events, super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Start washing now'),
      ),
    );
  }
}

