import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:disaster_notifier/pages/homepage.dart';
import 'package:disaster_notifier/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
            ),
        theme: myTheme,
        home: AnimatedSplashScreen(
            backgroundColor: Colors.white,
            splash: Image.asset("assets/logo.gif"),
            splashIconSize: 300,
            nextScreen: const Homepage()));
  }
}
