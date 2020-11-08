import 'package:flutter/widgets.dart';
import 'package:memorizador_cartas/app/data/models/carta.dart';

class Utils {
  /// Retorna a String contendo a LETRA de acordo com o [tipo] especificado
  static String getLetraTipoCarta(Tipo tipo) {
    switch (tipo) {
      case Tipo.AS:
        return 'A';
        break;
      case Tipo.DOIS:
        return '2';
        break;
      case Tipo.TRES:
        return '3';
        break;
      case Tipo.QUATRO:
        return '4';
        break;
      case Tipo.CINCO:
        return '5';
        break;
      case Tipo.SEIS:
        return '6';
        break;
      case Tipo.SETE:
        return '7';
        break;
      case Tipo.OITO:
        return '8';
        break;
      case Tipo.NOVE:
        return '9';
        break;
      case Tipo.DEZ:
        return '10';
        break;
      case Tipo.DAMA:
        return 'Q';
        break;
      case Tipo.VALETE:
        return 'J';
        break;
      case Tipo.REI:
        return 'K';
      default:
        return '';
    }
  }

  /// Retorna o widget com a imagem de acordo com o [naipe] especificado
  static Widget getImageNaipe(Naipe naipe) {
    switch (naipe) {
      case Naipe.ESPADAS:
        return Image.asset(
          'imagens/espadas.png',
          fit: BoxFit.cover,
        );
      case Naipe.COPAS:
        return Image.asset(
          'imagens/copas.png',
          fit: BoxFit.cover,
        );
      case Naipe.PAUS:
        return Image.asset(
          'imagens/paus.png',
          fit: BoxFit.cover,
        );
      case Naipe.OURO:
        return Image.asset(
          'imagens/ouro.png',
          fit: BoxFit.cover,
        );
      default:
        return SizedBox();
    }
  }

  /// Retorna uma String com o nome do [naipe]
  static String getStringNaipe(Naipe naipe) {
    switch (naipe) {
      case Naipe.ESPADAS:
        return 'Espadas';
      case Naipe.COPAS:
        return 'Copas';
      case Naipe.PAUS:
        return 'Paus';
      case Naipe.OURO:
        return 'Ouro';
      default:
        return '';
    }
  }

  /// Retorna a String contendo o nome de acordo com o [tipo] especificado
  static String getStringTipoCarta(Tipo tipo) {
    switch (tipo) {
      case Tipo.AS:
        return 'Às';
        break;
      case Tipo.DOIS:
        return '2';
        break;
      case Tipo.TRES:
        return '3';
        break;
      case Tipo.QUATRO:
        return '4';
        break;
      case Tipo.CINCO:
        return '5';
        break;
      case Tipo.SEIS:
        return '6';
        break;
      case Tipo.SETE:
        return '7';
        break;
      case Tipo.OITO:
        return '8';
        break;
      case Tipo.NOVE:
        return '9';
        break;
      case Tipo.DEZ:
        return '10';
        break;
      case Tipo.DAMA:
        return 'Dama';
        break;
      case Tipo.VALETE:
        return 'Valete';
        break;
      case Tipo.REI:
        return 'Rei';
      default:
        return '';
    }
  }
}
