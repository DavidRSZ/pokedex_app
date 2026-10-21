import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'colores_tipo.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/pokemon_detalle.dart';

class PokemonCasilla extends StatelessWidget {
  const PokemonCasilla({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PokemonDetalle(pokemon: pokemon),
            ),
          );
      },
    child: Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: colorDeTipo(pokemon.tipo1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/sprites/${pokemon.numero}.png',
              filterQuality: FilterQuality.none,
            ),
          ),
          Text(
            pokemon.nombre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.arimo(fontSize: 8, color: Colors.white),
          ),
        ],
      ),
    ),
    );
  }
}