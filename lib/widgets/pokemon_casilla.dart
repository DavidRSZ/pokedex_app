import 'package:flutter/material.dart';

// Una casilla de la rejilla: el cuadrado blanco con el sprite del Pokémon.
class PokemonCasilla extends StatelessWidget {
  const PokemonCasilla({super.key, required this.numero});

  // Número de la Pokédex (1 = Bulbasaur, 25 = Pikachu...).
  final int numero;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(
          'assets/sprites/$numero.png',
          filterQuality: FilterQuality.none,
        ),
      ),
    );
  }
}
