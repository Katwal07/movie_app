extension StringExtension on String {
  String lengthTrim() {
    return length > 10 ? '${substring(0, 10)}...' : this;
  }

  String toFormattedDate() {
    try {
      final DateTime parsedDate = DateTime.parse(this);
      return '${parsedDate.month}/${parsedDate.day}/${parsedDate.year}';
    } catch (e) {
      return this;
    }
  }
}
