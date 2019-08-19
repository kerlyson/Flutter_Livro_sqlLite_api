enum TipoDisponibilidade {
  venda,
  aluguel
}

class EnumString {

  //TODO: funcao para retornar todos os values as string array,

  static String getDisponibilidade(TipoDisponibilidade disponibilidade) {
    switch (disponibilidade) {
      case TipoDisponibilidade.aluguel : return 'Aluguel';
      case TipoDisponibilidade.venda : return 'Venda';
      
    }
    return '';
  }
  static TipoDisponibilidade getDisponibilidadeValue(String disponibilidade) {
    switch (disponibilidade) {
      case 'Aluguel' : return TipoDisponibilidade.aluguel;
      case  'Venda': return TipoDisponibilidade.venda ;
      
    }
    return null;
  }

}