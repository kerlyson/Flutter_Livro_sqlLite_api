import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Image.asset(''),
        Text('Livraria Brasil\n',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Text('Cadastro de livros rapido e pratico.\n',
            style: TextStyle(fontSize: 18 /*fontWeight: FontWeight.bold*/)),
        Text('Desenvolvido por: Gutemberg e Kerllyson\n',
            style: TextStyle(fontSize: 18 /*fontWeight: FontWeight.bold*/)),
      ],
    ));
  }
}
