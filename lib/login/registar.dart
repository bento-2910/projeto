import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto/login/pagina_login.dart';
import '../colors.dart';
import 'verificacao.dart';

class pagina_registo extends StatefulWidget {
  const pagina_registo({super.key});

  @override
  State<pagina_registo> createState() => _pagina_registoState();
}

class _pagina_registoState extends State<pagina_registo> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final _firebaseAuth = FirebaseAuth.instance;

  registo() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      if (UserCredential != null) {
        userCredential.user!.updateDisplayName(_nameController.text);

        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const pagina_verificacao()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Crie uma senha mais forte'),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'email-already-in-user') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Este e-mail já foi cadastrado'),
          backgroundColor: Colors.red,
        ));
      }
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
                      text: 'Seja Bem-Vindo\n',
                      style: TextStyle(
                        fontSize: 32,
                        color: vColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'à Bento Seguros',
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
                        top: 10,
                        left: 20,
                        child: Text(
                          'Crie aqui a sua conta',
                          style: TextStyle(
                            fontSize: 20,
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
                                Icon(
                                  Icons.mail_outline,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    controller: _emailController,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Insira aqui o seu email',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
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
                                    controller: _nameController,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Insira o seu nome',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.key,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Insira aqui a sua password',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.key,
                                  color: czColor,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 300,
                                  child: TextFormField(
                                    controller: _passwordConfirmController,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: bColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Confirme a sua password',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Já tem conta? ',
                                  style: TextStyle(color: vColor),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => pagina_login()),
                                    );
                                  },
                                  child: Text(
                                    'Iniciar sessão',
                                    style: TextStyle(
                                        color: vColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    registo();
                                  },
                                  child: Text(
                                    'Registar',
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
