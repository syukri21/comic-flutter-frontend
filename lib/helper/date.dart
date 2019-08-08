class GetDate {
  final DateTime toDay = DateTime.now();

  String lastDays(int days) {
    String _lastDays = toDay.subtract(Duration(days: days)).toIso8601String();
    print(_lastDays);
    return _lastDays;
  }

  String relativeRange(String date) {
    Duration difference =
        toDay.difference(DateTime.parse(date.replaceAll(".000Z", "")));

    if (!difference.compareTo(Duration(days: 1)).isNegative) {
      return difference.inDays.toString() + " days ago";
    }
    if (!difference.compareTo(Duration(hours: 1)).isNegative) {
      return difference.inHours.toString() + " hours ago";
    }
    if (!difference.compareTo(Duration(minutes: 1)).isNegative) {
      return difference.inMinutes.toString() + " minutes ago";
    }

    if (!difference.compareTo(Duration(seconds: 1)).isNegative) {
      return difference.inSeconds.toString() + " seconds ago";
    }
    return "a second ago";
  }
}
