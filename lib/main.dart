import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(Contact());
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
