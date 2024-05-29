import 'package:TrackingASL/pages/search_page.dart';
import 'package:flutter/material.dart';

import 'package:TrackingASL/pages/detail_page.dart';
import 'package:TrackingASL/pages/home_page.dart';
import 'package:TrackingASL/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking ASL',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
        '/search': (context) => const SearchPage()
      },
    );
  }
}
