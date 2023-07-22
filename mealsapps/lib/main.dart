import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapps/data/data.dart';
import 'package:mealsapps/screen/meals.dart';
import 'package:mealsapps/screen/tap.dart';
import 'screen/cataegories.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 164, 16, 5),
  ),
  textTheme: GoogleFonts.aliceTextTheme(),
);

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TapScreen(),
      //MainScreen(),
      //MealScreen(title: "sample", meals: dummyMeals),
    );
  }
}
