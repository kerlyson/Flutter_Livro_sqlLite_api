import 'package:flutter/material.dart';
import '../db/livro_dao.dart';
import '../modelos/card_livro.dart';
class ListarLivros extends StatefulWidget {
  @override
  _ListarLivrosState createState() => _ListarLivrosState();
}

class _ListarLivrosState extends State<ListarLivros> {
  LivroDao _dao = new LivroDao();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dao.getlivros(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return CardLivro(snapshot.data[index]);
              },
            ),
          );
        } else {
          return Center(child:CircularProgressIndicator(),);
        }
      },
    );
  }
}
