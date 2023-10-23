import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petopia/screens/auth/login_page.dart';
import 'package:petopia/screens/auth/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/onboarding/onboarding_page.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  seenOnboard = prefs.getBool('seenOnboard') ?? false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      title: 'Management App',
      // home: seenOnboard == true ? const LoginPage() : const OnboardingPage(),
      home: const OnboardingPage(),
    );
  }
}