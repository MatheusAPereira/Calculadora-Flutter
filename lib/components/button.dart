import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget{

  static const DEFAULT_COLOR = Color.fromARGB(255, 46, 47, 56);
  static const FIRST_LINE_COLOR = Color.fromARGB(255, 78, 80, 95);
  static const EMPHASIS_COLOR = Color.fromARGB(255, 75, 94, 252);

  final String? text;
  final IconData? icon;
  final Color color;
  final void Function(String) callback;
  
  const Button({this.text, this.icon, this.color = DEFAULT_COLOR, required this.callback});
  const Button.firstLine({this.text, this.icon, this.color = FIRST_LINE_COLOR, required this.callback});
  const Button.emphasisLine({this.text, this.icon, this.color = EMPHASIS_COLOR, required this.callback});

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color),
          ),
          onPressed: 
            () => callback(text!)
          ,
          child: (icon) != null
          ? Icon(icon)
          : Text(
            text!,
            style: TextStyle(
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w300,
              fontSize: 32,
              color: Colors.white
              ),
            ),
      )
    );
  }
}