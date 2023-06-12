import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_2.dart';
import 'package:table_calendar/table_calendar.dart';

import '../colors.dart';

class pagina_part extends StatefulWidget {
  @override
  State<pagina_part> createState() => _pagina_partState();
}

String? selectedOption;
final _numeroTelefoneController = TextEditingController();
CalendarFormat _format = CalendarFormat.month;
DateTime _focusday = DateTime.now();
DateTime _currentDay = DateTime.now();
int? _currentIndex;
bool _isWeekend = false;
bool _dateSelected = false;
bool _timeSelected = false;

class _pagina_partState extends State<pagina_part> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: wColor,
      body: Container(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  child: RichText(
                    text: TextSpan(
                      text: 'Participações amigáveis\n',
                      style: TextStyle(
                        fontSize: 28,
                        color: vColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Selecione a data do acidente',
                          style: TextStyle(color: bColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * .3,
                  child: Image.asset('assets/images/bento_seguros_logo.png'),
                ),
                Container(
                  height: size.height * .45,
                  decoration: BoxDecoration(
                    color: wColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: czColor.withOpacity(.2),
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _tableCalendar(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => part_2()));
                            },
                            child: Text(
                              'Avançar',
                              style: TextStyle(
                                color: wColor,
                              ),
                            ),
                          ),
                        ],
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

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusday,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(color: bColor, shape: BoxShape.circle),
      ),
      availableCalendarFormats: {
        CalendarFormat.month: 'Mês',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusday = focusedDay;
          _dateSelected = true;

          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}
