import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/service/weather_icons.dart';

class WeatherForecast extends StatelessWidget {
  final String icon;
  final String time;
  final dynamic temp;
  const WeatherForecast({
    super.key,
    required this.icon,
    required this.time,
    required this.temp
  });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 4, 20),
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
            Lottie.asset(
            getIcons(icon),
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.30
            ),
            const SizedBox(height: 5,),
            Text(
              time,
              style: GoogleFonts.poppins(fontSize: 17,color: Colors.black54),
            ),
            const SizedBox(height: 5,),
            Text(
              "$temp°C",
              style: GoogleFonts.poppins(fontSize: 15,color: Colors.black87),
            )
          ],
        ),
      )
    );
  }
}