import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingItem extends StatelessWidget {
  final String text;
  const SettingItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffB7935F), width: 3),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.elMessiri(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Color(0xffB7935F),
            )
          ],
        ),
      ),
    );
  }
}
