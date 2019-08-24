import 'package:flutter/material.dart';
import './formulario.dart';
import './sobre.dart';
import './LivrosApi.dart';
import './ListarLivros.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    List<_Tela> _telas = [
        _Tela('Cadastro  Local',  Formulario(_onItemTapped)),
        _Tela('Livros na Nuvem',  ListaLivrosApi()),
        _Tela('Livros Locais',  ListarLivros(),),
        _Tela('Sobre',  Sobre()),

      ];
    return Scaffold(
      appBar: AppBar(
        title: Text(_telas[_index].titulo, style: TextStyle(color: Colors.white)),
      ),
      body: _telas[_index].widget,
      bottomNavigationBar: _bottomBar(),
    );
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      iconSize: 20,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.archive), title: Text('Cadastro')),
        BottomNavigationBarItem(
            icon: Icon(Icons.http), title: Text('Lista Api')),
        BottomNavigationBarItem(    icon: Icon(Icons.library_books), title: Text('Lista BD')),
        BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('Sobre')),
      ],
      currentIndex: _index,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      this._index = index;
      print(_index);
    });
  }
}

class _Tela {
  String titulo; // titulo na AppBar
  Widget widget; // corpo no Scaffold

  _Tela(this.titulo, this.widget);
}