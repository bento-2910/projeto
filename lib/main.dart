import 'package:firebase_core/firebase_core.dart';
import 'package:projeto/colors.dart';
import 'package:projeto/login/registar.dart';
import 'package:projeto/pagina_inicial/pagina_inicial.dart';
import 'package:flutter/material.dart';
import 'package:projeto/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bento Seguros',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Welcome(),
    );
  }
}
