import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto/colors.dart';
import 'package:projeto/consultas/mediadores.dart';

import '../login/verificacao.dart';

class home_page_cons extends StatelessWidget {
  final User? user = autenticacao().currentUser;

  String _userName() {
    return user?.displayName ?? 'User name';
  }

  List tipoConsulta = [
    "Automóvel",
    "Saúde",
    "Acidentes Pessoais",
    "Vida",
    "Financeiros",
    "Outros"
  ];

  List<Icon> consIcons = [
    Icon(MdiIcons.car, color: vColor, size: 30),
    Icon(MdiIcons.doctor, color: vColor, size: 30),
    Icon(MdiIcons.account, color: vColor, size: 30),
    Icon(MdiIcons.heart, color: vColor, size: 30),
    Icon(MdiIcons.cash, color: vColor, size: 30),
    Icon(MdiIcons.dotsHorizontal, color: vColor, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  vColor.withOpacity(0.8),
                  vColor,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Seja Bem-Vindo à",
                      style: TextStyle(
                        color: wColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Bento Seguros",
                      style: TextStyle(
                        color: wColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      _userName(),
                      style: TextStyle(
                        color: wColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Categorias",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: bColor.withOpacity(0.7)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: tipoConsulta.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: wColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: bColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  )
                                ]),
                            child: Center(child: consIcons[index]),
                          ),
                          SizedBox(height: 10),
                          Text(
                            tipoConsulta[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: bColor.withOpacity(0.7),
                            ),
                          )
                        ]);
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Os nosso mediadores",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: bColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  mediadores(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
