getIcons(String? icon) {
  if (icon == null) return 'assests/clear.json';
  switch (icon.toLowerCase()) {
    case 'rain' :
    case 'drizzle' :
      return 'assets/rain.json';
    case 'thunderstorm' :
      return 'assets/thunderstrome.json';
    case 'snow' :
      return 'assets/snow.json';
    case 'clear' :
      return 'assets/clear.json';
    case 'clouds' :
      return 'assets/clouds.json';
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
    case 'sand':
    case 'ash':
    case 'squall':
    case 'tornado':
      return "assets/atmosphere.json";
    default :
      return 'assets/clear.json';
  }
}