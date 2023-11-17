extension DateFormatter on DateTime {
  String toFormattedString() {
    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<String> months = [
      '',
      'Jan',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'Aug',
      'Sept',
      'October',
      'Nov',
      'Dec',
    ]; 
    return '${daysOfWeek[weekday - 1]}, ${months[month]} $day, $year';
  }
}
