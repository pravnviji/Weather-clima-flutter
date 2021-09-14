import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String responseBody;
  @override
  void initState() {
    geoLocation();
    // TODO: implement initState
    super.initState();
  }

  var getLocationText = "Nothing inside";

  void geoLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('lat ' + location.latitude.toString());
    print("long " + location.longitude.toString());
    NetworkHelper helper = new NetworkHelper();
    var weatherData =
        await helper.getData(location.latitude, location.longitude);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(color: Colors.white, size: 100),
    ));
  }
}
