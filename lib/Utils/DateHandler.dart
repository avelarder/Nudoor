import 'package:intl/intl.dart';

class DateHandler{
  static String dateToString(DateTime date)
  {
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(date);
    return formatted;
  }
}