// firstMatch:  This method searches a string for the first position where the regexp matches.
// 在字符串中搜索和regexp匹配的子字符串，如果找到，返回第一个匹配的子字符串的位置，否则返回"false"？

// allMatches:  look for all matches of a regular expression in a string.
// 在字符串中搜索所有和regexp匹配的子字符串，如果找到，返回所有匹配的子字符串的迭代对象，否则触发异常？

// hasMatch: Checks whether this regular expression has a match in the input.
// 查看字符串中是否有和regexp匹配的子字符串，返回值是bool类型。

import 'dart:html';
import 'package:flutter/cupertino.dart';

String testRegExp() {
  //  r'(\w+)'：\w表示匹配一个字母或者数字，等同于一个 [a-zA-Z0-9_]，
  //  后面有+，则表示多个[a-zA-Z0-9_]，也就是匹配一段由字母或者数字或者_组成的字符串。
  String? valueReturn = '';
  RegExp expRegExp = RegExp(r'(\w+)');
  String strRegExp = '   Par@se my string';
  //  String strRegExp = '  ';

  //  对于[^xxx]：
  //  如果String都是由xxx中的字符组成，则不匹配；
  //  如果String中有不是xxx的字符，则匹配。也就是找出那些不是xxx中的字符。
  RegExp expRegExp1 = RegExp(r'[^aB]');
  String strRegExp1 = 'aaBBa';
  // String strRegExp1 = 'Badce_d';

/* firstMatch
  try {
    RegExpMatch? match = expRegExp.firstMatch(strRegExp);
    debugPrint(match![0]);
    return (match![0]).toString();
  } catch (e) {
    return e.toString();
  }
*/

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

/*  [^xxx]测试       hasMatch测试 */
  try {
    bool ifMatch = expRegExp1.hasMatch(strRegExp1);
    debugPrint(ifMatch.toString());
    RegExpMatch? match = expRegExp1.firstMatch(strRegExp1);
    debugPrint(match![0]);
    return (match![0]).toString();
  } catch (e) {
    return e.toString();
  }
}
