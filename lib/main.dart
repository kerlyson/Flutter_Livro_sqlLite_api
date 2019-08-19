import 'package:atividade_03/views/formulario/livro_form.dart';
import 'package:atividade_03/views/inicio/inicio.dart';
import 'package:atividade_03/views/lista_livros_local/lista_livros_local.dart';
import 'package:atividade_03/views/sobre/sobre.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexTelaSelecionado = 0;

  List<_Tela> _telas = [
    _Tela('Inicio', Inicio()),
    _Tela('Sobre', Sobre()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _telas[_indexTelaSelecionado].widget,
       bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    const inicio = BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Inicio'),
    );
    const sobre = BottomNavigationBarItem(
      icon: Icon(Icons.perm_device_information),
      title: Text('Sobre'),
    );

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[inicio, sobre],
      currentIndex: _indexTelaSelecionado,
      selectedItemColor: Colors.blue,
      onTap: _mudarCorpoInicio,
    );
  }

  void _mudarCorpoInicio(int index) {
    setState(
      () {
        _indexTelaSelecionado = index;
      },
    );
  }
}

class _Tela {
  String titulo; // titulo na AppBar
  Widget widget; // corpo no Scaffold

  _Tela(this.titulo, this.widget);
}
