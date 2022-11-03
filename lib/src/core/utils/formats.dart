import 'package:intl/intl.dart';

String formatPrice(double? price){
  final numberFormat = NumberFormat.decimalPattern();
  return numberFormat.format(price ?? 0.0);
}