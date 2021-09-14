import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: textController,
                  style: kTextFieldStyle,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter the location'),
                ),
              ),
              TextButton(
                onPressed: () {
                  getLocation();
                },
                style: kButtonTextStyle,
                child: Text('Get Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getLocation() async {
    NetworkHelper helper = new NetworkHelper();
    var location = await helper.getWeatherLocation(this.textController.text);
    print(":: getLocation ::");
    print(location.latitude);
    print(location.longitude);
    var weatherData = await helper.getData(
        location.latitude, location.longitude, this.textController.text);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }
}
