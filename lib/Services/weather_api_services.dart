import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WeatherApiServices{

  Map <String, dynamic> data = {};
   Map <String, dynamic> current = {};
   Map <String, dynamic> location= {};


  Future<void> fetchWorldWeatherApi() async{
    final response = await http.get(Uri.parse("http://api.weatherapi.com/v1/current.json?key=258f004eb4f44042b54180807241601&q=Karachi&aqi=no"));
    
    if(response.statusCode==200){
          if (kDebugMode) {
            print(response);
          }

       data = jsonDecode(response.body.toString());
      current = data['current']; 
      location = data['location'];
     
    }
    }
  }
