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
        Image.network(
                  'https://images.vexels.com/media/users/3/149510/isolated/preview/2585bf984d29347ef9acb44e2964c36d---cone-3d-pilha-de-livros-by-vexels.png',
                  width: 196,
                  height: 196,
                ),
        Text('Livraria Brasil\n',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Text('Cadastro de livros rápido e prático.\n',
            style: TextStyle(fontSize: 18 /*fontWeight: FontWeight.bold*/)),
        Text('Desenvolvido por: Gutemberg e Kerlyson\n',
            style: TextStyle(fontSize: 18 /*fontWeight: FontWeight.bold*/)),
      ],
    ));
  }
}
