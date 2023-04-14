import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/aboutme_screen.dart';

void main() {
  runApp(const AboutMe());
}

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.mulish().fontFamily,
      ),
      home: const AboutMeScreen(),
    );
  }
}
