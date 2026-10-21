import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex_app/main.dart';

void main() {
  testWidgets('La splash lleva a la pantalla principal', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Cargando...'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Cargando...'), findsNothing);
    expect(find.text('Pokédex'), findsOneWidget);
  });
}
