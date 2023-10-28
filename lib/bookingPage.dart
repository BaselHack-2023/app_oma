import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class bookingPage extends StatelessWidget {
  const bookingPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a time slot'),
      ),
      body: Container(
        height:600,
        child: SfCalendar(
          view: CalendarView.week,
        ),
      ),
    );
  }
}

