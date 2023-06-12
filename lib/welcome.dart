import 'package:flutter/material.dart';
import 'package:projeto/colors.dart';

import 'package:projeto/pagina_inicial/pagina_inicial.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              vColor,
              vColor.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 350,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/bento_seguros_logo.png',
                      width: 300,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => inicio()),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: wColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: Text(
                          'Começar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
