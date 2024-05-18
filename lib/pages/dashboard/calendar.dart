import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dropDownVal = 'jan';
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  focusedDay: today,
                  firstDay: DateTime.utc(2000, 01, 01),
                  lastDay: DateTime.utc(2030, 01, 01),
                  rowHeight: 50,
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      return Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Events',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        height: 2,
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropDownVal,
                      icon: const Icon(Icons.arrow_downward),
                      underline:
                          null, // This should be set to `SizedBox()` or `Container()` instead of `null`
                      onChanged: (String? newVal) {
                        setState(() {
                          dropDownVal = newVal!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'jan',
                          child: Text('January'),
                        ),
                        DropdownMenuItem(
                          value: 'feb',
                          child: Text(
                              'February'), // Corrected spelling from 'Febuary' to 'February'
                        ),
                        DropdownMenuItem(
                          value: 'mar',
                          child: Text('March'),
                        ),
                      ],
                    ),
                  ], // Added missing closing bracket for children list
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          '5',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            height: 2,
                            color: Color(0xff4D8D6E),
                          ),
                        ),
                        title: Text('Sample Title'),
                        subtitle: Text('Sample Description'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
