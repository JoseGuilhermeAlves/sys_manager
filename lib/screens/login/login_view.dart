import 'dart:async';
import 'dart:io' as IO;
import 'dart:io';

//import 'package:conferencia_de_entrada/screens/oc_table.dart/oc_table_page.dart';
//import 'package:conferencia_de_entrada/utils/services/autenticacao/autenticacao_soap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sys_manager/screens/menu/menu_view.dart';

class Login extends StatefulWidget {
  Login();

  set servidor(String servidor) {}

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = '', _password = '';

  String _response = '';

  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  TextEditingController _controllerDialog = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dialogFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    //Get.lazyPut(() => Autenticacao());
    Get.put(Menu());
    super.initState();
  }

  checkVersion(var version) async {
    if (IO.Platform.isAndroid) {
      print("its android!");
      /* final newVersion = NewVersion(
        androidId: "br.com.nlphd.PhdInventoryManager",
      );

      newVersion.showAlertIfNecessary(context: context);*/
    } else if (IO.Platform.isWindows) {
      /*    updater.updateWindows();
       Directory tempDir = await getTemporaryDirectory();
    File testFile = File(tempDir.path.toString() + "/confirmRelease.txt");
    testFile.writeAsString("FUNCIONA RELEASE");
    updater.updateWindows(version);
    print("Version check!");*/
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Scaffold(
            appBar: AppBar(
                elevation: 15,
                title: Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey.shade200, fontWeight: FontWeight.bold),
                ),
                iconTheme: IconThemeData(color: Colors.grey.shade200),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  color: Colors.grey.shade200,
                ),
                centerTitle: true,
                backgroundColor: Colors.grey.shade800),
            backgroundColor: Colors.grey.shade300,
            body: Form(
                key: _globalKey,
                child:
                    Stack(alignment: Alignment.centerLeft, children: <Widget>[
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Column(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.white, Colors.blue.shade800],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          height: size.height - (size.height / 11.7),
                          width: size.width,
                          child: Column(children: [
                            SizedBox(
                              height: 25,
                            ),
                            Row(children: [
                              Container(
                                  decoration: BoxDecoration(
                                      /* image: DecorationImage(
                                            image: AssetImage(
                                                "assets/fundo_chiclete.png"),
                                            fit: BoxFit.cover,
                                          ),*/

                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25)),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.grey.shade100
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)),
                                  width: size.width / 3,
                                  height: size.height / 1.151,
                                  child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.0),
                                      child: Text(
                                        "Bem Vindo!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.grey.shade800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 130,
                                    ),
                                    Container(
                                      width: size.width / 5,
                                      height: size.height / 15,
                                      child: TextFormField(
                                        controller: _controller,
                                        autocorrect: false,
                                        autofocus: true,
                                        cursorColor: Colors.white,
                                        style: TextStyle(
                                            color: Colors.grey.shade900),
                                        onChanged: (String data) {
                                          _username = data;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Usuário',
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade900),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          fillColor: Colors.grey.shade900,
                                          contentPadding: const EdgeInsets.only(
                                              left: 14.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade900),
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade900),
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: size.width / 5,
                                      height: size.height / 15,
                                      child: TextFormField(
                                        controller: _controller2,
                                        autocorrect: false,
                                        autofocus: false,
                                        obscureText: true,
                                        cursorColor: Colors.grey.shade900,
                                        style: TextStyle(
                                            color: Colors.grey.shade900),
                                        onChanged: (String data) {
                                          _password = data;
                                          print(_password);
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Senha',
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade900),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          fillColor: Colors.grey.shade900,
                                          contentPadding: const EdgeInsets.only(
                                              left: 14.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade900),
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade900),
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(children: [
                                      SizedBox(
                                        width: 170,
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                            child: Container(
                                              height: 20,
                                              width: 100,
                                              child: Text(
                                                "Entrar",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.grey.shade900,
                                              onPrimary: Colors.white,
                                              alignment: Alignment.bottomLeft,
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              elevation: 25.0,
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0),
                                              ),
                                            ),
                                            onPressed: () async {
                                              print("did it!");
                                              //    Navigator.of(context).push(
                                              //     HeroDialogRoute(builder: (context) {
                                              //   return LoadingSpin();
                                              //  }));
                                              print(_username);
                                              print(_password);
                                              //  bool res = await Get.find<
                                              //          Autenticacao>()
                                              //      .doRequest(
                                              //          _username, _password);
                                              //  print(res);
                                              // print("CODIGO DO USUARIO ->>>> " +
                                              //     Get.find<InventoryPageController>()
                                              //         .coUsuario
                                              //         .toString());
                                              // Get.find<InventoryPageController>()
                                              //     .username = _username;
                                              // Get.find<InventoryPageController>()
                                              //         .cnpjControlada =
                                              //     Get.find<LoginRequest>().userCnpj;
                                              //  print("CNPJ CELIO" +
                                              //      Get.find<InventoryPageController>()
                                              //          .cnpjControlada);
                                              //  print(res);
                                              //  var resPermissao = await Get.find<
                                              //          LoginPermissaoRequest>()
                                              //      .doRequest(Get.find<
                                              //              InventoryPageController>()
                                              //          .coUsuario);
                                              //  Get.find<InventoryPageController>()
                                              //      .permissaoF2 = resPermissao;
                                              //  print('Resposta getPermissaoF2: ->' +
                                              //      resPermissao.toString());
                                              var res =
                                                  true; //dummy remove this dumb fuck
                                              if (!res) {
                                                Navigator.of(context).pop();
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                          title: Text("Erro:",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade900)),
                                                          content:
                                                              SingleChildScrollView(
                                                                  child: ListBody(
                                                                      children: <
                                                                          Widget>[
                                                                Text(
                                                                    "Usuário/senha não cadastrados ou URL incorreta!",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .pink
                                                                            .shade300)),
                                                              ])));
                                                    });
                                                var _timer = Timer(
                                                    Duration(seconds: 2), () {
                                                  //  Navigator.of(context)
                                                  //      .pop();
                                                });
                                              } else {
                                                // Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        settings: RouteSettings(
                                                            name: '/menu'),
                                                        builder: (_) =>
                                                            Menu()));
                                              }

                                              this._username = '';
                                              this._password = '';
                                              this._controller.clear();
                                              this._controller2.clear();
                                            }),
                                      ),
                                    ]),
                                  ])),
                              SizedBox(
                                width: 100,
                              ),
                              Column(children: [
                                Container(
                                    height: 100,
                                    child: Text(
                                      "SysManager",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 80, color: Colors.white),
                                    )),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                    height: size.height / 2,
                                    width: size.width / 2,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "assets/glossy-machine-learning.png"),
                                      fit: BoxFit.fitWidth,
                                    )))
                              ]),
                            ]),
                          ]),
                        ),
                      ]))
                ]))));
  }
}
