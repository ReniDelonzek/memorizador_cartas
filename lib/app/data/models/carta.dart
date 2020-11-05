enum Naipe { ESPADAS, COPAS, PAUS, OURO }

enum Tipo {
  AS,
  DOIS,
  TRES,
  QUATRO,
  CINCO,
  SEIS,
  SETE,
  OITO,
  NOVE,
  DEZ,
  DAMA,
  VALETE,
  REI
}

class Carta {
  Naipe naipe;
  Tipo tipo;
  Carta({
    this.naipe,
    this.tipo,
  });
}
