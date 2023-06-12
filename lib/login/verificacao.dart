import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto/login/pagina_login.dart';

import 'package:projeto/pagina_inicial/pagina_inicial.dart';

class autenticacao {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}

class pagina_verificacao extends StatefulWidget {
  const pagina_verificacao({super.key});

  @override
  State<pagina_verificacao> createState() => _pagina_verificacaoState();
}

class _pagina_verificacaoState extends State<pagina_verificacao> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => pagina_login(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => pagina_login(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
