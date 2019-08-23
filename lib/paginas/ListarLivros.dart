import 'package:flutter/material.dart';
import '../db/livro_dao.dart';

class ListarLivros extends StatefulWidget {
  @override
  _ListarLivrosState createState() => _ListarLivrosState();
}

class _ListarLivrosState extends State<ListarLivros> {
  LivroDao _dao = new LivroDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _dao.getlivros(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
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
      ),
    );
  }
}