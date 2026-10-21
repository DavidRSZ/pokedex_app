import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../widgets/colores_tipo.dart';

class PokemonDetalle extends StatefulWidget {
  const PokemonDetalle({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<PokemonDetalle> createState() => _PokemonDetalleState();
}

class _PokemonDetalleState extends State<PokemonDetalle> {
  bool esShiny = false;

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    final carpeta = esShiny ? 'sprites_shiny' : 'sprites';

    return Scaffold(
      backgroundColor: colorDeTipo(pokemon.tipo1),
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          pokemon.nombre,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_awesome),
            tooltip: 'Ver Shiny',
            onPressed: () {
              setState(() {
                esShiny = !esShiny;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${pokemon.numeroConCeros}. ${pokemon.nombre}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Divider(color: Colors.white),
            const SizedBox(height: 8),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/$carpeta/${pokemon.numero}.png',
                    filterQuality: FilterQuality.none,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _FilaDato(etiqueta: 'Altura', valor: pokemon.alturaTexto),
                      _FilaDato(etiqueta: 'Peso', valor: pokemon.pesoTexto),
                      _FilaDato(etiqueta: 'Tipo', valor: pokemon.tipos),
                      _FilaDato(etiqueta: 'Especie', valor: pokemon.especie),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(color: Colors.white),
            const SizedBox(height: 16),

            Text(
              pokemon.descripcion,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilaDato extends StatelessWidget {
  const _FilaDato({required this.etiqueta, required this.valor});

  final String etiqueta;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$etiqueta: $valor',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Container(height: 1, color: Colors.white),
        ],
      ),
    );
  }
}
