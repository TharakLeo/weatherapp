class Weather {
  final String name;
  final dynamic temp;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic sealevel;
  final dynamic groundlevel;
  final dynamic windspeed;
  final String icon;
  const Weather({
    required this.name,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.sealevel,
    required this.groundlevel,
    required this.windspeed,
    required this.icon
  });

  factory Weather.fromjson(Map<String,dynamic> json) {
    return Weather(
      name: json['name'], 
      temp: json['main']['temp'], 
      pressure: json['main']['pressure'], 
      humidity: json['main']['humidity'], 
      sealevel: json['main']['sealevel'], 
      groundlevel: json['main']['groundlevel'], 
      windspeed: json['wind']['speed'], 
      icon: json['weather'][0]['main']
    );
  }

  factory Weather.fromjsonforecast(Map<String,dynamic> json) {
    return Weather(
      name: json['dt_txt'], 
      temp: json['main']['temp'], 
      pressure: json['main']['pressure'], 
      humidity: json['main']['humidity'], 
      sealevel: json['main']['sealevel'], 
      groundlevel: json['main']['groundlevel'], 
      windspeed: json['wind']['speed'], 
      icon: json['weather'][0]['main']
    );
  }
}