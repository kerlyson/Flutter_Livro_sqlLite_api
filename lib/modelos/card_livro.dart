import 'package:flutter/material.dart';

import './livro.dart';
import './tipo_disponibilidade.dart';

class CardLivro extends StatelessWidget {
  Livro _livro;
  CardLivro(this._livro);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Título: ' +
              _livro.titulo +
              '\nAutor: ' +
              _livro.autor +
              '\nPreço: ' +
              _livro.preco.toString() +
              '\nNacional: ' +
              (_livro.ehNacional ? 'Sim' : 'Não') +
              '\nDisponibilidade: ' +
              EnumString.getDisponibilidade(_livro.disponibilidade),
        ),
      ),
    );
  }
}
