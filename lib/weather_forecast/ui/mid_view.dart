import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather/weather_forecast/util/convert_icon.dart';
import 'package:weather/weather_forecast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data;
  var city = snapshot.data.name;
  var country = snapshot.data.sys.country;
  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList.dt * 1000);
//  var country = snapshot.data.city.country;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$city, $country",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${Util.getFormattedeDate(formattedDate)}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: getWeatherImage(
                weatherDescription: forecastList.weather[0].main),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecastList.main.temp.toString()}°F",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "   ${forecastList.weather[0].description.toUpperCase()}",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.wind,
                          size: 40, color: Colors.blue[900]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${forecastList.wind.speed.toStringAsFixed(1)}mi/h",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      // Icon(FontAwesomeIcons.wind, size: 40, color: Colors.blueGrey),
                      // Icon(FontAwesomeIcons.temperatureHigh, size: 20,),
                      // Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(children: [
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,
                        size: 40, color: Colors.blue[900]),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      " ${forecastList.main.humidity.toStringAsFixed(0)}%",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 40, color: Colors.blueGrey),
                    // Icon(Icons.hot_tub),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(children: [
                    Icon(FontAwesomeIcons.temperatureHigh,
                        size: 40, color: Colors.blue[900]),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${forecastList.main.tempMax.toStringAsFixed(0)}°F",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // Icon(Icons.wb_sunny),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}
