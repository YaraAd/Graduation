import 'package:intl/intl.dart';

String formatEventDate(String? date) {
  if (date == null || date.isEmpty) return 'Date not available';
  try {
    final sanitized = date.replaceFirstMapped(
      RegExp(r'\.(\d{6})\d+'),
      (m) => '.${m[1]}',
    );
    final dt = DateTime.parse(sanitized);
    return DateFormat('MMM dd, y • h:mm a').format(dt);
  } catch (_) {
    return 'Invalid date';
  }
}
