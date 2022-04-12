import 'package:intl/intl.dart';

class DateFormatter{
  static DateFormatter instance = DateFormatter._init();
  DateFormatter._init();

  final formatter = DateFormat('yyyy-MM-dd');
}