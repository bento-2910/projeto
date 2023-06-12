import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_12.dart';

import '../colors.dart';

class part_11 extends StatefulWidget {
  const part_11({super.key});

  @override
  State<part_11> createState() => _part_11State();
}

class _part_11State extends State<part_11> {
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
                          text: 'Dados referentes ao condutor do Veículo A',
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
                  height: size.height * .70,
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
                                  Icons.calendar_today,
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
                                      hintText: 'Data de Nascimento',
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
                                    //controller: _passwordConfirmController,
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
                                      hintText: 'Número de Telefone',
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
                                    //controller: _passwordConfirmController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Número Licença de Condução',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.menu,
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
                                      hintText: 'Categoria',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
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
                                      hintText: 'Valido até',
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
                                          builder: (context) => part_12()),
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
