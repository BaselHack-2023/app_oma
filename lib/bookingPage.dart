import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/Machine.dart';
import 'package:mobile_app/models/Reservation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;


Future<Machine> fetchMachine() async {
  final response = await http.get(Uri.parse('https://api.iperka.com/machines'));

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

Future<List<Reservation>> fetchEvents() async {
  final response = await http.get(Uri.parse('https://api.iperka.com/reservations'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return List<Reservation>.from(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class bookingPage extends StatelessWidget {
  const bookingPage({super.key, required machines, required events});

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
          dataSource: MeetingDataSource(_getDataSource()),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    var futureMachines = fetchMachine();
    fetchEvents().then(
            (value) => value.map(
                    (e) => meetings.add(Meeting("test", DateTime.parse(e.startTime), DateTime.parse(e.endTime), const Color(0xFF0F8644), false))
            )
    );

    return meetings;
  }


}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}


