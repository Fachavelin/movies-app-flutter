import 'package:intl/intl.dart';

class HumanFormats {
  
  static String number(double number) {
    return "${NumberFormat.compact(
      locale: 'en',
    ).format(number)}k";
  }

}