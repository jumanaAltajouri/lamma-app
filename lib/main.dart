import 'package:flutter/material.dart';
import 'package:lammaapp/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lammaapp/home_screen.dart';
import 'onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(LammaApp(seenOnboarding: seenOnboarding));
}

class LammaApp extends StatelessWidget {
  final bool seenOnboarding;
  const LammaApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        '/home': (context) =>  HomeScreen(),
        '/onboarding': (context) =>  OnboardingScreen(),
      },
      initialRoute: seenOnboarding ? '/home' : '/onboarding',
    );
  }
}
