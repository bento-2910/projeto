import 'package:flutter/material.dart';
import 'package:projeto/colors.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_2.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_5.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_6.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_inicial.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: wColor, size: 50.0),
                  Image.asset('assets/images/bento_seguros_logo.png',
                      width: 50.0)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Participações Amigáveis",
                style: TextStyle(
                    color: vColor, fontSize: 28.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pagina_part()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: vColor,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/bento_seguros_dadosacidente.png',
                                  ),
                                  SizedBox(height: 10.0),
                                  Center(
                                    child: Text(
                                      "Dados do\n Acidente",
                                      style: TextStyle(
                                        color: wColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => part_5()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: vColor,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/bento_seguros_dadosveiculo.png',
                                  ),
                                  SizedBox(height: 10.0),
                                  Center(
                                    child: Text(
                                      "Dados dos\n  Veículos",
                                      style: TextStyle(
                                        color: wColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: vColor,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/bento_seguros_circunstancias.png',
                                  width: 64.0,
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "Circustâncias",
                                  style: TextStyle(
                                    color: wColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => part_2()),
                        );
                      },
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: Card(
                          color: vColor,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/bento_seguros_acidente.png',
                                    width: 64.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    "Acidente",
                                    style: TextStyle(
                                      color: wColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
