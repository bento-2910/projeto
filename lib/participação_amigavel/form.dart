import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:projeto/pagina_inicial/pagina_inicial.dart';

import '../colors.dart';

class FormDA extends StatefulWidget {
  const FormDA({Key? key}) : super(key: key);

  @override
  State<FormDA> createState() => _FormDAState();
}

class _FormDAState extends State<FormDA> {
  File? _imagemEmbateA;
  late Future<String?> embateAUrl;

  Future<String?> uploadImageToFirebase(File file) async {
    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final ref = storage.ref().child('images/${DateTime.now()}.jpg');
      final uploadTask = ref.putFile(file);
      final taskSnapshot = await uploadTask.whenComplete(() => null);
      final downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Erro ao carregar a imagem: $e');
      return null;
    }
  }

  int _currentStep = 0;
  bool _feridosSimSelecionado = false;
  bool _feridosNaoSelecionado = false;
  bool _danosVeiculosSimSelecionado = false;
  bool _danosVeiculosNaoSelecionado = false;
  bool _danosObjetosSimSelecionado = false;
  bool _danosObjetosNaoSelecionado = false;
  bool _testemunhasSimSelecionado = false;
  bool _testemunhasNaoSelecionado = false;
  bool _exibirCampoTestemunhas = false;
  bool _danosASimSelecionado = false;
  bool _danosANaoSelecionado = false;
  bool _danosBSimSelecionado = false;
  bool _danosBNaoSelecionado = false;
  bool isCompleted = false;
  bool _simSelecionado = false;
  bool _naoSelecionado = false;
  bool _estacionadoA = false;
  bool _sairEstA = false;
  bool _estacA = false;
  bool _sParqueA = false;
  bool _eParqueA = false;
  bool _eRotundaA = false;
  bool _cRotundaA = false;
  bool _tRotundaA = false;
  bool _mFilaA = false;
  bool _dRotundaA = false;
  bool _ultrapassarA = false;
  bool _vDireitaA = false;
  bool _vEsquerdaA = false;
  bool _recuarA = false;
  bool _circularA = false;
  bool _direitaA = false;
  bool _semaforoA = false;
  bool _estacionadoB = false;
  bool _sairEstB = false;
  bool _estacB = false;
  bool _sParqueB = false;
  bool _eParqueB = false;
  bool _eRotundaB = false;
  bool _cRotundaB = false;
  bool _tRotundaB = false;
  bool _mFilaB = false;
  bool _dRotundaB = false;
  bool _ultrapassarB = false;
  bool _vDireitaB = false;
  bool _vEsquerdaB = false;
  bool _recuarB = false;
  bool _circularB = false;
  bool _direitaB = false;
  bool _semaforoB = false;

  String get escolha {
    if (_simSelecionado) {
      return "Sim";
    } else if (_naoSelecionado) {
      return "Não";
    } else {
      return "";
    }
  }

  TextEditingController localizacaoController = TextEditingController();
  TextEditingController localController = TextEditingController();
  TextEditingController testemunhasController = TextEditingController();
  TextEditingController apelidoTSegVAController = TextEditingController();
  TextEditingController nomeTSegVAController = TextEditingController();
  TextEditingController moradaTSegVAController = TextEditingController();
  TextEditingController cpTSegVAController = TextEditingController();
  TextEditingController paisTSegVAController = TextEditingController();
  TextEditingController contactoTSegVAController = TextEditingController();
  TextEditingController nifTSegVAController = TextEditingController();
  TextEditingController marcaVAController = TextEditingController();
  TextEditingController matriculaVAController = TextEditingController();
  TextEditingController pMatriculaVAController = TextEditingController();
  TextEditingController matriculaRVAController = TextEditingController();
  TextEditingController paisMRVAController = TextEditingController();
  TextEditingController nomeSVAController = TextEditingController();
  TextEditingController apoliceSVAController = TextEditingController();
  TextEditingController numeroSVAController = TextEditingController();
  TextEditingController validadeSVAController = TextEditingController();
  TextEditingController nomeCondutorVAController = TextEditingController();
  TextEditingController moradaCondutorVAController = TextEditingController();
  TextEditingController cpCondutorVAController = TextEditingController();
  TextEditingController contactoCondutorVAController = TextEditingController();
  TextEditingController apelidoTSegVBController = TextEditingController();
  TextEditingController nomeTSegVBController = TextEditingController();
  TextEditingController moradaTSegVBController = TextEditingController();
  TextEditingController cpTSegVBController = TextEditingController();
  TextEditingController paisTSegVBController = TextEditingController();
  TextEditingController contactoTSegVBController = TextEditingController();
  TextEditingController nifTSegVBController = TextEditingController();
  TextEditingController marcaVBController = TextEditingController();
  TextEditingController matriculaVBController = TextEditingController();
  TextEditingController pMatriculaVBController = TextEditingController();
  TextEditingController matriculaRVBController = TextEditingController();
  TextEditingController paisMRVBController = TextEditingController();
  TextEditingController nomeSVBController = TextEditingController();
  TextEditingController apoliceSVBController = TextEditingController();
  TextEditingController numeroSVBController = TextEditingController();
  TextEditingController validadeSVBController = TextEditingController();
  TextEditingController nomeCondutorVBController = TextEditingController();
  TextEditingController moradaCondutorVBController = TextEditingController();
  TextEditingController cpCondutorVBController = TextEditingController();
  TextEditingController contactoCondutorVBController = TextEditingController();
  TextEditingController paisCondutorVAController = TextEditingController();
  TextEditingController paisVBController = TextEditingController();
  TextEditingController nomeSegVBController = TextEditingController();
  TextEditingController numeroSegVBController = TextEditingController();
  TextEditingController cvSegVBController = TextEditingController();
  TextEditingController validSegVBController = TextEditingController();
  TextEditingController nomeCVBController = TextEditingController();
  TextEditingController moradaCVBController = TextEditingController();
  TextEditingController cpCVBController = TextEditingController();
  TextEditingController paisCVBController = TextEditingController();
  TextEditingController contactoCVBController = TextEditingController();
  TextEditingController paisCondutorVBController = TextEditingController();

  List<Step> getSteps() => [
        Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
          title: Text('Dados Acidente'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: localizacaoController,
                decoration: InputDecoration(
                  labelText: 'Localização',
                ),
              ),
              TextFormField(
                controller: localController,
                decoration: InputDecoration(
                  labelText: 'Local',
                ),
              ),
              SizedBox(height: 10),
              Text('Houve Feridos, mesmo ligeiros?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _feridosSimSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _feridosSimSelecionado = value ?? false;
                        _feridosNaoSelecionado = !_feridosSimSelecionado;
                      });
                    },
                  ),
                  Text("Sim"),
                  Checkbox(
                    value: _feridosNaoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _feridosNaoSelecionado = value ?? false;
                        _feridosSimSelecionado = !_feridosNaoSelecionado;
                      });
                    },
                  ),
                  Text("Não"),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Houve danos fora dos veículos envolvidos no acidente?',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _danosVeiculosSimSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosVeiculosSimSelecionado = value ?? false;
                        _danosVeiculosNaoSelecionado =
                            !_danosVeiculosSimSelecionado;
                      });
                    },
                  ),
                  Text("Sim"),
                  Checkbox(
                    value: _danosVeiculosNaoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosVeiculosNaoSelecionado = value ?? false;
                        _danosVeiculosSimSelecionado =
                            !_danosVeiculosNaoSelecionado;
                      });
                    },
                  ),
                  Text("Não"),
                ],
              ),
              SizedBox(height: 10),
              Text('Houve danos em objetos que não são veículos?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _danosObjetosSimSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosObjetosSimSelecionado = value ?? false;
                        _danosObjetosNaoSelecionado =
                            !_danosObjetosSimSelecionado;
                      });
                    },
                  ),
                  Text("Sim"),
                  Checkbox(
                    value: _danosObjetosNaoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosObjetosNaoSelecionado = value ?? false;
                        _danosObjetosSimSelecionado =
                            !_danosObjetosNaoSelecionado;
                      });
                    },
                  ),
                  Text("Não"),
                ],
              ),
              SizedBox(height: 10),
              Text('Houve Testemunhas?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _testemunhasSimSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _testemunhasSimSelecionado = value ?? false;
                        _testemunhasNaoSelecionado =
                            !_testemunhasSimSelecionado;
                        _exibirCampoTestemunhas = _testemunhasSimSelecionado;
                      });
                    },
                  ),
                  Text("Sim"),
                  Checkbox(
                    value: _testemunhasNaoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _testemunhasNaoSelecionado = value ?? false;
                        _testemunhasSimSelecionado =
                            !_testemunhasNaoSelecionado;
                        _exibirCampoTestemunhas = _testemunhasSimSelecionado;
                      });
                    },
                  ),
                  Text("Não"),
                ],
              ),
              if (_exibirCampoTestemunhas)
                TextFormField(
                  controller: testemunhasController,
                  decoration: InputDecoration(
                    labelText: 'Indique os nomes das testemunhas',
                  ),
                ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1,
          title: Text('Dados Veiculo A'),
          content: Column(
            children: [
              Text('Dados Tomador Seguro'),
              TextFormField(
                controller: apelidoTSegVAController,
                decoration: InputDecoration(
                  labelText: 'Apelido',
                ),
              ),
              TextFormField(
                controller: nomeTSegVAController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: moradaTSegVAController,
                decoration: InputDecoration(
                  labelText: 'Morada',
                ),
              ),
              TextFormField(
                controller: cpTSegVAController,
                decoration: InputDecoration(
                  labelText: 'Código-Postal',
                ),
              ),
              TextFormField(
                controller: paisTSegVAController,
                decoration: InputDecoration(
                  labelText: 'País',
                ),
              ),
              TextFormField(
                controller: contactoTSegVAController,
                decoration: InputDecoration(
                  labelText: 'Telefone/Email',
                ),
              ),
              TextFormField(
                controller: nifTSegVAController,
                decoration: InputDecoration(
                  labelText: 'NIF',
                ),
              ),
              SizedBox(height: 50),
              Text('Informações Veículo'),
              TextFormField(
                controller: marcaVAController,
                decoration: InputDecoration(
                  labelText: 'Marca, Modelo',
                ),
              ),
              TextFormField(
                controller: matriculaVAController,
                decoration: InputDecoration(
                  labelText: 'Matricula',
                ),
              ),
              TextFormField(
                controller: pMatriculaVAController,
                decoration: InputDecoration(
                  labelText: 'País de Matrícula',
                ),
              ),
              SizedBox(height: 50),
              Text('Informações Reboque'),
              TextFormField(
                controller: matriculaRVAController,
                decoration: InputDecoration(
                  labelText: 'Matricula',
                ),
              ),
              TextFormField(
                controller: paisMRVAController,
                decoration: InputDecoration(
                  labelText: 'País de Matrícula',
                ),
              ),
              SizedBox(height: 50),
              Text('Informações Seguro'),
              TextFormField(
                controller: nomeSVAController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: apoliceSVAController,
                decoration: InputDecoration(
                  labelText: 'Número de Apólice',
                ),
              ),
              TextFormField(
                controller: numeroSVAController,
                decoration: InputDecoration(
                  labelText: 'Número Carta Verde',
                ),
              ),
              TextFormField(
                controller: validadeSVAController,
                decoration: InputDecoration(
                  labelText: 'Válido até',
                ),
              ),
              SizedBox(height: 25),
              Text('Dados Condutor'),
              TextFormField(
                controller: nomeCondutorVAController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: moradaCondutorVAController,
                decoration: InputDecoration(
                  labelText: 'Morada',
                ),
              ),
              TextFormField(
                controller: cpCondutorVAController,
                decoration: InputDecoration(
                  labelText: 'Código-Postal',
                ),
              ),
              TextFormField(
                controller: paisCondutorVAController,
                decoration: InputDecoration(
                  labelText: 'País',
                ),
              ),
              TextFormField(
                controller: contactoCondutorVAController,
                decoration: InputDecoration(
                  labelText: 'Telefone/Email',
                ),
              ),
              SizedBox(height: 10),
              Text(
                  'Os danos materiais deste veículo estão cobertos pela apólice?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _danosASimSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosASimSelecionado = value ?? false;
                        _danosANaoSelecionado = !_danosASimSelecionado;
                      });
                    },
                  ),
                  Text("Sim"),
                  Checkbox(
                    value: _danosANaoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosANaoSelecionado = value ?? false;
                        _danosASimSelecionado = !_danosANaoSelecionado;
                      });
                    },
                  ),
                  Text("Não"),
                ],
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 2,
          title: Text('Dados Veiculo B'),
          content: Column(
            children: [
              Text('Dados Tomador Seguro'),
              TextFormField(
                controller: apelidoTSegVBController,
                decoration: InputDecoration(
                  labelText: 'Apelido',
                ),
              ),
              TextFormField(
                controller: nomeTSegVBController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: moradaTSegVBController,
                decoration: InputDecoration(
                  labelText: 'Morada',
                ),
              ),
              TextFormField(
                controller: cpTSegVBController,
                decoration: InputDecoration(
                  labelText: 'Código-Postal',
                ),
              ),
              TextFormField(
                controller: paisTSegVBController,
                decoration: InputDecoration(
                  labelText: 'País',
                ),
              ),
              TextFormField(
                controller: contactoTSegVBController,
                decoration: InputDecoration(
                  labelText: 'Telefone/Email',
                ),
              ),
              TextFormField(
                controller: nifTSegVBController,
                decoration: InputDecoration(
                  labelText: 'NIF',
                ),
              ),
              SizedBox(height: 50),
              Text('Informações Veículo'),
              TextFormField(
                controller: marcaVBController,
                decoration: InputDecoration(
                  labelText: 'Marca, Modelo',
                ),
              ),
              TextFormField(
                controller: matriculaVBController,
                decoration: InputDecoration(
                  labelText: 'Matricula',
                ),
              ),
              TextFormField(
                controller: paisVBController,
                decoration: InputDecoration(
                  labelText: 'País de Matrícula',
                ),
              ),
              SizedBox(height: 50),
              Text('Informações Reboque'),
              TextFormField(
                controller: matriculaRVBController,
                decoration: InputDecoration(
                  labelText: 'Matricula',
                ),
              ),
              TextFormField(
                controller: paisMRVBController,
                decoration: InputDecoration(
                  labelText: 'País de Matrícula',
                ),
              ),
              SizedBox(height: 50),
              Text('Informações Seguro'),
              TextFormField(
                controller: nomeSegVBController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: numeroSegVBController,
                decoration: InputDecoration(
                  labelText: 'Número de Apólice',
                ),
              ),
              TextFormField(
                controller: cvSegVBController,
                decoration: InputDecoration(
                  labelText: 'Número Carta Verde',
                ),
              ),
              TextFormField(
                controller: validSegVBController,
                decoration: InputDecoration(
                  labelText: 'Válido até',
                ),
              ),
              SizedBox(height: 25),
              Text('Dados Condutor'),
              TextFormField(
                controller: nomeCondutorVBController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                controller: moradaCondutorVBController,
                decoration: InputDecoration(
                  labelText: 'Morada',
                ),
              ),
              TextFormField(
                controller: cpCondutorVBController,
                decoration: InputDecoration(
                  labelText: 'Código-Postal',
                ),
              ),
              TextFormField(
                controller: paisCondutorVBController,
                decoration: InputDecoration(
                  labelText: 'País',
                ),
              ),
              TextFormField(
                controller: contactoCondutorVBController,
                decoration: InputDecoration(
                  labelText: 'Telefone/Email',
                ),
              ),
              SizedBox(height: 10),
              Text(
                  'Os danos materiais deste veículo estão cobertos pela apólice?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _danosBSimSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosBSimSelecionado = value ?? false;
                        _danosBNaoSelecionado = !_danosBSimSelecionado;
                      });
                    },
                  ),
                  Text("Sim"),
                  Checkbox(
                    value: _danosBNaoSelecionado,
                    onChanged: (value) {
                      setState(() {
                        _danosBNaoSelecionado = value ?? false;
                        _danosBSimSelecionado = !_danosBNaoSelecionado;
                      });
                    },
                  ),
                  Text("Não"),
                ],
              ),
            ],
          ),
        ),
        /* Step(
          state: _currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 3,
          title: Text('Ponto de Embate Veículo A'),
          content: Column(
            children: [
              Text(
                'Por favor introduza uma fotografia que demonstre onde o veiculo A embateu',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final action = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Escolher foto'),
                          content: Text('Selecione a origem da foto:'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'gallery'),
                              child: Text('Galeria'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'camera'),
                              child: Text('Câmera'),
                            ),
                          ],
                        );
                      },
                    );

                    if (action == null) {
                      // Nenhuma opção selecionada
                      return;
                    }

                    final imagePicker = ImagePicker();
                    final pickedFile = await imagePicker.pickImage(
                      source: action == 'gallery'
                          ? ImageSource.gallery
                          : ImageSource.camera,
                    );

                    if (pickedFile == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Nenhuma foto selecionada'),
                        ),
                      );
                      return;
                    }

                    final path = pickedFile.path;
                    final fileName = path.split('/').last;

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Imagem selecionada'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.file(File(path)),
                                SizedBox(height: 16),
                                Text('Nome do arquivo: $fileName'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () async {
                                final urlEmbateA =
                                    await uploadImageToFirebase(File(path));

                                if (urlEmbateA != null) {
                                  setState(() {
                                    embateAUrl = Future.value(urlEmbateA);
                                  });
                                }

                                Navigator.pop(context);
                              },
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Introduzir Imagem'),
                ),
              ),
            ],
          ),
        ),*/
        Step(
          state: _currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 3,
          title: Text('Ponto de Embate Veículo A'),
          content: Column(
            children: [
              Text(
                'Por favor introduza uma fotografia que demonstre onde o veiculo A embateu',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final action = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Escolher foto'),
                          content: Text('Selecione a origem da foto:'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'gallery'),
                              child: Text('Galeria'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'camera'),
                              child: Text('Câmera'),
                            ),
                          ],
                        );
                      },
                    );

                    if (action == null) {
                      // Nenhuma opção selecionada
                      return;
                    }

                    final imagePicker = ImagePicker();
                    final pickedFile = await imagePicker.pickImage(
                      source: action == 'gallery'
                          ? ImageSource.gallery
                          : ImageSource.camera,
                    );

                    if (pickedFile == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Nenhuma foto selecionada'),
                        ),
                      );
                      return;
                    }

                    final path = pickedFile.path;
                    final fileName = path.split('/').last;

                    // Exibir a imagem selecionada na aplicação e opção de confirmação
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Imagem selecionada'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.file(File(path)),
                                SizedBox(height: 16),
                                Text('Nome do arquivo: $fileName'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Lógica para confirmar o uso da imagem
                                // ...
                                Navigator.pop(context);
                              },
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Introduzir Imagem'),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 4,
          title: Text('Ponto de Embate Veículo B'),
          content: Column(
            children: [
              Text(
                'Por favor introduza uma fotografia que demonstre onde o veiculo B embateu',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final action = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Escolher foto'),
                          content: Text('Selecione a origem da foto:'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'gallery'),
                              child: Text('Galeria'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'camera'),
                              child: Text('Câmera'),
                            ),
                          ],
                        );
                      },
                    );

                    if (action == null) {
                      // Nenhuma opção selecionada
                      return;
                    }

                    final imagePicker = ImagePicker();
                    final pickedFile = await imagePicker.pickImage(
                      source: action == 'gallery'
                          ? ImageSource.gallery
                          : ImageSource.camera,
                    );

                    if (pickedFile == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Nenhuma foto selecionada'),
                        ),
                      );
                      return;
                    }

                    final path = pickedFile.path;
                    final fileName = path.split('/').last;

                    // Exibir a imagem selecionada na aplicação e opção de confirmação
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Imagem selecionada'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.file(File(path)),
                                SizedBox(height: 16),
                                Text('Nome do arquivo: $fileName'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Lógica para confirmar o uso da imagem
                                // ...
                                Navigator.pop(context);
                              },
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Introduzir Imagem'),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 5 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 5,
          title: Text('Circunstâncias'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Veículo A',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CheckboxListTile(
                title: Text('Estava Estacioando / Parado'),
                value: _estacionadoA,
                onChanged: (value) {
                  setState(() {
                    _estacionadoA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Saia de um estacionamento / Abria uma porta'),
                value: _sairEstA,
                onChanged: (value) {
                  setState(() {
                    _sairEstA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Ia a estacionar'),
                value: _estacA,
                onChanged: (value) {
                  setState(() {
                    _estacA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Saia de um parque de um estacionamento, de um local privado ou de um caminho particular'),
                value: _sParqueA,
                onChanged: (value) {
                  setState(() {
                    _sParqueA = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text(
                    'Entrava num parque de um estacionamento, local privado ou num caminho particular'),
                value: _eParqueA,
                onChanged: (value) {
                  setState(() {
                    _eParqueA = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title:
                    Text('Entrava numa rotunda ou praça de sentido giratório'),
                value: _eRotundaA,
                onChanged: (value) {
                  setState(() {
                    _eRotundaA = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text(
                    'Circulava numa rotunda ou praça de sentido giratório'),
                value: _cRotundaA,
                onChanged: (value) {
                  setState(() {
                    _cRotundaA = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text(
                    'Embateu na tarseira de um veículo de outro veículo que circulava no mesmo sentido e na mesma fila'),
                value: _tRotundaA,
                onChanged: (value) {
                  setState(() {
                    _tRotundaA = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title:
                    Text('Circulava no mesmo sentido mas numa fila diferente'),
                value: _dRotundaA,
                onChanged: (value) {
                  setState(() {
                    _dRotundaA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Mudava de fila'),
                value: _mFilaA,
                onChanged: (value) {
                  setState(() {
                    _mFilaA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Ultrapassava'),
                value: _ultrapassarA,
                onChanged: (value) {
                  setState(() {
                    _ultrapassarA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Virava à direita'),
                value: _vDireitaA,
                onChanged: (value) {
                  setState(() {
                    _vDireitaA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Virava à esquerda'),
                value: _vEsquerdaA,
                onChanged: (value) {
                  setState(() {
                    _vEsquerdaA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Recuava'),
                value: _recuarA,
                onChanged: (value) {
                  setState(() {
                    _recuarA = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Circulava na parte da faixa de rodagem reservada à circulação em sentido contrário'),
                value: _circularA,
                onChanged: (value) {
                  setState(() {
                    _circularA = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text(
                    'Apresentava-se pela direita (num cruzamento ou entrocamento)'),
                value: _direitaA,
                onChanged: (value) {
                  setState(() {
                    _direitaA = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text(
                    'Não respeitou um sinal de dar prioridade ou um semáforo vermelho'),
                value: _semaforoA,
                onChanged: (value) {
                  setState(() {
                    _semaforoA = value!;
                  });
                },
              ),

              SizedBox(height: 50), // Espaçamento entre as colunas

              Text(
                'Veículo B',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Estava Estacionado / Parado'),
                value: _estacionadoB,
                onChanged: (value) {
                  setState(() {
                    _estacionadoB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Saia de um estacionamento / Abria uma porta'),
                value: _sairEstB,
                onChanged: (value) {
                  setState(() {
                    _sairEstB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Ia a estacionar'),
                value: _estacB,
                onChanged: (value) {
                  setState(() {
                    _estacB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Saia de um parque de um estacionamento, de um local privado ou de um caminho particular'),
                value: _sParqueB,
                onChanged: (value) {
                  setState(() {
                    _sParqueB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Entrava num parque de um estacionamento, local privado ou num caminho particular'),
                value: _eParqueB,
                onChanged: (value) {
                  setState(() {
                    _eParqueB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title:
                    Text('Entrava numa rotunda ou praça de sentido giratório'),
                value: _eRotundaB,
                onChanged: (value) {
                  setState(() {
                    _eRotundaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Circulava numa rotunda ou praça de sentido giratório'),
                value: _cRotundaB,
                onChanged: (value) {
                  setState(() {
                    _cRotundaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Embateu na tarseira de um veículo de outro veículo que circulava no mesmo sentido e na mesma fila'),
                value: _tRotundaB,
                onChanged: (value) {
                  setState(() {
                    _tRotundaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title:
                    Text('Circulava no mesmo sentido mas numa fila diferente'),
                value: _dRotundaB,
                onChanged: (value) {
                  setState(() {
                    _dRotundaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Mudava de fila'),
                value: _mFilaB,
                onChanged: (value) {
                  setState(() {
                    _mFilaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Ultrapassava'),
                value: _ultrapassarB,
                onChanged: (value) {
                  setState(() {
                    _ultrapassarB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Virava à direita'),
                value: _vDireitaB,
                onChanged: (value) {
                  setState(() {
                    _vDireitaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Virava à esquerda'),
                value: _vEsquerdaB,
                onChanged: (value) {
                  setState(() {
                    _vEsquerdaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Recuava'),
                value: _recuarB,
                onChanged: (value) {
                  setState(() {
                    _recuarB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Circulava na parte da faixa de rodagem reservada à circulação em sentido contrário'),
                value: _circularB,
                onChanged: (value) {
                  setState(() {
                    _circularB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Apresentava-se pela direita (num cruzamento ou entrocamento)'),
                value: _direitaB,
                onChanged: (value) {
                  setState(() {
                    _direitaB = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                    'Não respeitou um sinal de dar prioridade ou um semáforo vermelho'),
                value: _semaforoB,
                onChanged: (value) {
                  setState(() {
                    _semaforoB = value!;
                  });
                },
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 6 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 6,
          title: Text('Esquema Acidente'),
          content: Column(
            children: [
              Text(
                'Por favor introduza uma fotografia que demonstre como decorreu o acidente',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final action = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Escolher foto'),
                          content: Text('Selecione a origem da foto:'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'gallery'),
                              child: Text('Galeria'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'camera'),
                              child: Text('Câmera'),
                            ),
                          ],
                        );
                      },
                    );

                    if (action == null) {
                      // Nenhuma opção selecionada
                      return;
                    }

                    final imagePicker = ImagePicker();
                    final pickedFile = await imagePicker.pickImage(
                      source: action == 'gallery'
                          ? ImageSource.gallery
                          : ImageSource.camera,
                    );

                    if (pickedFile == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Nenhuma foto selecionada'),
                        ),
                      );
                      return;
                    }

                    final path = pickedFile.path;
                    final fileName = path.split('/').last;

                    // Exibir a imagem selecionada na aplicação e opção de confirmação
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Imagem selecionada'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.file(File(path)),
                                SizedBox(height: 16),
                                Text('Nome do arquivo: $fileName'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Lógica para confirmar o uso da imagem
                                // ...
                                Navigator.pop(context);
                              },
                              child: Text('Confirmar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Introduzir Imagem'),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Dados Condutor',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              TextFormField(
                //controller: localController,
                decoration: InputDecoration(
                  labelText: 'Introduza informações extra sobre o acidente',
                ),
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep == 7 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 7,
          title: Text('Confirmação'),
          content: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Por favor, confirme os dados abaixo:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: vColor,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Dados Acidente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: vColor,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Localização',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${localizacaoController.text}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Local',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${localController.text}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Houve Feridos? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${_feridosSimSelecionado ? 'Sim' : 'Não'}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text:
                      'Houve danos fora dos veículos envolvidos no acidente? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${_danosVeiculosSimSelecionado ? 'Sim' : 'Não'}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Houve danos em objetos que não são veículos? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${_feridosSimSelecionado ? 'Sim' : 'Não'}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Houve Testemunhas? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${_testemunhasSimSelecionado ? 'Sim' : 'Não'}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Dados Veículos A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: vColor,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Dados Tomador Seguro A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Apelido',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${apelidoTSegVAController.text}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Nome',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nomeTSegVAController.text}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Morada',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${moradaTSegVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Código-Postal',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${cpTSegVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${paisTSegVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Contacto',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${contactoTSegVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'NIF',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nifTSegVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Informações Veículo A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Marca',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${marcaVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Matrícula',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${matriculaVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País de Matricula',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${pMatriculaVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Dados Reboque Veículo A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Matricula Reboque',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${matriculaRVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País de Matricula',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${paisMRVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Informações Seguro Veículo A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Nome',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nomeSVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Número de Apólice',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${apoliceSVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Número de Carta Verde',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${numeroSVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Válido até',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${validadeSVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Dados Condutor Veículo A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Nome',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nomeCondutorVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Morada',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${moradaCondutorVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Código-Postal',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${cpCondutorVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${paisCondutorVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Contacto',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${contactoCondutorVAController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text:
                      'Os danos materiais deste veículo estão cobertos pela apólice? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${_danosASimSelecionado ? 'Sim' : 'Não'}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Dados Veículos B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: vColor,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Dados Tomador Seguro B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Apelido',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${apelidoTSegVBController.text}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Nome',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nomeTSegVBController.text}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Morada',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${moradaTSegVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Código-Postal',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${cpTSegVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${paisTSegVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Contacto',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${contactoTSegVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'NIF',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nifTSegVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Informações Veículo B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Marca',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${marcaVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Matrícula',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${matriculaVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País de Matricula',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${pMatriculaVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Dados Reboque Veículo B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Matricula Reboque',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${matriculaRVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País de Matricula',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${paisMRVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Informações Seguro Veículo B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Nome',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nomeSVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Número de Apólice',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${apoliceSVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Número de Carta Verde',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${numeroSVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Válido até',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${validadeSVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Dados Condutor Veículo B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Nome',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${nomeCondutorVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Morada',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${moradaCondutorVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Código-Postal',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${cpCondutorVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'País',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${paisCondutorVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Contacto',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${contactoCondutorVBController.text}',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text:
                      'Os danos materiais deste veículo estão cobertos pela apólice? ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: ': ${_danosBSimSelecionado ? 'Sim' : 'Não'}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Confirmar dados'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              'Ao confirmar estes dados está a confirmar o consentimento do preenchimento desta declaração amigável'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            DateTime agora = DateTime.now();
                            String horaAcontecimento =
                                '${agora.hour}:${agora.minute}:${agora.second}';
                            try {
                              await FirebaseFirestore.instance
                                  .collection('Declaração Amigável')
                                  .add({
                                'Informações Acidente':
                                    'Informações relativas ao Acidente',
                                'dataAcidente': agora,
                                'hora': horaAcontecimento,
                                'localização': localizacaoController.text,
                                'local': localController.text,
                                'feridos':
                                    _danosASimSelecionado ? 'Sim' : 'Não',
                                'danosExtraAcidente':
                                    _danosVeiculosSimSelecionado
                                        ? 'Sim'
                                        : 'Não',
                                'testemunhas':
                                    _testemunhasSimSelecionado ? 'Sim' : 'Não',
                                'testemunhas_detalhes':
                                    testemunhasController.text,
                                'veiculoA': 'Dados Referentes ao Veículo A',
                                'Dados_Tomador_Seguro A':
                                    'Dados referentes ao tomador do seguro do Veiculo A',
                                'tomador_apelidoVA':
                                    apelidoTSegVAController.text,
                                'tomador_nomeVA': nomeTSegVAController.text,
                                'tomador_moradaVA': moradaTSegVAController.text,
                                'tomador_cpVA': cpTSegVAController.text,
                                'tomador_paisVA': paisTSegVAController.text,
                                'tomador_NIFVA': nifTSegVAController.text,
                                'marca_VA': marcaVAController.text,
                                'matricula_VA': matriculaVAController.text,
                                'paisMatricula_VA': pMatriculaVAController.text,
                                'reboque_VA':
                                    'Informações relativas ao reboque do VA',
                                'matricula_RVA': matriculaRVAController.text,
                                'pais_matriculaRVA': paisMRVAController.text,
                                'Informações Seguro A':
                                    'Dados referentes ao seguro do veículo A',
                                'nome_seguroVA': nomeSVAController.text,
                                'Apo_SVA': apoliceSVAController.text,
                                'num_CVVA': numeroSVAController.text,
                                'valido_ate': validadeSVAController.text,
                                'Dados Condutor':
                                    'Dados referentes ao condutor do veículo A',
                                'condutor_nomeVA':
                                    nomeCondutorVAController.text,
                                'condutor_moradaVA':
                                    moradaCondutorVAController.text,
                                'condutor_CPVA': cpCondutorVAController.text,
                                'condutor_paisVA':
                                    paisCondutorVAController.text,
                                'condutor_contactoVA':
                                    contactoCondutorVAController.text,
                                'cobertura_seguro A':
                                    _danosASimSelecionado ? 'Sim' : 'Não',
                                'veiculoB': 'Dados Referentes ao Veículo B',
                                'Dados_Tomador_SeguroB':
                                    'Dados referentes ao tomador do seguro do Veiculo B',
                                'tomador_apelidoVB':
                                    apelidoTSegVBController.text,
                                'tomador_nomeVB': nomeTSegVBController.text,
                                'tomador_moradaVB': moradaTSegVBController.text,
                                'tomador_cpVB': cpTSegVBController.text,
                                'tomador_paisVB': paisTSegVBController.text,
                                'tomador_NIFVB': nifTSegVBController.text,
                                'marca_VB': marcaVBController.text,
                                'matricula_VB': matriculaVBController.text,
                                'paisMatricula_VB': pMatriculaVBController.text,
                                'reboque_VB':
                                    'Informações relativas ao reboque do Veículo B',
                                'matricula_RVB': matriculaRVBController.text,
                                'pais_matriculaRVB': paisMRVBController.text,
                                'Informações Seguro B':
                                    'Dados referentes ao seguro do veículo B',
                                'nome_seguroVB': nomeSVBController.text,
                                'Apo_SVB': apoliceSVBController.text,
                                'num_CVVB': numeroSVBController.text,
                                'valido_ate B': validadeSVBController.text,
                                'Dados Condutor B':
                                    'Dados referentes ao condutor do veículo B',
                                'condutor_nomeVB':
                                    nomeCondutorVBController.text,
                                'condutor_moradaVB':
                                    moradaCondutorVBController.text,
                                'condutor_CPVB': cpCondutorVBController.text,
                                'condutor_paisVB':
                                    paisCondutorVBController.text,
                                'condutor_contactoVB':
                                    contactoCondutorVBController.text,
                                'cobertura_seguro B':
                                    _danosBSimSelecionado ? 'Sim' : 'Não',
                                'Embate Veículo A': await embateAUrl,
                              });

                              print('Declaração Amigável enviada com sucesso');
                            } catch (error) {
                              print('Erro ao enviar os dados: $error');
                            }

                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => inicio(),
                              ),
                            );
                          },
                          child: Text('Confirmar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Confirmar'),
              ),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Declarações Amigáveis'),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: vColor)),
        child: Stepper(
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: _currentStep,
          onStepContinue: () {
            final bool isLastStep = _currentStep == getSteps().length - 1;
            if (isLastStep) {
              setState(() => isCompleted = true);
              print('Completed');
            } else {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepCancel: () {
            if (_currentStep == 0) {
              return null;
            } else {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Próximo'),
                      onPressed: details.onStepContinue,
                    ),
                  ),
                  SizedBox(width: 12),
                  if (_currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Voltar'),
                        onPressed: details.onStepCancel,
                      ),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
