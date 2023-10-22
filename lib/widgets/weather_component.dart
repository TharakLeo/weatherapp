import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Weathertemp extends StatelessWidget {
  final dynamic weather ;
  final String name;
  final IconData icon;
  const Weathertemp ({
    super.key,
    required this.weather,
    required this.name,
    required this.icon
  });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 4, 10),
      child: Container(
        height : MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.blueGrey.shade100,
            ),
            const SizedBox(height: 5,),
            Text(
              name,
              style: GoogleFonts.poppins(fontSize: 17,color: Colors.black54),
            ),
            const SizedBox(height: 5,),
            Text(
              "$weather",
              style: GoogleFonts.poppins(fontSize: 15,color: Colors.black87),
            )
          ],
        ),
      )
    );
  }
}
