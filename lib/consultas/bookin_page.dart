import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto/colors.dart';
import 'package:projeto/consultas/sucess_booked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../login/verificacao.dart';

class pagina_booking extends StatefulWidget {
  const pagina_booking({super.key, required this.nome});

  final String nome;

  @override
  State<pagina_booking> createState() => _pagina_bookingState(nome);
}

class _pagina_bookingState extends State<pagina_booking> {
  String nome;

  _pagina_bookingState(this.nome);

  String? selectedOption;
  final _numeroTelefoneController = TextEditingController();
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusday = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  List<String> options = [
    'Automóvel',
    'Sáude',
    'Vida',
    'Financeiros',
    'Outros'
  ];

  final User? user = autenticacao().currentUser;

  String _userID() {
    return user?.email ?? 'User email';
  }

  String _userName() {
    return user?.displayName ?? 'User name';
  }

  void _marcarConsulta(bool dateSelected, bool timeSelected) {
    if (_dateSelected) {
      final DateTime dateSelected = _focusday;
      // Create an instance of Firestore
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Create a reference to the 'consultas' collection
      final CollectionReference consultasRef =
          firestore.collection('consultas');

      // Add a new document with the selected data
      consultasRef.add({
        'mediador': nome,
        'data': dateSelected.toString(),
        'horario': _currentIndex != null ? '${_currentIndex! + 9}:00' : null,
        'cliente': {
          'nome': _userName(),
          'email': _userID(),
          'telemovel': _numeroTelefoneController.text,
          'assunto': selectedOption,
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              vColor.withOpacity(0.8),
              vColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/bento_seguros_logo.png')),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Número de Telémovel',
                              hintText: '123456789',
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                color: bColor,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            controller: _numeroTelefoneController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Escolha uma opção',
                              border: OutlineInputBorder(),
                            ),

                            value: selectedOption, // valor inicial do campo
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption =
                                    newValue; // atualize o valor selecionado
                              });
                            },
                            items: options.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        _tableCalendar(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          child: Center(
                              child: Text(
                            "Selecione o Horário da Consulta",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  _isWeekend
                      ? SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 30),
                            alignment: Alignment.center,
                            child: Text(
                              "O escritório está fechado ao fim de semana, por favor seleciono outra data",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: czColor,
                              ),
                            ),
                          ),
                        )
                      : SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    _currentIndex = index;
                                    _timeSelected = true;
                                  });
                                  _marcarConsulta(
                                    _dateSelected,
                                    _timeSelected,
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _currentIndex == index
                                          ? wColor
                                          : bColor,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        _currentIndex == index ? wColor : null,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _currentIndex == index
                                          ? bColor
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: 8,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.5,
                          ),
                        ),
                  SliverToBoxAdapter(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: wColor,
                          ),
                          onPressed: () {
                            _marcarConsulta(
                              _dateSelected,
                              _timeSelected,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => confirmacao()));
                          },
                          child: Text(
                            'Marcar consulta',
                            style: TextStyle(
                              color: vColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
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
