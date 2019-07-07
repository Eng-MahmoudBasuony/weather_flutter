import 'package:intl/intl.dart';

class Utilities
{
  static String appId = "d6e481919bcce169184f16536bb64bd8";
  static String endpoint = "http://api.openweathermap.org/data/2.5/";


  static String date(DateTime dt) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dt);
  }

  static String dateTime(DateTime dt) {
    DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(dt);
  }

}