enum TipoDisponibilidade {
  venda,
  aluguel
}

class EnumString {

  // TODO: funcao para retornar todos os values as string array,
  // funcao para retornar TipoDisponibilidade pelo valor string,

  static String getDisponibilidade(TipoDisponibilidade disponibilidade) {
    print(disponibilidade);
    switch (disponibilidade) {
      case TipoDisponibilidade.aluguel : return 'Aluguel';
      case TipoDisponibilidade.venda : return 'Venda';
      
    }
    return '';
  }

}