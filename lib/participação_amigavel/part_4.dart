import 'package:flutter/material.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/menu.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_5.dart';

import '../colors.dart';

class part_4 extends StatefulWidget {
  const part_4({Key? key}) : super(key: key);

  @override
  State<part_4> createState() => _part_4State();
}

class _part_4State extends State<part_4> {
  bool _simFeridosSelecionado = false;
  bool _naoFeridosSelecionado = false;
  bool _simDanosVeiculosSelecionado = false;
  bool _naoDanosVeiculosSelecionado = false;
  bool _simDanosObjetosSelecionado = false;
  bool _naoDanosObjetosSelecionado = false;

  String get escolha {
    if (_simFeridosSelecionado) {
      return "Sim";
    } else if (_naoFeridosSelecionado) {
      return "Não";
    } else {
      return "";
    }
  }

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
                      text: 'Participações Amigáveis\n',
                      style: TextStyle(
                        fontSize: 32,
                        color: vColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Danos Causados',
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
                  height: size.height * .35,
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
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          'Houve feridos? Mesmo ligeiros',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _simFeridosSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _simFeridosSelecionado = value ?? false;
                                      _naoFeridosSelecionado =
                                          !_simFeridosSelecionado;
                                    });
                                  },
                                ),
                                Text("Sim"),
                                Checkbox(
                                  value: _naoFeridosSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _naoFeridosSelecionado = value ?? false;
                                      _simFeridosSelecionado =
                                          !_naoFeridosSelecionado;
                                    });
                                  },
                                ),
                                Text("Não"),
                              ],
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Text(
                                'Houve danos materiais noutros veículos?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: _simDanosVeiculosSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _simDanosVeiculosSelecionado =
                                          value ?? false;
                                      _naoDanosVeiculosSelecionado =
                                          !_simDanosVeiculosSelecionado;
                                    });
                                  },
                                ),
                                Text("Sim"),
                                Checkbox(
                                  value: _naoDanosVeiculosSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _naoDanosVeiculosSelecionado =
                                          value ?? false;
                                      _simDanosVeiculosSelecionado =
                                          !_naoDanosVeiculosSelecionado;
                                    });
                                  },
                                ),
                                Text("Não"),
                              ],
                            ),
                            Positioned(
                              top: 20,
                              left: 50,
                              child: Text(
                                'Houve danos materiais noutros objetos?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: _simDanosObjetosSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _simDanosObjetosSelecionado =
                                          value ?? false;
                                      _naoDanosObjetosSelecionado =
                                          !_simDanosObjetosSelecionado;
                                    });
                                  },
                                ),
                                Text("Sim"),
                                Checkbox(
                                  value: _naoDanosObjetosSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _naoDanosObjetosSelecionado =
                                          value ?? false;
                                      _simDanosObjetosSelecionado =
                                          !_naoDanosObjetosSelecionado;
                                    });
                                  },
                                ),
                                Text("Não"),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => menu()),
                                    );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
