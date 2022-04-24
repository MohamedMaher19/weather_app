import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather__model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key}) : super(key: key);
  String ? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(

           onSubmitted: (data)async{
             cityName = data;
             WeatherServices services = WeatherServices();

           WeatherModel weather = await services.getWeather(cityName: cityName!);

            Provider.of<WeatherProvider>(context , listen: false).weatherData = weather;

             Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;


             print(weather.temp);

           Navigator.pop(context);


           },
            decoration: InputDecoration(
              contentPadding:EdgeInsets.symmetric(horizontal:16,vertical: 30) ,

              label: Text('Search'),

              suffix: Icon(Icons.search , ),

              hintText: 'Enter a city Name',

              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),

    );
  }
}
