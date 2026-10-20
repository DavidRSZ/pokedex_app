import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex_app/main.dart';

void main() {
  testWidgets('La splash lleva a la pantalla principal', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Al abrir la app se ve la pantalla de carga.
    expect(find.text('Cargando...'), findsOneWidget);

    // Pasados los 2 segundos de la splash, aparece la pantalla principal.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('Cargando...'), findsNothing);
    expect(find.text('Pokédex'), findsOneWidget);
  });
}
