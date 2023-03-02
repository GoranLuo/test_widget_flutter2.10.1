// RegExp 的方法 firstMatch:

String testRegExp() {
  RegExp exp = RegExp(r'(\w+)');
  // String str = 'Parse my string';
  String str = '  ';
  try {
    RegExpMatch? match = exp.firstMatch(str);
    return (match![0]).toString();
  } catch (e) {
    return e.toString();
  }
  // print(match![0]); // "Parse"
}
