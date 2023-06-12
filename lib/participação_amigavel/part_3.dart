import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:projeto/participa%C3%A7%C3%A3o_amigavel/part_4.dart';

import '../colors.dart';

class part_3 extends StatefulWidget {
  const part_3({super.key});

  @override
  State<part_3> createState() => _part_3State();
}

class _part_3State extends State<part_3> {
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
                          text: 'Indique o País e a Locaziação do Acidente',
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
                  height: size.height * .25,
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
                      CSCPicker(
                        layout: Layout.vertical,
                        flagState: CountryFlag.DISABLE,
                        onCountryChanged: (country) {},
                        onStateChanged: (state) {},
                        onCityChanged: (city) {},
                        countryDropdownLabel: "País",
                        stateDropdownLabel: "Distrito",
                        cityDropdownLabel: "Cidade",
                        dropdownDialogRadius: 30,
                        searchBarRadius: 30,
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => part_4()),
                            );
                          },
                          child: Text(
                            'Avançar',
                            style: TextStyle(
                              color: wColor,
                            ),
                          ),
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
