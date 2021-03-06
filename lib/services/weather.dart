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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
