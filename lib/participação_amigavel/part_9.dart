import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_10.dart';

import '../colors.dart';

class part_9 extends StatefulWidget {
  const part_9({super.key});

  @override
  State<part_9> createState() => _part_9State();
}

class _part_9State extends State<part_9> {
  bool _simSelecionado = false;
  bool _naoSelecionado = false;
  String get escolha {
    if (_simSelecionado) {
      return "Sim";
    } else if (_naoSelecionado) {
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
                          text: 'Dados referentes à seguradora do Veículo A',
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
                  height: size.height * .8,
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    //controller: _emailController,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Nome',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.numbers,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    // controller: _nameController,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Número de Apólice',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    // controller: _passwordController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Número de Carta Verde',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    //controller: _passwordConfirmController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          'Validade Apólice / Carta Verde',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Positioned(
                              top: 10,
                              left: 20,
                              child: Text(
                                'Dados referentes à Agência',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    // controller: _nameController,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Nome',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    // controller: _passwordController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Morada',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    //controller: _passwordConfirmController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Código-Postal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    // controller: _passwordController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'País',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    //controller: _passwordConfirmController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Número de Telémovel',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Positioned(
                              top: 10,
                              left: 20,
                              child: Text(
                                'Os danos materiais deste veículo estão cobertos pela apólice?',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Checkbox(
                                  value: _simSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _simSelecionado = value ?? false;
                                      _naoSelecionado = !_simSelecionado;
                                    });
                                  },
                                ),
                                Text("Sim"),
                                Checkbox(
                                  value: _naoSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      _naoSelecionado = value ?? false;
                                      _simSelecionado = !_naoSelecionado;
                                    });
                                  },
                                ),
                                Text("Não"),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => part_10()),
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
