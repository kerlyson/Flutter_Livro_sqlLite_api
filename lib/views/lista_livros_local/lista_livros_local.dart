import 'package:atividade_03/db/livro_dao.dart';
import 'package:atividade_03/models/livro.dart';
import 'package:flutter/material.dart';

class ListaLivrosLocal extends StatefulWidget {
  ListaLivrosLocal({Key key}) : super(key: key);

  _ListaLivrosLocalState createState() => _ListaLivrosLocalState();
}

class _ListaLivrosLocalState extends State<ListaLivrosLocal> {
  LivroDao _dao = new LivroDao();
  @override
  Widget build(BuildContext context) {


    return  FutureBuilder(
        future: _dao.getlivros(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].titulo),
                    subtitle: Text(snapshot.data[index].autor),
                  ),
                );
              },
            );
          }
        },
    );
  }

 
}
