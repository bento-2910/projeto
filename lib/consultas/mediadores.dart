import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto/colors.dart';

import 'cons_marcacoes.dart';

class Mediador {
  final String nome;
  final String subtitulo;
  final String id;

  Mediador({required this.nome, required this.subtitulo, required this.id});
}

List<Mediador> mediador = [
  Mediador(
    id: "0",
    nome: "Isabel Rodrigues",
    subtitulo: "CEO da Bento Seguros",
  ),
  Mediador(
    id: "1",
    nome: "Marco Rodrigues",
    subtitulo: "Diretor Comercial",
  ),
  Mediador(
    id: "2",
    nome: "Lidia Ferreira",
    subtitulo: "Gestora de Sinistros",
  ),
  Mediador(
    id: "3",
    nome: "Sandra Noronha",
    subtitulo: "Gestora de Clientes",
  )
];

class mediadores extends StatelessWidget {
  const mediadores({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 521,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mediador.length,
        itemBuilder: (context, index) {
          final mediado = mediador[index];

          return Column(children: [
            Container(
              height: 411,
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFFF2F8FF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: czColor, blurRadius: 4, spreadRadius: 2),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => marcacoes(
                                        id: mediado.id,
                                        nome: mediado.nome,
                                      )));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/images/bento_seguros_mediador${index + 1}.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mediado.nome,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: vColor,
                          ),
                        ),
                        Text(
                          mediado.subtitulo,
                          style: TextStyle(
                            fontSize: 18,
                            color: bColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}
