import 'package:flutter/material.dart';
import 'package:nufus360/views/home_screen.dart';

void main() {
  runApp(const Nufus360App());
}

class Nufus360App extends StatelessWidget {
  const Nufus360App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nüfus360',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF1A237E),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
