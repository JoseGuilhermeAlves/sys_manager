import 'dart:async';
import 'dart:io' as IO;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sys_manager/screens/menu/menu_android.dart';
import 'package:sys_manager/screens/menu/menu_view.dart';

class LoginEx extends StatefulWidget {
  LoginEx();

  set servidor(String servidor) {}

  @override
  _LoginExState createState() => _LoginExState();
}

class _LoginExState extends State<LoginEx> {
  String _username = '', _password = '';

  String _response = '';

  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  TextEditingController _controllerDialog = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dialogFormKey = GlobalKey<FormState>();
  FocusNode userFocus = FocusNode();
  FocusNode senhaFocus = FocusNode();

  @override
  void initState() {
    Get.put(Menu());
    Get.put(MenuAndroid());
    super.initState();
  }

  loadUrl() async {}
  checkVersion(var version) async {
    if (IO.Platform.isAndroid) {
      print("its android!");
      /* final newVersion = NewVersion(
        androidId: "br.com.nlphd.PhdInventoryManager",
      );

      newVersion.showAlertIfNecessary(context: context);*/
    } else if (kIsWeb) {
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

    return Scaffold(
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
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue.shade800],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Form(
              key: _globalKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(40),
                child: Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  kIsWeb
                      ? Row(children: [
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Container(),
                          ),
                          Padding(
                            padding: kIsWeb
                                ? EdgeInsets.symmetric(horizontal: 10.0)
                                : EdgeInsets.symmetric(horizontal: 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25))),
                              elevation: 15,
                              child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(25),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.grey.shade300
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)),
                                  width: kIsWeb
                                      ? size.width / 3.2
                                      : size.width / 2.2,
                                  height: size.height,
                                  child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        width: size.width / 5,
                                        height: size.height / 15,
                                        child: Image(
                                            alignment: Alignment.center,
                                            image: AssetImage(
                                                'assets/glossy-machine-learning.png'))),
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
                                            fontSize: kIsWeb ? 40 : 20,
                                            color: Colors.grey.shade800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: kIsWeb ? 90 : 90,
                                    ),
                                    Container(
                                      width: kIsWeb ? size.width / 5 : 100,
                                      height: size.height / 15,
                                      child: TextFormField(
                                        controller: _controller,
                                        autocorrect: false,
                                        autofocus: true,
                                        cursorColor: Colors.black,
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
                                      width: kIsWeb ? size.width / 5 : 100,
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
                                        onFieldSubmitted: (value) async {
                                          Get.to(Menu());

                                          this._username = '';
                                          this._password = '';
                                          this._controller.clear();
                                          this._controller2.clear();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: kIsWeb ? 60 : 70,
                                    ),
                                    Row(children: [
                                      SizedBox(
                                        width: kIsWeb ? 180 : size.width / 15,
                                      ),
                                      ElevatedButton(
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
                                            Get.to(Menu());

                                            this._username = '';
                                            this._password = '';
                                            this._controller.clear();
                                            this._controller2.clear();
                                          }),
                                    ]),
                                  ])),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 8,
                          ),
                        ])
                      : Column(children: <Widget>[
                          Container(
                              height: size.height / 10,
                              child: Text(
                                "Sys_Manager",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: kIsWeb ? 65 : 35,
                                    color: Colors.white),
                              )),
                          Container(
                              height: size.height / 10,
                              width: size.width / 1.3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    "assets/glossy-machine-learning.png"),
                                fit: BoxFit.fitWidth,
                              ))),
                          SizedBox(height: 40),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            elevation: 15,
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.grey.shade300
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)),
                                width:
                                    kIsWeb ? size.width / 3 : size.width / 1.3,
                                //height: 450,
                                child: Column(children: [
                                  Container(
                                      width: size.width / 4,
                                      height: size.height / 15,
                                      child: Image(
                                          alignment: Alignment.center,
                                          image: AssetImage(
                                              'assets/glossy-machine-learning.png'))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.0),
                                    child: Text(
                                      "Bem Vindo!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: kIsWeb ? 40 : 20,
                                          color: Colors.grey.shade800),
                                    ),
                                  ),
                                  SizedBox(
                                    height: kIsWeb ? 90 : 80,
                                  ),
                                  Container(
                                    width: kIsWeb
                                        ? size.width / 5
                                        : size.width / 2.3,
                                    height: size.height / 15,
                                    child: TextFormField(
                                      focusNode: userFocus,
                                      controller: _controller,
                                      autocorrect: false,
                                      autofocus: true,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                          color: Colors.grey.shade900),
                                      onChanged: (String data) {
                                        _username = data;
                                      },
                                      onFieldSubmitted: (String data) {
                                        userFocus.unfocus();
                                        senhaFocus.requestFocus();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Usuário',
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade900),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        fillColor: Colors.grey.shade900,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
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
                                    width: kIsWeb
                                        ? size.width / 5
                                        : size.width / 2.3,
                                    height: size.height / 15,
                                    child: TextFormField(
                                      focusNode: senhaFocus,
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
                                            left: 14.0, bottom: 8.0, top: 8.0),
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
                                      onFieldSubmitted: (value) async {
                                        IO.Platform.isAndroid
                                            ? Get.to(MenuAndroid())
                                            : Get.to(Menu());

                                        this._username = '';
                                        this._password = '';
                                        this._controller.clear();
                                        this._controller2.clear();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: kIsWeb ? 60 : 20,
                                  ),
                                  Row(children: [
                                    SizedBox(
                                      width: kIsWeb ? 180 : size.width / 4.5,
                                    ),
                                    ElevatedButton(
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
                                                new BorderRadius.circular(30.0),
                                          ),
                                        ),
                                        onPressed: () async {
                                          IO.Platform.isAndroid
                                              ? Get.to(MenuAndroid())
                                              : Get.to(Menu());

                                          this._username = '';
                                          this._password = '';
                                          this._controller.clear();
                                          this._controller2.clear();
                                        }),
                                  ]),
                                ])),
                          ),
                        ]),
                ]),
              ))),
    );
  }
}
