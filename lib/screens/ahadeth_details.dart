import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/ahadeth_model.dart';

class AhadethDetailsScreen extends StatefulWidget {
  static const String routeName = "ahadethDetailsScreen";
  const AhadethDetailsScreen({super.key});

  @override
  State<AhadethDetailsScreen> createState() => _AhadethDetailsScreenState();
}

class _AhadethDetailsScreenState extends State<AhadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as AhadethModel;

    return Stack(
      children: [
        Image.asset(
          "assets/images/main_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(model.title),
            backgroundColor: Colors.transparent,
          ),
          body: Card(
            elevation: 4,
            color: Color.fromARGB(255, 196, 179, 155).withOpacity(0.6),
            margin: EdgeInsets.all(16),
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: model.content.length,
                itemBuilder: (context, index) {
                  return Text(
                    model.content[index],
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  );
                }),
          ),
        )
      ],
    );
  }
}
