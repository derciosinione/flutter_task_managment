import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  const months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  String day = date.day.toString();
  String month = months[date.month - 1]; // Month is 1-based, array is 0-based
  String year = date.year.toString();

  return '$month $day, $year';
}

String formatDateString(String dateString) {
  List<String> parts = dateString.split('-');
  if (parts.length != 3) {
    throw FormatException('Invalid date format');
  }

  String year = parts[0];
  String month = parts[1].padLeft(2, '0');
  String day = parts[2].split(' ')[0].padLeft(2, '0');
  String formattedDateString = '$year-$month-$day';
  return formattedDateString;
}

String formatDateTimeToAgo(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inDays == 0) {
    if (difference.inHours == 0) {
      if (difference.inMinutes <= 1) {
        return 'Agora mesmo';
      } else {
        return '${difference.inMinutes} minutos atrás';
      }
    } else {
      return '${difference.inHours} horas atrás';
    }
  } else if (difference.inDays == 1) {
    return 'Ontem';
  } else if (difference.inDays == 2) {
    return '2 dias atrás';
  } else {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
