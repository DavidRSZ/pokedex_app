import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/pokemon.dart';

class PokedexRepositorio {
  Future<List<Pokemon>> cargarPokemon() async{
    final texto = await rootBundle.loadString('assets/data/pokedex.json');
    final lista = jsonDecode(texto) as List;

    return lista.map((item) => Pokemon.fromJson(item)).toList();
  }
}