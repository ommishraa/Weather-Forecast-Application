import 'package:flutter/material.dart';

Widget getWeatherImage({String weatherDescription, Color color, double size}) {
  switch (weatherDescription) {
    case 'Clear':
      {
        return Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/images/clear.png',
          ),
        );
      }
      break;
    case 'Clouds':
      {
        return Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/images/cloudy.png',
          ),
        );
      }
      break;
    case 'Rain':
      {
        return Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/images/rain.png',
          ),
        );
      }
      break;
    case 'Mist':
      {
        return Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/images/mist.png',
          ),
        );
      }
      break;
    case 'Haze':
      {
        return Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/images/haze.png',
          ),
        );
      }
      break;
    case 'Snow':
      {
        return Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/images/winter.png',
          ),
        );
      }
      break;
    default:
      {
        return Image(
          height: 300,
          width: 300,
          image: AssetImage(
            'assets/images/clear.png',
          ),
        );
      }
      break;
  }
}
