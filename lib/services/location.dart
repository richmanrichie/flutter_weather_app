import 'package:geolocator/geolocator.dart';
import 'networking.dart';
import 'networking.dart';
import 'networking.dart';

class Location {
  double latitude;
  double longitude;
  var _weatherData;
  String openUrl = 'https://api.openweathermap.org/data/2.5/weather';
  String apiKey = 'd3462d43db7d8c61e1a6edd471dab468';

  Future<dynamic> getCityData(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(url: '$openUrl?q=$cityName&appid=$apiKey&units=metric');
    _weatherData = await networkHelper.getData();
    return _weatherData;
  }

  Future<dynamic> getLocationData() async {
    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      NetworkHelper networkHelper = NetworkHelper(url: '$openUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
      _weatherData = await networkHelper.getData();
      return _weatherData;
    }catch (e) {
      print(e);
    }
  }
}