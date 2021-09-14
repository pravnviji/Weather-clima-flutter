import 'package:geolocator/geolocator.dart';
import 'package:json_annotation/json_annotation.dart';

class Location {
  @JsonKey(defaultValue: 0.00)
  double? latitude;

  @JsonKey(defaultValue: 0.00)
  double? longitude;

  @JsonKey(defaultValue: 200)
  int? statusCode;

  Location({this.latitude, this.longitude, this.statusCode});

  Location.fromJson(Map<String, dynamic> json)
      : latitude = json['data'][0]['latitude'],
        longitude = json['data'][0]['longitude'],
        statusCode = json['statusCode'];

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
