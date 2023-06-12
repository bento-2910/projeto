import 'package:flutter/material.dart';
import 'package:projeto/colors.dart';
import 'package:projeto/pagina_inicial/pagina_inicial.dart';
import 'cons_homepage.dart';

class pagina_cons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
        child: Column(children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/bento_seguros_logo.png')),
          SizedBox(height: 50),
          Text(
            "Bem-vindos às marcações da Bento Seguros",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
          ),
          SizedBox(height: 10),
          Text("Aqui pode marcar a sua visita ao nosso escritório",
              style: TextStyle(
                color: wColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
          Expanded(
            child: SizedBox(height: 60),
          ),
          Material(
            color: wColor,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => home_page_cons()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Text(
                  "Clique para começar",
                  style: TextStyle(
                    color: vColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
