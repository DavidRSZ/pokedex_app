import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 255, 0, 0)),
      ),
      home: const SplashScreen(),
    );
  }
}
