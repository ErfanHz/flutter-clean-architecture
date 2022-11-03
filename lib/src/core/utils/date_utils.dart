import 'package:clean_base/src/plugins/persian_number_utility/persian_number_utility.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

String getJalaliDateText(String? date) {
  if (date == null || date.isEmpty) return '';
  try {
    return DateTime.parse(date ?? '').toJalali().formatShortDate();
  } catch (e) {
    return 'تاریخ نامعتبر';
  }
}

String getJalaliDate(String? date) {
  if (date == null || date.isEmpty) return '';
  try {
    return DateTime.parse(date).toLocal().toPersianDate();
  } catch (e) {
    return 'تاریخ نامعتبر';
  }
}

String getTime(String? date) {
  try {
    final x = date?.split(':');
    return '${x?[0]}:${x?[1]}';
  } catch (e) {
    return '00:00';
  }
}
