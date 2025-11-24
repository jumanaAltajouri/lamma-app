import 'package:flutter/material.dart';
import 'package:lammaapp/app_theme.dart';
import 'package:lammaapp/auth/create_new_password_screen.dart';
import 'package:lammaapp/auth/forget_password_screen.dart';
import 'package:lammaapp/auth/login_screen.dart';
import 'package:lammaapp/auth/register_screen.dart';
import 'package:lammaapp/auth/verification_screen.dart';
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
        ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
        VerificationScreen.routeName: (_) => VerificationScreen(email: ''),
        CreateNewPasswordScreen.routeName: (_) => CreateNewPasswordScreen(),
        loginScreen.routeName:(_) => loginScreen(),
        RegisterScreen.routeName:(_) => RegisterScreen(),
         HomeScreen.routeName:(_) => HomeScreen(),
         OnboardingScreen.routeName:(_) => OnboardingScreen(),
         
        // '/home': (context) =>  HomeScreen(),
        // '/onboarding': (context) =>  OnboardingScreen(),
      },
      initialRoute: loginScreen.routeName,
      // seenOnboarding ? '/home' : '/onboarding',
    );
  }
}
