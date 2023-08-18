import 'package:flutter/material.dart';

class JdTextField extends StatelessWidget {
  final String hint;
  bool password;
  var onChanged;
  var controller;

  JdTextField(
      {this.hint = "",
      this.password = false,
      this.onChanged,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: TextField(
        controller: controller,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        obscureText: this.password,
        decoration: InputDecoration(
            hintText: this.hint,
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
        onChanged: this.onChanged,
      ),
    );
  }
}
