import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/weather_model.dart';

class Client {

  Future<String> getcityname() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    final location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    
    List<Placemark> place = await placemarkFromCoordinates(location.latitude, location.longitude);
    String city = place[0].locality!;
    return city;
  }

  Future<Weather> getWeather(String city) async {
    String apiKey = '8d286459af9df3244c7427ec952fd5ac';
    String url = 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body); 
    if (response.statusCode == 200) {
      return Weather.fromjson(body);
    } else {
      throw "Error" ;
    }
  }

  Future<List<Weather>> getWeatherForecast(String city) async {
    String apiKey = '8d286459af9df3244c7427ec952fd5ac';
    String url = 'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<Weather> res = [];
      for (Map<String,dynamic> weatherdata in data['list']) {
        res.add(Weather.fromjsonforecast(weatherdata));
      }
      return res;
    }else {
      throw 'Error';
    }
  }
}

Client client = Client();