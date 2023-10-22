import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/service/weather_service.dart';
import 'package:weatherapp/widgets/weather_component.dart';
import 'package:weatherapp/widgets/weather_forecast.dart';
import 'package:weatherapp/widgets/weather_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? _weather;
  List<Weather>? _weatherforecast;
  int? index;
  bool _isLoading = true;

  getWeather () async {
    final city = await client.getcityname();
    final weather = await client.getWeather(city);
    final weatherforecast = await client.getWeatherForecast(city);
    setState(() {
      _weather = weather;
      _isLoading = false;
      _weatherforecast = weatherforecast;
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vathavaran"),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black54
        ),
        backgroundColor: Colors.blueGrey.shade100,
        elevation: 0,
        centerTitle: true,
        actions: [
          const SizedBox(width: 10,),
          IconButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
                getWeather();
              });
            }, 
            icon: const Icon(Icons.refresh_rounded)
          )
        ],
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: _isLoading == true ? const Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentWeather(
                icon: _weather!.icon, 
                name: _weather!.name,
                temp: _weather!.temp,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 10,10),
                color: Colors.blueGrey.shade100,
                child: Text(
                  "Additional Info",
                  style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black54),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Weathertemp(weather: _weather!.humidity, name: "Humidity",icon: Icons.water_drop_rounded,),
                    Weathertemp(weather: _weather!.pressure, name: "Pressure",icon: Icons.beach_access_rounded,),
                    Weathertemp(weather: _weather!.windspeed, name: "Wind Speed",icon: Icons.air_rounded,),
                    const SizedBox(width: 6,)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 10,10),
                color: Colors.blueGrey.shade100,
                child: Text(
                  'Hourly Forcast',
                  style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black54),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    final time = DateTime.parse(_weatherforecast![index].name);
                    final formattime = DateFormat.Hm().format(time);
                    return WeatherForecast(
                      icon: _weatherforecast![index].icon, 
                      time: formattime, 
                      temp: _weatherforecast![index].temp
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}