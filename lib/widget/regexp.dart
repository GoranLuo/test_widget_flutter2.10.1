///  正则匹配的介绍： https://www.runoob.com/regexp/regexp-syntax.html
///  Flutter常用正则: https://www.jianshu.com/p/8b4cc0dc3309
import 'package:flutter/material.dart';

String testRegExp() {
  ///  r'[\w+]'：表示匹配一个字母或者数字，等同于一个 [a-zA-Z0-9_]，
  ///  r'(\w+)': 表示匹配一段字符串，这段字符串由字母、数字和_组成。
  String? valueReturn = '';
  RegExp expRegExp = RegExp(r'(ba\w*)');
  String strRegExp = '   Parba@se my bastrinr';
  //  String strRegExp = '  ';
  ///  正向预查、反向预查（正则匹配中的条件匹配）
  ///  正向预查（?=，?<=）：在任何开始匹配圆括号内的正则表达式模式的位置来匹配搜索字符串。 ?= 相当与 if ==；
  ///  负向预查（?!，?<!）：在任何开始不匹配该正则表达式模式的位置来匹配搜索字符串。 ?! 相当与 if !=；
  ///  exp1(?=exp2)：查找 exp2 前面的 exp1。   (?<=exp2)exp1：查找 exp2 后面的 exp1。
  ///  exp1(?!exp2)：查找后面不是 exp2 的 exp1。   (?<!exp2)exp1：查找前面不是 exp2 的 exp1。
  // RegExp expRegExp1 = RegExp(r'ba(?=ec)');
  // // String strRegExp1 = '<h1>RUNbaecdd';
  // String strRegExp1 = '<h1>RUNbadecdd';
  // try{
  //   RegExpMatch? match = expRegExp1.firstMatch(strRegExp1);
  //   return (match![0]).toString();
  // } catch (e) {
  //   return e.toString();
  // }

  ///  对一个正则表达式模式或部分模式两边添加圆括号将导致相关匹配存储到一个临时缓冲区中，所捕获的每个子匹配都按照
  ///  在正则表达式模式中从左到右出现的顺序存储。缓冲区编号从 1 开始，最多可存储 99 个捕获的子表达式。每个缓冲区
  ///  都可以使用 \n 访问，其中 n 为一个标识特定缓冲区的一位或两位十进制数。
  ///  也就是说正则表达式里如果有两个 ()，那么就有两个缓冲区，会把相关匹配分别存储到这两个临时缓冲区中。而且第一个
  ///  () 可以通过 \1 访问，第二个 () 可以通过 \2 访问。 但是这个的用法是什么？怎么用？
  ///  反向引用的最简单的、最有用的应用之一，是提供查找文本中两个相同的相邻单词的匹配项的能力。例如：'(.)\1' 匹配两
  ///  个连续的相同字符。
  // RegExp expRegExp1 = RegExp(r'([a-z]+) \1');
  // String strRegExp1 = 'Is is the cost of dd of gasoline going up up';
  // try {
  //   RegExpMatch? match = expRegExp1.firstMatch(strRegExp1);
  //   return (match![0]).toString();
  // } catch (e) {
  //   return e.toString();
  // }

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
  // RegExp expRegExp1 = RegExp(r'<.*>');
  // // RegExp expRegExp1 = RegExp(r'<.*>R');
  // String strRegExp1 = '<h1>RUNOOB-菜鸟教程</h1>';
  // try{
  //   RegExpMatch? match = expRegExp1.firstMatch(strRegExp1);
  //   return (match![0]).toString();
  // } catch (e) {
  //   return e.toString();
  // }


  /// RegExp.escape
  /// This method is mainly used to create a pattern to be included in a larger regular expression.
  /// 主要用于创建要包含在较大正则表达式中的模式。
  ///
  /// 如果想将包含特殊字符的字符串（regular string, not raw string）作为模版pattern，用RegExp.escape函数可以将
  /// 其生成能使用模版regular string（非 raw string），escape函数会自动在特殊字符前加上 \ 进行转义，从而能在模版中
  /// 使用这些字符本身。
  /// 这里的特殊字符指的是：如果要用这些字符本身，需要用 \ 进行转义的字符。
  /// 不包含特殊字符的字符串也可以用escape函数，只是没必要。


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
  ///
  ///  可迭代对象的元素的获取:
  ///  可迭代对象iterable<String>，但不是列表。不能用[n]获取它的元素。用方法toList()后，可以用[n]获取它的元素。
  ///  从打印结果来看，很像Python的元组，可能iterable打印出来的结果都这样？
  ///  如下的例子中，用allMatches方法进行正则匹配，获得的可迭代对象后，就不能直接用 matches[1][0] 获取第二个匹配
  ///  字段的内容，而可以用matches.toList()[1][0]获取第二个匹配字段的内容。
/*  allMatches  */
  // String? valueReturn = '';
  // RegExp expRegExp = RegExp(r'(ba\w*)');
  // String strRegExp = '   Parba@se my bastring';
  try{
    Iterable<RegExpMatch> matches = expRegExp.allMatches(strRegExp);
    for (final m in matches) {
      debugPrint(m[0].toString());
      valueReturn = valueReturn! + m[0].toString();
    }
    debugPrint(matches.toList()[1][0]);
    return valueReturn!;
  }catch(e){
    return e.toString();
  }


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


  /// A regular expression match.
  /// The string matched by the group named [name].
  /// Returns the string matched by the capture group named [name], or `null` if no string was matched
  /// by that capture group as part of this match.
  /// The [name] must be the name of a named capture group in the regularexpression creating this match
  /// (that is, the name must be in [groupNames]).

  ///  如果 pattern 模板是：(?<xx>XXX)
  ///  (?<xx>) 这部份不是匹配时所用到的模板，XXX才是匹配时所用到的模板pattern。而xx则是
  ///  模板 pattern XXX 匹配字段的名称 name。
  ///  匹配生成 regExpMatch 对象后，所有的模板 pattern XXX 匹配字段的名称name会生成一个
  ///  包含所有name的迭代对象，它是属性groupNames的值。
  ///  匹配后，regExpMatch 对象的属性有：groupNames和所有的名称name。方法有namedGroup。
  ///  方法 namedGroup 是通过名称name（xx）获取相应的匹配字段XXX
  ///
  ///  regExpMatch.groupNames 是可迭代对象iterable<String>，但不是列表。不能用[n]
  ///  获取它的元素。从打印结果来看，很像Python的元组，可能iterable打印出来的结果都这样？
/* match namedGroup  <name>
  const pattern =
      r'^\[(?<Time>\s*((?<hour>\d+)):((?<minute>\d+))\.((?<second>\d+)))\]'
      r'\s(?<Message>\s*(.*)$)';

  final regExp = RegExp(
    pattern,
    multiLine: true,
  );
  const multilineText = '[01:23.37] This is a first message.\n'
      '[01:15.57] This is a second message.\n';

  RegExpMatch regExpMatch = regExp.firstMatch(multilineText)!;
  print(regExpMatch.groupNames.join('-')); // hour-minute-second-Time-Message.
  final time = regExpMatch.namedGroup('Time'); // 01:23.37
  final hour = regExpMatch.namedGroup('hour'); // 01
  final minute = regExpMatch.namedGroup('minute'); // 23
  final second = regExpMatch.namedGroup('second'); // 37
  final message = regExpMatch.namedGroup('Message'); // This is a first message.
  print('$time\n$hour\n$minute\n$second\n$message');
  // print(regExp.groupNames);
  print(regExpMatch.groupNames);
  ///  regExpMatch.groupNames 是可迭代对象iterable<String>，但不是列表。不能用[n]
  ///  获取它的元素。从打印结果来看，很像Python的元组，可能iterable打印出来的结果都这样？
  //  print(regExpMatch.groupNames[0]);
  print(regExpMatch.groupNames.toList()[0]);
  print(regExpMatch.namedGroup(regExpMatch.groupNames.toList()[1]));
  return regExpMatch.namedGroup(regExpMatch.groupNames.toList()[1]).toString();

//   final date = regExpMatch.namedGroup('Date'); // Undefined `Date`, throws.
*/
}

