import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.week,
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.workWeek,
              CalendarView.timelineDay,
              CalendarView.timelineWeek,
              CalendarView.timelineWorkWeek,
            ],
            dataSource: getCalendarDataSource(),
            specialRegions: _getTimeRegions(),
          ),
        ),
      ),
    );
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4)),
      endTime: DateTime.now().add(const Duration(hours: 5)),
      subject: 'Release Meeting',
      color: Colors.lightBlueAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6)),
      endTime: DateTime.now().add(const Duration(hours: 7)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2020, 1, 22, 1, 0, 0),
      endTime: DateTime(2020, 1, 22, 3, 0, 0),
      subject: 'Support',
      color: Colors.green,
    ));
    appointments.add(Appointment(
      startTime: DateTime(2020, 1, 24, 3, 0, 0),
      endTime: DateTime(2020, 1, 24, 4, 0, 0),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return _DataSource(appointments);
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    regions.add(TimeRegion(
      startTime: DateTime(2020, 5, 29, 00, 0, 0),
      endTime: DateTime(2020, 5, 29, 09, 0, 0),
      recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
      color: Color(0xffbD3D3D3),
      enablePointerInteraction: false,
    ));
    regions.add(TimeRegion(
      startTime: DateTime(2020, 5, 29, 18, 0, 0),
      endTime: DateTime(2020, 5, 29, 24, 0, 0),
      recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
      color: Color(0xffbD3D3D3),
      enablePointerInteraction: false,
    ));
    regions.add(TimeRegion(
      startTime: DateTime(2020, 5, 29, 09, 0, 0),
      endTime: DateTime(2020, 5, 29, 18, 0, 0),
      recurrenceRule: 'FREQ=DAILY;INTERVAL=1',
      color: Color(0xffb89cff0),
      enablePointerInteraction: false,
    ));

    return regions;
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
