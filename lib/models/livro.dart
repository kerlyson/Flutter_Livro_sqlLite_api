import 'package:atividade_03/models/tipo_disponibilidade.dart';

class Livro {
  int _id;
  String _titulo;
  String _autor;
  double _preco;
  bool _ehNacional;
  TipoDisponibilidade _disponibilidade;

// TODO: substituir por paramentros opcionais
// id pode comecar com null
// disponibilidade eh salva como string... converter para o valor enum quando receber string 
  Livro(this._id, this._titulo, this._autor, this._preco, this._ehNacional,
      this._disponibilidade);

  int get id => this._id;
  set id(int id) => this._id = id;

  String get titulo => this._titulo;
  set titulo(String titulo) => this._titulo = titulo;

  String get autor => this._autor;
  set autor(String autor) => this._autor = autor;

  double get preco => this._preco;
  set preco(double preco) => this._preco = preco;

  bool get ehNacional => this._ehNacional;
  set ehNacional(bool ehNacional) => this._ehNacional = ehNacional;
  
  TipoDisponibilidade get disponibilidade => this._disponibilidade;
  set disponibilidade(TipoDisponibilidade disponibilidade) =>
      this._disponibilidade = disponibilidade;
}
