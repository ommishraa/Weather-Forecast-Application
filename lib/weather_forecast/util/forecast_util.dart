import 'package:intl/intl.dart';

class Util {
  static String appId = "01ce1f0f72d0951da0d651c2de68a5d4";

  static String getFormattedeDate(DateTime dateTime){
    return new DateFormat("EEE, MMM d, y").format(dateTime);
  }
}
