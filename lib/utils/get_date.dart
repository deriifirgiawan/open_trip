import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<List<String>> getNext7DaysFormatted() async {
  await initializeDateFormatting(
      'id_ID', null); // Inisialisasi locale Bahasa Indonesia

  List<String> dates = [];
  DateTime today = DateTime.now();
  DateFormat format =
      DateFormat("d MMMM", "id_ID"); // Format tanggal dalam Bahasa Indonesia

  for (int i = 0; i < 7; i++) {
    dates.add(format.format(today.add(Duration(days: i))));
  }

  return dates;
}
