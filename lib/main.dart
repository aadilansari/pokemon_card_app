import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_card_app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokémon Card App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: AppRoutes.routes,
        theme: ThemeData(
    primarySwatch: Colors.yellow,
    primaryColor: Colors.yellow,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black, // Text color on app bar
      elevation: 4,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.yellow,
      brightness: Brightness.light,
    ),
  ),
    );
  }
}