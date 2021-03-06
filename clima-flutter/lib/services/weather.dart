import 'location.dart';
import 'networking.dart';

String apiKey = 'e837f10259e42de727cc10ef3a995d9e';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(Uri(
      host: 'api.openweathermap.org',
      path: '/data/2.5/weather',
      queryParameters: {
        'q': cityName,
        'appid': apiKey,
        'units': 'metric'
      },
      scheme: 'https',
    ));

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper(new Uri(
        host: 'api.openweathermap.org',
        path: '/data/2.5/weather',
        queryParameters: {
          'lat': location.latitude.toString(),
          'lon': location.longitude.toString(),
          'appid': apiKey,
          'units': 'metric'
        },
        scheme: 'https',
    ));

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
