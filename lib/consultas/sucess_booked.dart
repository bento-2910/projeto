import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto/colors.dart';

import 'package:projeto/pagina_inicial/pagina_inicial.dart';

class confirmacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child:
                Lottie.asset('assets/json/bento_seguros_visita_sucesso.json'),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Marcação marcada com sucesso',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: vColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => inicio()),
                );
              },
              child: Text(
                'Voltar à página inicial',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
