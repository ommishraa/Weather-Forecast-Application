import 'package:flutter/material.dart';
import 'package:weather/weather_forecast/ui/mid_view.dart';

import 'model/weather_forecast_model.dart';
import 'network/netwok.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "mumbai";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

//    forecastObject.then((weather){
//      print(weather.list[1].weather[0].main);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFielsView(),
          Container(
              child: FutureBuilder<WeatherForecastModel>(
                  future: forecastObject,
                  builder: (BuildContext context,
                      AsyncSnapshot<WeatherForecastModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          midView(snapshot),
                        ],
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }))
        ],
      ),
    );
  }

  Widget textFielsView() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      new Network().getWeatherForcast(cityName: _cityName);
}
