import 'package:flutter/material.dart';
import './TelaInicial.dart';
class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Image.network(
                  'https://images.vexels.com/media/users/3/149510/isolated/preview/2585bf984d29347ef9acb44e2964c36d---cone-3d-pilha-de-livros-by-vexels.png',
                  width: 196,
                  height: 196,
                ),
                Text('Biblioteca Brasil', style: TextStyle(fontSize: 30))
              ])),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 75),
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TelaInicial()));
              },
              textColor: Colors.black54,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.green,
                      //Colors.lightGreen,
                      Colors.yellow,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('AVANÇAR', style: TextStyle(fontSize: 22)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
