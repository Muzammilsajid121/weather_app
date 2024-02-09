import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WeatherApiServices{

   Map <String, dynamic> data = {};
   Map <String, dynamic> current = {};
   Map <String, dynamic> location= {};

   Map <String, dynamic> forecast = {};
   Map <String, dynamic> forecastday= {};
   Map <String, dynamic> astro= {};
   Map <String, dynamic> hour= {};


  Future<void> fetchWorldWeatherApi(String locationquery) async{
    final response = await http.get(Uri.parse("http://api.weatherapi.com/v1/forecast.json?key=258f004eb4f44042b54180807241601&q=$locationquery&aqi=no"));
    
    if(response.statusCode==200){
          if (kDebugMode) {
            print(response);
          }

       data = jsonDecode(response.body.toString());
      current = data['current']; 
      location = data['location'];

      forecast = data['forecast'];
      forecastday = data['forecastday']; 
      astro = data['astro'];
      hour = data['hour'];

      
     
    }
    }
} 
