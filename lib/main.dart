import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sys_manager/screens/login/login_ex.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => LoginEx()),
      ],
    );
  }
}
