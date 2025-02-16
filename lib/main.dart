import 'package:flutter/material.dart';
import 'package:nightmode/constant_data.dart';
import 'package:nightmode/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ConstantData.setThemePosition(); // Ensure this does not modify theme incorrectly

    return MaterialApp(
      title: 'Night Mode',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark, // Ensure brightness is set correctly
        ),
        useMaterial3: true, // Optional: If you're using Material 3, ensure it's enabled
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
