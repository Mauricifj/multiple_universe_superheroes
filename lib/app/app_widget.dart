import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Modular.initialRoute,
      title: 'Super Hero App',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
