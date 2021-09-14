import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String API_KEY = '57534cc13050e97ab43e101a425a44d6';
  String LOCATION_KEY = '2ecaf2f73b2b4e3d6acff94465a14c1f';

  Future<dynamic> getData(latitude, longitude, [region = "California"]) async {
    var decodeData;
    var weatherUrl;
    var response, decodeResponse;
    print(":: GetData ::");
    print(latitude);
    print(longitude);
    if (isDev) {
      weatherUrl = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$region&appid=$API_KEY&lat=$latitude&lon=$longitude');
      http.Response serverResponse = await http.get(weatherUrl);
      print(":: Server ::");
      decodeResponse = serverResponse.body;
      print(decodeResponse);
    } else {
      decodeResponse = await rootBundle.loadString('mock/weather.json');
    }
    response = WeatherModel.fromJson(jsonDecode(decodeResponse));
    if (response.statusCode == 200) {
      decodeData = response;
    } else {
      decodeData = response;
    }
    return decodeData;
  }

  Map<String, dynamic> toJson(res) {
    return {
      jsonEncode("response"): jsonEncode(res),
    };
  }

  Future<dynamic> getWeatherLocation(region) async {
    var decodeData;
    var locationUrl;
    var response, decodeResponse;
    print(":: getWeatherLocation ::");
    if (isDev) {
      locationUrl = Uri.parse(
          'http://api.positionstack.com/v1/forward?access_key=$LOCATION_KEY&query=$region');
      http.Response serverResponse = await http.get(locationUrl);
      print(":: Server ::");
      decodeResponse = serverResponse.body;
      print(decodeResponse);
    } else {
      decodeResponse = await rootBundle.loadString('mock/location.json');
      print(decodeResponse);
    }
    response = Location.fromJson(jsonDecode(decodeResponse));
    print(response.latitude);
    if (response.statusCode == 200) {
      decodeData = response;
    } else {
      decodeData = response;
    }
    return decodeData;
  }
}
