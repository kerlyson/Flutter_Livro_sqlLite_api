import 'package:atividade_03/db/livro_dao.dart';
import 'package:atividade_03/models/livro.dart';
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
  TipoDisponibilidade _valorAtualDisponibilidades = TipoDisponibilidade.venda;
  bool _ehNacional = true;

  Livro _livro = new Livro();

  @override
  Widget build(BuildContext context) {
    // dao.inserir(Livro(titulo: 'Dart e Flutter', autor: 'João Sousa',disponibilidade: TipoDisponibilidade.venda, preco: 39.0, ehNacional: true));
    dao.getlivros();
   this._livro.ehNacional = this._ehNacional; // inicia com o mesmo valor
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
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
              onSaved: (value){
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
            Text('Selecione a disponibilidade do livro:'),
            ..._disponibilidadesRadioButton(),
            _ehNacionalCheckBox(),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print(_livro.toString());
                  var res = dao.inserir(_livro);

                }
              },
              child: Text('Salvar'),
            ),
          ),
          ],
        ),

    ));
  }

  String _campoObg(value){
    if(value.isEmpty) return 'Campo Obrigatorio';
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
