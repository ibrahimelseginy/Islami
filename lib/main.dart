import 'package:flutter/material.dart';
import 'package:islami_testing/app_theme.dart';
import 'package:islami_testing/home_screen.dart';

void main() {
  runApp(const Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routeName: (_) => HomeScreen()},
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.routeName,
    );
  }
}
