import 'package:flutter/material.dart';
import 'package:livraria_brasil/paginas/TelaBase.dart';
import 'package:livraria_brasil/paginas/TelaInicial.dart';

class Livraria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Livros Brasil',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Base(),
    );
  }
}