import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextSetting extends StatelessWidget {
  final String text;
  const CustomTextSetting({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Text(
        text,
        style: GoogleFonts.elMessiri(fontSize: 28, fontWeight: FontWeight.w600),
      ),
    );
  }
}
