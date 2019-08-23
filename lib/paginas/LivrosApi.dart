import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../modelos/livro.dart';
import '../modelos/card_livro.dart';

class ListaLivrosApi extends StatefulWidget {
  @override
  _ListaLivrosApiState createState() => _ListaLivrosApiState();
}

class _ListaLivrosApiState extends State<ListaLivrosApi> {
  List<Livro> listaDeLivros = new List<Livro>();
  @override
  Widget build(BuildContext context) {
    obtemLivros();
    return ListView.builder(
      itemCount: listaDeLivros.length,
      itemBuilder: (context, index) {
        return CardLivro(listaDeLivros[index]);
      },
    );
  }

  obtemLivros() async {
    List<Livro> listaObjetosdeLivros = new List<Livro>();
    String url = "https://api.myjson.com/bins/1fpyfn";
    http.Response resposta = await http.get(url);
    if (resposta.statusCode == 200) {
      var code = jsonDecode(resposta.body);
      for (var livros in code) {
        var livro = Livro.fromJson(livros);
        listaObjetosdeLivros.add(livro);
      }
    }
    this.listaDeLivros = listaObjetosdeLivros;
  }
}
