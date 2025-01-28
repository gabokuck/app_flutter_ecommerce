import 'package:intl/intl.dart';

class FormatDate {
  static String format(DateTime date) {
    // Configurar el idioma, por ejemplo, "es_ES" para español
    Intl.defaultLocale = 'es_ES';

    String formattedDate =
        DateFormat('EEEE, d MMMM yyyy hh:mm a').format(date.toLocal());
    return formattedDate;
  }
}
