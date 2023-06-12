import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto/colors.dart';
import '../login/verificacao.dart';
import 'bookin_page.dart';

class marcacoes extends StatelessWidget {
  final String id;
  final String nome;

  marcacoes({super.key, required this.id, required this.nome});

  final User? user = autenticacao().currentUser;

  @override
  Widget build(BuildContext context) {
    if (id == "0") {
      return Material(
        color: Color(0xFFD9E4EE),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bento_seguros_mediador1.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      vColor.withOpacity(0.9),
                      vColor.withOpacity(0),
                      vColor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Isabel Rodrigues",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: wColor,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "CEO Bento Seguros",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: wColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Marque a sua visita ao escritrório com a Isabel",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: vColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.head,
                        color: vColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Mediadora de Seguros",
                        style: TextStyle(
                            fontSize: 17, color: bColor.withOpacity(0.6)),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Com mais de 20 anos de experiência, a Isabel está sempre atenta às necessidades dos clientes, tendo como objetivo o desenvolimento próspero do legado familiar que assumiu. ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  if (user != null)
                    Material(
                      color: vColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pagina_booking(
                                        nome: nome,
                                      )));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            "Marcar Visita",
                            style: TextStyle(
                              color: wColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        )),
      );
    }
    if (id == "1") {
      return Material(
        color: Color(0xFFD9E4EE),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bento_seguros_mediador2.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      vColor.withOpacity(0.9),
                      vColor.withOpacity(0),
                      vColor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Marco Rodrigues",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: wColor,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Diretor Comercial",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: wColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Marque a sua visita ao escritrório com o Marco",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: vColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.head,
                        color: vColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Mediadora de Seguros",
                        style: TextStyle(
                            fontSize: 17, color: bColor.withOpacity(0.6)),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Com mais de 15 anos de experiência, sendo os ultimos 4 na família Bento Seguros, foi aqui que encontrou as ferramentas necessárias para desenvolver a parte comercial através de uma formação continua e cerrtificada, colocando todo o seu conhecimento ao seriço dos clientes. O Marco tem a sorte de fazer o que mais gosta e é muito feliz com a sua familía.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  if (user != null)
                    Material(
                      color: vColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pagina_booking(
                                        nome: nome,
                                      )));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            "Marcar Visita",
                            style: TextStyle(
                              color: wColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        )),
      );
    }
    if (id == "2") {
      return Material(
        color: Color(0xFFD9E4EE),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bento_seguros_mediador3.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        vColor.withOpacity(0.9),
                        vColor.withOpacity(0),
                        vColor.withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      SizedBox(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Lídia Ferreira",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: wColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Gestora de Sinistros",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: wColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Marque a sua visita ao escritrório com a Lídia",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: vColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          MdiIcons.head,
                          color: vColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Mediadora de Seguros",
                          style: TextStyle(
                              fontSize: 17, color: bColor.withOpacity(0.6)),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "'Desde 1999 que estou na área seguradora, o que me ajudou a encontrar o equilíbrio tanto familiar como profissional, no entanto foi na Bento Seguros que encontrei o ambiente perfeito para desempenhar as minhas funções da melhor forma. Para tal, muito contribui o contato com o público e a excelente relação existente entre a nossa equipa.''",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Material(
                      color: vColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pagina_booking(
                                        nome: nome,
                                      )));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            "Marcar Visita",
                            style: TextStyle(
                              color: wColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    if (id == "3") {
      return Material(
        color: Color(0xFFD9E4EE),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bento_seguros_mediador4.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        vColor.withOpacity(0.9),
                        vColor.withOpacity(0),
                        vColor.withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      SizedBox(
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sandra Noronha",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: wColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Gestora de Clientes",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: wColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Marque a sua visita ao escritrório com a Sandra",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: vColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          MdiIcons.head,
                          color: vColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Mediadora de Seguros",
                          style: TextStyle(
                              fontSize: 17, color: bColor.withOpacity(0.6)),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "''Desde 2014 a navegar na agitação constante da atividade seguradora, em que a maré em 2022 me trouxe até esta casa, a Bento Seguros, onde impera a serenidade, a amizade,a alegria e o profissionalismo, onde a busca da satisfação dos nossos clientes é uma constante. É a nossa determinação e a nossa união que, de uma forma sustentável, nos faz querer ir sempre mais além''",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Material(
                      color: vColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pagina_booking(
                                        nome: nome,
                                      )));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Text(
                            "Marcar Visita",
                            style: TextStyle(
                              color: wColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
