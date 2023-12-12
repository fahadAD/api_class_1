import 'dart:convert';

import 'package:api_calsses1/WeatherProject/WeatherModel.dart';
import 'package:http/http.dart' as http;

class GetWeatherRepo{
  Future<WeatherModel> getWeather({required String citie_s})async{
   String uri="https://api.openweathermap.org/data/2.5/weather?q=$citie_s&units=metric&appid=fc59b04aa5b2df91d35db6fbf4800b7b";
   var response=await http.get(Uri.parse(uri));
   print(response.body);
   print(response.statusCode);

   var data = jsonDecode(response.body);
   return WeatherModel.fromJson(data);
  }
}