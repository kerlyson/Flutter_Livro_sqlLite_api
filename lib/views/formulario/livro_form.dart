import 'package:atividade_03/models/tipo_disponibilidade.dart';
import 'package:flutter/material.dart';

class LivroForm extends StatefulWidget {
  LivroForm({Key key}) : super(key: key);

  _LivroFormState createState() => _LivroFormState();
}

class _LivroFormState extends State<LivroForm> {

  final _formKey = GlobalKey<FormState>();


  final _disponibilidades = TipoDisponibilidade.values;
  TipoDisponibilidade _valorAtualDisponibilidades;
  bool _ehNacional = true;

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
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