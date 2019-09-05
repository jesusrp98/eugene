import 'package:flutter/material.dart';

import 'ui/screens/start.dart';

void main() => runApp(EugeneApp());

class EugeneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurrencyCrab',
      theme: ThemeData.dark(),
      home: StartScreen(),
    );
  }
}
