import 'package:flutter/material.dart';

String testRegExp() {
  ///  r'[\w+]'：表示匹配一个字母或者数字，等同于一个 [a-zA-Z0-9_]，
  ///  r'(\w+)': 表示匹配一段字符串，这段字符串由字母、数字和_组成。
  String? valueReturn = '';
  RegExp expRegExp = RegExp(r'(ba)');
  String strRegExp = '   Par@se my string';
  //  String strRegExp = '  ';

  /// You should prefer to use a raw string as argument to the [RegExp]
  /// constructor, because it makes it easy to write
  /// the `\` and `$` characters as regexp reserved characters.
  /// 也就是说 raw string 里面遇到 \w 这些简写时，会主动把它当做 \w 用，不用在它前面加上 \ 转义。
  /// 而 regular string，如下面的 RegExp('[\\w+]') 例子，则需要在前面加上 \ 进行转义，才能把它
  /// 当做 \w （匹配一个字母或者数字）用。其他的 ^ 、$ ('(aB)\$')可能也类似。
  // RegExp expRegExp1 = RegExp('[\\w+]');
  // String strRegExp1 = '[\sww';

  /// If your code enables `multiLine`, then `^` and `$` will match
  /// the beginning and end of a _line_, as well as matching beginning and
  /// end of the input, respectively.
  /// 如果 ^xxx 的 ^ 不是放在 [] 里面，那么他要匹配的字符串要以 xxx 开头；或者多行字符串里要有一行以 xxx 开头。
  /// 如果 xxx$ 的 $ 不是放在 [] 里面，那么他要匹配的字符串要以 xxx 结束；或者多行字符串里要有一行以 xxx 结束。
  // RegExp expRegExp1 = RegExp(r'^(aB)');
  // String strRegExp1 = 'aaaBdfd_';
  // RegExp expRegExp1 = RegExp('(aB)\$');
  // String strRegExp1 = 'aa3aB';

  ///  对于[^xxx]：
  ///  如果String都是由xxx中的字符组成，则不匹配；
  ///  如果String中有不是xxx的字符，则匹配。也就是找出那些不是xxx中的字符。
  // RegExp expRegExp1 = RegExp(r'[^aB]');
  // // String strRegExp1 = 'aaBBa';
  // String strRegExp1 = 'Badce_d';

  ///   * 和 + 限定符都是贪婪的，因为它们会尽可能多的匹配文字，只有在它们的后面加上一个 ? 就可以实现非贪婪或最小匹配。
  ///   贪婪：尽可能多的匹配文字，直到字符串（strRegExp1）的后面没有和 regular expression string 的 */+ 后面的
  ///   表达式（如下例子中 * 后面的 >R）相同的子字符串；
  // RegExp expRegExp1 = RegExp(r'<.*?>');
  RegExp expRegExp1 = RegExp(r'<.*>');
  // RegExp expRegExp1 = RegExp(r'<.*>R');
  String strRegExp1 = '<h1>RUNOOB-菜鸟教程</h1>';
  try{
    RegExpMatch? match = expRegExp1.firstMatch(strRegExp1);
    return (match![0]).toString();
  } catch (e) {
    return e.toString();
  }

  /// firstMatch:  This method searches a string for the first position where the regexp matches.
  /// 在字符串中搜索和regexp匹配的子字符串，如果找到，返回第一个匹配的子字符串的位置，否则返回 Null。如下面的例子中，
  /// 没有找到匹配的子字符串，所以 match 是 Null。这时候调用 match![0] 会产生异常。
/* firstMatch
  try {
    RegExpMatch? match = expRegExp.firstMatch(strRegExp);
    /// pattern: The source regular expression string used to create this `RegExp`
    debugPrint(expRegExp.pattern);
    debugPrint("If print null when no match?");
    debugPrint(match is Null? "print null": "don't print null");
    debugPrint("print");
    return (match![0]).toString();
  } catch (e) {
    return e.toString();
  }
*/


  /// allMatches:  look for all matches of a regular expression in a string.
  /// 在字符串中搜索所有和regexp匹配的子字符串，如果找到，返回所有匹配的子字符串的迭代对象，否则返回 Nall。
/*  allMatches
  try{
    Iterable<RegExpMatch> matches = expRegExp.allMatches(strRegExp);
    for (final m in matches) {
      debugPrint(m[0].toString());
      valueReturn = valueReturn! + m[0].toString();
    }
    return valueReturn!;
  }catch(e){
    return e.toString();
 }
*/

  /// hasMatch: Checks whether this regular expression has a match in the input.
  /// 查看字符串中是否有和regexp匹配的子字符串，返回值是bool类型。
/*  [^xxx]测试       hasMatch测试
  try {
    bool ifMatch = expRegExp1.hasMatch(strRegExp1);
    debugPrint(ifMatch.toString());
    RegExpMatch? match = expRegExp1.firstMatch(strRegExp1);
    debugPrint(match![0].toString());
    return (match![0]).toString();
  } catch (e) {
    return e.toString();
  }
*/
}