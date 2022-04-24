import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather__model.dart';
class WeatherServices{

  String baseUrl = 'https://www.metaweather.com';

  // https://www.metaweather.com/api/location/search/?query=CAIRO
  // first we will get city info to use wo id from it

  Future <int> getCityId({required String cityName}) async {

    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');

    http.Response response = await  http.get(url);

    print(response.body);

    List<dynamic> data = jsonDecode(response.body);

    print(data);

    int cityId = data[0]['woeid'];

    print(cityId);
    return cityId;

  }

  // use function getcityid at the function get weather to use id

  Future<WeatherModel> getWeather ({required String cityName }) async{

    int id =await getCityId (cityName: cityName);

    Uri url = Uri.parse('$baseUrl/api/location/$id/');

   http.Response response = await http.get(url);

    Map<String , dynamic> jsonData =  jsonDecode(response.body);

    Map<String , dynamic> data  =   jsonData['consolidated_weather'][0];

    WeatherModel weatherData = WeatherModel.fromJson(data);

    return weatherData ;

  }

}