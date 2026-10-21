import 'package:flutter/material.dart';
import '../widgets/pokemon_casilla.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        final alturaPantalla = MediaQuery.of(context).size.height;
        final anchoPantalla = MediaQuery.of(context).size.width;

        return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
                toolbarHeight: alturaPantalla / 11,
                backgroundColor: Colors.red.shade900,
                title: const Text(
                    'Pokédex',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              iconTheme: const IconThemeData (color: Colors.white),
              actions: [
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  tooltip: 'Filtrar',
                  onPressed: (){

                  },
                ),
              ],
            ),
                drawer: Drawer(
                    width: anchoPantalla * 0.7,
                    child: ListView(
                        children: const [
                            ListTile(leading: Icon(Icons.catching_pokemon), title: Text('Generaciones')),
                            ListTile(leading: Icon(Icons.favorite), title: Text('Favoritos')),
                            ListTile(leading: Icon(Icons.info), title: Text('Acerca de')),
                        ],
                    ),
            ),
            body: GridView.count(
              crossAxisCount: 6,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(4),
              children: List.generate(1025, (indice) {
                return PokemonCasilla(numero: indice + 1);
              }),
            ),
          );
    }}