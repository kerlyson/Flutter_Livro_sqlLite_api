import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:livraria_brasil/modelos/livro.dart';
import 'package:http/http.dart' as http;

class ListaLivrosApi extends StatefulWidget {
  @override
  _ListaLivrosApiState createState() => _ListaLivrosApiState();
}

class _ListaLivrosApiState extends State<ListaLivrosApi> {
  List<Livro> listaDeLivros = new List<Livro>();
  @override
  Widget build(BuildContext context) {
    obtemLivros();
    return Scaffold(
        body: ListView.builder(
            itemCount: listaDeLivros.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Text('Titulo: ' + listaDeLivros[index].titulo +
                      '\nAutor: ' + listaDeLivros[index].autor +
                      '\nPreço: ' + listaDeLivros[index].preco.toString() +
                      '\nNacional: ' + (listaDeLivros[index].ehNacional ? 'Sim' : 'Não') +
                      '\nDisponibilidade: ' + listaDeLivros[index].disponibilidade.toString()));
            }));
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
