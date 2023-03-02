import 'package:flutter/material.dart';

class TextFormFieldTest extends StatelessWidget {
  const TextFormFieldTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: '请输入密码',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );
    return textFormField;
  }
}
