import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalBottomSheetItem extends StatelessWidget {
  final String text;
  final Color borderColor;
  final IconData? icon;
  final void Function()? onTap;
  const ModalBottomSheetItem({
    super.key,
    required this.text,
    this.onTap,
    required this.borderColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 192, 168, 133),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.elMessiri(
                  color: Colors.brown,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            Icon(
              icon,
              color: Colors.brown,
            )
          ],
        ),
      ),
    );
  }
}
