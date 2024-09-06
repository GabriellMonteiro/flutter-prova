import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/page_jokempo.dart';

void main() {
  runApp(MaterialApp(
    home: const JokempoPage(),
    theme: ThemeData(
      useMaterial3: false
    ),
  ));
}