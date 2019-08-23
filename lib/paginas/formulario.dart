import 'package:flutter/material.dart';

import '../db/livro_dao.dart';
import '../modelos/livro.dart';
import '../modelos/tipo_disponibilidade.dart';

class Formulario extends StatefulWidget {
  Function(int) callback;
  Formulario(this.callback);
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();

  final LivroDao dao = LivroDao();
  TipoDisponibilidade _valorAtualDisponibilidades = TipoDisponibilidade.venda;
  bool _ehNacional = true;

  Livro _livro = new Livro();

  @override
  Widget build(BuildContext context) {
    _livro.disponibilidade = _valorAtualDisponibilidades;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                onSaved: (value) {
                  this._livro.titulo = value;
                },
                validator: _campoObg,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Autor'),
                onSaved: (value) {
                  this._livro.autor = value;
                },
                validator: _campoObg,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  this._livro.preco = double.parse(value);
                },
                validator: _campoObg,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Selecione a disponibilidade do livro:'),
              ),
              ..._disponibilidadesRadioButton(),
              _ehNacionalCheckBox(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print(_livro.toString());
                          dao.inserir(_livro);
                          widget.callback(2);
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Livro inserido!')));
                        }
                      },
                      child: Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _campoObg(value) {
    if (value.isEmpty) return 'Campo Obrigatorio';
    return null;
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
                  this._livro.disponibilidade = val;
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
                this._livro.ehNacional = value;
                this._ehNacional = value;
              },
            );
          },
        ),
      ],
    );
  }
}
