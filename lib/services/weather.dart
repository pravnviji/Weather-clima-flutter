import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(defaultValue: 200)
  int? statusCode = 200;

  @JsonKey(required: true)
  String description;

  @JsonKey(required: true)
  int id;

  @JsonKey(required: true)
  String name;

  @JsonKey(required: true)
  final double temp;

  WeatherModel(
      {required this.id,
      required this.name,
      required this.temp,
      required this.description,
      this.statusCode});

  WeatherModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['weather'][0]['description'],
        temp = json['main']['temp'],
        statusCode = json['statusCode'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'temp': temp,
        'description': description,
        'statusCode': statusCode
      };

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
