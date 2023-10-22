import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/service/weather_icons.dart';

class CurrentWeather extends StatelessWidget {
  final String icon;
  final String name;
  final dynamic temp;
  const CurrentWeather({
    super.key, 
    required this.icon, 
    required this.name, 
    required this.temp
  });

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20,20, 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width,
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
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.50
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 5,),
                Text(
                  name,
                  style: GoogleFonts.poppins(fontSize: 20,color: Colors.black54),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Text(
              "$temp°C",
              style: GoogleFonts.poppins(fontSize: 20,color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}