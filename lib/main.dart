import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

List<String> views = <String>[
  'Day',
  'Week',
  'WorkWeek',
  'Month',
  'Timeline Day',
  'Timeline Week',
  'Timeline WorkWeek'
];

class ScheduleExample extends State<MyApp> {
  CalendarView _calendarView;

  @override
  void initState() {
    _calendarView = CalendarView.week;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              setState(() {
                if (value == 'Day') {
                  _calendarView = CalendarView.day;
                } else if (value == 'Week') {
                  _calendarView = CalendarView.week;
                } else if (value == 'WorkWeek') {
                  _calendarView = CalendarView.workWeek;
                } else if (value == 'Month') {
                  _calendarView = CalendarView.month;
                } else if (value == 'Timeline Day') {
                  _calendarView = CalendarView.timelineDay;
                } else if (value == 'Timeline Week') {
                  _calendarView = CalendarView.timelineWeek;
                } else if (value == 'Timeline WorkWeek') {
                  _calendarView = CalendarView.timelineWorkWeek;
                }
              });
            },
          ),
        ),
        body: SfCalendar(
          view: _calendarView,
          dataSource: getCalendarDataSource(),
          specialRegions: _getTimeRegions(),
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
