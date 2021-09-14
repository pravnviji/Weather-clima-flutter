import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String API_KEY = '57534cc13050e97ab43e101a425a44d6';

  Future<dynamic> getData(latitude, longitude) async {
    var decodeData;
    var weatherUrl;
    var response, decodeResponse;
    if (isDev) {
      weatherUrl = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=London&appid=$API_KEY&lat=$latitude&lon=$longitude');
      http.Response serverResponse = await http.get(weatherUrl);
      print(":: Server ::");
      decodeResponse = serverResponse.body;
      print(decodeResponse);
    } else {
      decodeResponse = await rootBundle.loadString('mock/weather.json');
    }
    print(":: getData ::");
    print("ELSE");
    response = WeatherModel.fromJson(jsonDecode(decodeResponse));
    print(response);
    print(response.id);
    print(response.name);
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
}
