import 'package:atividade_03/db/livro_dao.dart';
//import 'package:atividade_03/models/livro.dart';
import 'package:atividade_03/models/tipo_disponibilidade.dart';
import 'package:flutter/material.dart';

class LivroForm extends StatefulWidget {
  LivroForm({Key key}) : super(key: key);

  _LivroFormState createState() => _LivroFormState();
}

class _LivroFormState extends State<LivroForm> {
  final _formKey = GlobalKey<FormState>();

  final LivroDao dao = LivroDao();
  TipoDisponibilidade _valorAtualDisponibilidades;
  bool _ehNacional = true;

  @override
  Widget build(BuildContext context) {
    // dao.inserir(Livro(titulo: 'Dart e Flutter', autor: 'João Sousa',disponibilidade: TipoDisponibilidade.venda, preco: 39.0, ehNacional: true));
    dao.getlivros();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Título'),
              onSaved: null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Autor'),
              onSaved: null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Preço'),
              onSaved: null,
            ),
            Text('Selecione a disponibilidade do livro:'),
            ..._disponibilidadesRadioButton(),
            _ehNacionalCheckBox(),
          ],
        ),
    ));
  }

  List<RadioListTile> _disponibilidadesRadioButton() {
    return TipoDisponibilidade.values
        .map(
          (opcao) => RadioListTile(
            title: Text("${EnumString.getDisponibilidade(opcao)}"),
            groupValue: _valorAtualDisponibilidades,
            value: opcao,
            onChanged: (val) {
              setState(
                () {
                  this._valorAtualDisponibilidades = val;
                },
              );
            },
          ),
        )
        .toList();
  }

  Row _ehNacionalCheckBox() {
    return Row(
      children: <Widget>[
        Text('Livro nacional:'),
        Checkbox(
          value: _ehNacional,
          onChanged: (bool value) {
            setState(
              () {
                this._ehNacional = value;
              },
            );
          },
        ),
      ],
    );
  }
}
