import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:projeto/colors.dart';
import 'package:projeto/login/verificacao.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/menu.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_inicial.dart';
import '../consultas/mediadores.dart';
import '../login/pagina_login.dart';

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

class inicio extends StatefulWidget {
  const inicio({super.key});

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  final User? user = autenticacao().currentUser;
  void _terminar_sessao() async {
    bool _isAuthenticated = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Tem certeza que deseja terminar sessão?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Sim"),
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await FirebaseAuth.instance.signOut();
                } catch (e) {
                  print('Erro ao terminar sessão: $e');
                }
                setState(() {
                  _isAuthenticated = false;
                });
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => inicio(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  String _userName() {
    return user?.displayName ?? 'User name';
  }

  List tipoConsulta = [
    "Automóvel",
    "Saúde",
    "Acid. Pessoais",
    "Vida",
    "Financeiros",
    "Outros"
  ];

  List<Icon> consIcons = [
    Icon(MdiIcons.car, color: vColor, size: 30),
    Icon(MdiIcons.doctor, color: vColor, size: 30),
    Icon(MdiIcons.account, color: vColor, size: 30),
    Icon(MdiIcons.heart, color: vColor, size: 30),
    Icon(MdiIcons.cash, color: vColor, size: 30),
    Icon(MdiIcons.dotsHorizontal, color: vColor, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            if (user != null)
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá, ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            _userName(),
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: vColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: PopUpMen(
                          menuList: [
                            PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.logout),
                                title: Text('Terminar Sessão'),
                                onTap: () {
                                  _terminar_sessao();
                                },
                              ),
                            )
                          ],
                          icon: Icon(Icons.logout),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            SizedBox(height: 25),
            if (user == null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 163, 163, 163),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 150,
                          width: 125,
                          child: Image.asset(
                              'assets/images/bento_seguros_logo.png')),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seja Bem-Vindo à Bento-Seguros',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Para começar por favor faça login',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pagina_login()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: vColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: wColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            SizedBox(height: 25),
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tipoConsulta.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: wColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: bColor,
                              blurRadius: 4,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Center(child: consIcons[index]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      tipoConsulta[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: bColor.withOpacity(0.7),
                      ),
                    )
                  ]);
                },
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Os nosso mediadores",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: bColor.withOpacity(0.7),
                ),
              ),
            ),
            mediadores(),
            if (user != null)
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Faça aqui as suas participações amigáveis",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: bColor.withOpacity(0.7),
                  ),
                ),
              ),
            SizedBox(height: 10),
            if (user != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: czColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 150,
                          width: 125,
                          child: Image.asset(
                              'assets/images/bento_seguros_logo.png')),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Teve um acidente?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Aqui pode fazer a sua declaração amigável',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 8),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => menu()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: vColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'Participar',
                                    style: TextStyle(color: wColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
