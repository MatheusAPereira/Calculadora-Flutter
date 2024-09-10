import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget{

  static const defaultDark = Color.fromARGB(255, 46, 47, 56);
  static const firstLineDark = Color.fromARGB(255, 78, 80, 95);
  static const emphasisLineDark = Color.fromARGB(255, 75, 94, 252);

  final String? text;
  final IconData? icon;
  final Color color;
  final void Function(String) callback;
  
  const Button({super.key, this.text, this.icon, this.color = defaultDark, required this.callback});
  const Button.firstLine({super.key, this.text, this.icon, this.color = firstLineDark, required this.callback});
  const Button.emphasisLine({super.key, this.text, this.icon, this.color = emphasisLineDark, required this.callback});

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: Padding(padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color),
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28.0))))
          ),
          onPressed: 
            () => callback(text!)
          ,
          child: (icon) != null
          ? Icon(icon)
          : Text(
            text!,
            style: const TextStyle(
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w300,
              fontSize: 32,
              color: Colors.white
              ),
            ),
      )
    )
    );
  }
}