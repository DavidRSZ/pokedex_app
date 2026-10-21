import '../widgets/colores_tipo.dart';

class Pokemon{
  const Pokemon({
    required this.numero,
    required this.nombre,
    required this.generacion,
    required this.tipo1,
    this.tipo2,
    required this.alturaM,
    required this.pesoKg,
    required this.especie,
    required this.descripcion,
  });

  final int numero;
  final String nombre;
  final int generacion;
  final String tipo1;
  final String? tipo2;
  final double alturaM;
  final double pesoKg;
  final String especie;
  final String descripcion;

  String get numeroConCeros => numero.toString().padLeft(4, '0');

  String get tipos => tipo2 == null
      ? nombreDeTipo(tipo1)
      : '${nombreDeTipo(tipo1)} / ${nombreDeTipo(tipo2!)}';

  String get alturaTexto => '${alturaM.toStringAsFixed(1).replaceAll('.', ',')} m';

  String get pesoTexto => '${pesoKg.toStringAsFixed(1).replaceAll('.', ',')} kg';

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      numero: json['dex'],
      nombre: json['name_es'],
      generacion: json['generation'],
      tipo1: json['type1'],
      tipo2: json['type2'],
      alturaM: (json['altura_m'] as num).toDouble(),
      pesoKg: (json['peso_kg'] as num).toDouble(),
      especie: json['especie'],
      descripcion: json['descripcion'],
    );
  }
}