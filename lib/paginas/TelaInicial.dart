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
  List<Widget> _telas = [
    Formulario(),
    ListaLivrosApi(),
    ListarLivros(),
    Sobre(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial', style: TextStyle(color: Colors.white)),
      ),
      body: _telas.elementAt(_index),
      bottomNavigationBar: _bottomBar(),
    );
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      iconSize: 20,
       type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio')),
        BottomNavigationBarItem(icon: Icon(Icons.http), title: Text('Lista Api')),
        BottomNavigationBarItem(icon: Icon(Icons.library_books), title: Text('Lista BD')),
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
    });
  }
}
