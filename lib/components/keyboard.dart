import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'button.dart';
import 'button_row.dart';

class Keyboard extends StatelessWidget{

  final void Function(String) callback;

  Keyboard(this.callback);

  @override
  Widget build(BuildContext context) {
      return Container(
      color: Colors.black,
      height: 500,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        ButtonRow([
          Button.firstLine(text: 'C', callback: callback,),
          Button.firstLine(text: '±', callback: callback),
          Button.firstLine(text: '%', callback: callback),
          Button.emphasisLine(text: '÷', callback: callback)
        ]),
        ButtonRow([
          Button(text: '7', callback: callback),
          Button(text: '8', callback: callback),
          Button(text: '9', callback: callback),
          Button.emphasisLine(text: '×', callback: callback)
        ]),
        ButtonRow([
          Button(text: '4', callback: callback),
          Button(text: '5', callback: callback),
          Button(text: '6', callback: callback),
          Button.emphasisLine(text: '−', callback: callback)
        ]),
        ButtonRow([
          Button(text: '1', callback: callback),
          Button(text: '2', callback: callback),
          Button(text: '3', callback: callback),
          Button.emphasisLine(text: '+', callback: callback)
        ]),
        ButtonRow([
          Button(text: '.', callback: callback),
          Button(text: '0', callback: callback),
          Button(text: '⌫', callback: callback),
          Button.emphasisLine(text: '=', callback: callback)
        ])
        ],
      ),
    );
  }
}