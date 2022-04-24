import 'package:flutter/material.dart';

class WeatherModel {
  String WeatherStateName;
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;

  WeatherModel(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.WeatherStateName});

// استخدام factory const لانها بيتيح انك تعمل ريترن للاوبجكت وبالتالي نستغني عن علامه ؟ قبل المتغيرات

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      WeatherStateName: data['weather_state_name'],
      date:DateTime.parse( data['created']),
      temp: data['the_temp'],
      minTemp: data['min_temp'],
      maxTemp: data['max_temp'],
    );
  }



  // WeatherModel.fromJson(Map<String, dynamic> data) {
  //   WeatherStateName = data['weather_state_name'];
  //   date = data['applicable_date'];
  //   temp = data['the_temp'];
  //   minTemp = data['min_temp'];
  //   maxTemp = data['max_temp'];
  // }

  String getImage() {
    if (WeatherStateName == 'Snow' || WeatherStateName == 'Light Cloud') {
      return 'assets/images/cloudy.png';
    } else if (WeatherStateName == 'Sleet' ||
        WeatherStateName == 'Hail') {
      return 'assets/images/rainy.png';
    } else if (WeatherStateName == 'Heavy Cloud') {
      return 'assets/images/rainy.png';
    } else if (WeatherStateName == 'Light Rain' ||
        WeatherStateName == 'Heavy Rain' ||
        WeatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (WeatherStateName == 'Thunderstorm' || WeatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }


  MaterialColor getThemeColor() {
    if (WeatherStateName == 'Clear' || WeatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (WeatherStateName == 'Sleet' ||
        WeatherStateName == 'Snow' ||
        WeatherStateName == 'Hail') {
      return Colors.blue;
    } else if (WeatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (WeatherStateName == 'Light Rain' ||
        WeatherStateName == 'Heavy Rain' ||
        WeatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (WeatherStateName == 'Thunderstorm' || WeatherStateName == 'Thunder' ){
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}




