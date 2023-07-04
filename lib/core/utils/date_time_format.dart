import 'package:intl/intl.dart';

class DateTimeFormat {
  static String timeFormat(DateTime? date) {
    if (date == null) {
      return '';
    } else {
      var utcDateString = date.toString();
      utcDateString =
          utcDateString.endsWith("Z") ? utcDateString : '${utcDateString}Z';

      var utc = DateTime.parse(utcDateString);
      return DateFormat('d MMM yyyy, H:m').format(utc.toLocal());
    }
  }
}
