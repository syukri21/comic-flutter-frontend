String getYearFromString(String val) {
  String regexString = r'\b\d{4}\b';
  RegExp regExp = new RegExp(regexString);
  try {
    var matches = regExp.allMatches(val);
    return matches.elementAt(0).group(0);
  } catch (RangeError) {
    return " -- ";
  }
}
