//format number according to #.##0.00 format
import 'package:intl/intl.dart';

final NumberFormat numberFormat = NumberFormat.currency(
  locale: 'vi-VN',
  symbol: '',
  decimalDigits: 2,
  customPattern: '#,##0.00',
);

// get number of days in a specific month
int getDaysInMonth(int year, int month) {
  return DateTime(year, month + 1).difference(DateTime(year, month)).inDays;
}
