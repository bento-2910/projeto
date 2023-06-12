import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_6.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_7.dart';

import '../colors.dart';

class part_6 extends StatefulWidget {
  const part_6({super.key});

  @override
  State<part_6> createState() => _part_6State();
}

class _part_6State extends State<part_6> {
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
                          text:
                              'Dados referentes ao detentor do seguro do Veículo B',
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
                  height: size.height * .45,
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
                                      hintText: 'Apelido',
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                    //controller: _passwordConfirmController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'NIF',
                                    ),
                                  ),
                                ),
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
                                          builder: (context) => part_7()),
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
