import "package:atividade_03/models/tipo_disponibilidade.dart";

class Livro {
  int id;
  String titulo;
  String autor;
  double preco;
  bool ehNacional;
  TipoDisponibilidade disponibilidade;

  Livro({this.id, this.titulo, this.autor, this.preco, this.ehNacional,
      this.disponibilidade});
  Livro.fromBD(int id, String titulo, String autor, double preco,
      bool ehNacional, String disponibilidade) {
    this.id = id;
    this.titulo = titulo;
    this.autor = autor;
    this.preco = preco;
    this.ehNacional = ehNacional;
    this.disponibilidade = EnumString.getDisponibilidadeValue(disponibilidade);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "titulo": titulo,
      "autor": autor,
      "preco": preco,
      "ehNacional": ehNacional,
      "disponibilidade": EnumString.getDisponibilidade(disponibilidade)
    };
  }

  factory Livro.fromMap(Map<String, dynamic> json) {
    return new Livro.fromBD(json["id"], json["titulo"], json["autor"],
        json["preco"], json["ehNacional"] == 1, json["disponibilidade"]);
  }

  @override
  String toString() {
  return "id: $id, titulo: $titulo, autor: $autor, ehNacional: $ehNacional, preco: $preco, disponibilidade: $disponibilidade";
  }

}
