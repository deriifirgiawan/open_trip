import 'package:intl/intl.dart';

String formatCurrency(int amount) {
  return NumberFormat.currency(locale: "id_ID", decimalDigits: 0)
      .format(amount);
}
