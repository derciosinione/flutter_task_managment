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