///  部分常用正则： https://www.jianshu.com/p/8b4cc0dc3309
/*
///手机号验证
static bool isChinaPhoneLegal(String str) {
return RegExp(
r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
    .hasMatch(str);
}
///邮箱验证
static bool isEmail(String str) {
return RegExp(
r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$")
    .hasMatch(str);
}
///验证URL
static bool isUrl(String value) {
return RegExp(
r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+")
    .hasMatch(value);
}
///验证身份证
static bool isIdCard(String value) {
return RegExp(
r"\d{17}[\d|x]|\d{15}")
    .hasMatch(value);
}
///验证中文
static bool isChinese(String value) {
return RegExp(
r"[\u4e00-\u9fa5]")
    .hasMatch(value);
}
// 验证是否为纯字母
static bool isLetter(String str) {
final reg = RegExp(r"^[ZA-ZZa-z_]+$");
return reg.hasMatch(str);
}
// 验证是否为数字
static bool isNumber(String str) {
final reg = RegExp(r"^[0-9_]+$");
return reg.hasMatch(str);
}
//验证是否包含特殊字符
static bool isHaveSpecialCharacters(String input) {
final reg = new RegExp(r'[`~!@#$%^&*()_+=|;:(){}'',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？-]');
return reg.hasMatch(input);
}
*/