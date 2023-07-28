
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final dynamic onPressed; //dynamic可以去掉

  const CustomButton({Key? key, required this.text, required this.width,  required this.height, required this.onPressed,}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      height: this.widget.height,
      child: ElevatedButton(
        onPressed:widget.onPressed ,
        child: Text(widget.text),
      ),
    );
  }
}
