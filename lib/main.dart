import 'package:flutter/material.dart';
import 'balance.dart';
//import 'testing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: RemainingMoney()));
  }
}
