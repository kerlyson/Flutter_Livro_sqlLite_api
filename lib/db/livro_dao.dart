import 'data_base.dart';
import '../modelos/livro.dart';
class LivroDao {
  final _db = DataBase.db;

  inserir(Livro livro) async {
    final db = await _db.database;
    final res = await db.insert("livro", livro.toJson());
    print('insert: $res');
    // return res;
  }

  Future<List<Livro>> getlivros() async {
    final db = await _db.database;
    final List<Map<String, dynamic>> res = await db.query("livro", orderBy: 'id DESC');
  
    List<Livro> livros = res.isNotEmpty ? res.map((livro) => Livro.fromMap(livro)).toList() : [];

    return Future.value(livros);
  }
}
