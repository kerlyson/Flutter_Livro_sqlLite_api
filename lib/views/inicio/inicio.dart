import 'package:atividade_03/views/formulario/livro_form.dart';
import 'package:atividade_03/views/lista_livros_api/lista_livros_api.dart';
import 'package:atividade_03/views/lista_livros_local/lista_livros_local.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Formulario'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LivroForm(),
            ),
          ),
        ),
         RaisedButton(
          child: Text('Lista BD'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListaLivrosLocal(),
            ),
          ),
        ),
         RaisedButton(
          child: Text('Lista API'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListaLivrosApi(),
            ),
          ),
        ),
      ],
    );
  }
}
