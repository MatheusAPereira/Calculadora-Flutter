import 'package:calculadora/components/memory.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DisplayState extends State<Display>{

  String bottomText = '0';
  String upperText = '';

  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              AutoSizeText(
              upperText,
              minFontSize: 20,
              maxFontSize: 100,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.none,
                fontSize: 40,
                color: Color.fromARGB(255, 116, 116, 119),
              ),
              ),
              
              AutoSizeText(
              bottomText = widget.memory.value,
              minFontSize: 20,
              maxFontSize: 96,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w300,
                decoration: TextDecoration.none,
                fontSize: 80,
                color: Colors.white,
              ),
              )
              ],
            )
            )
          ]
        ),
      )
    );
  }
}

class Display extends StatefulWidget{

  Memory memory;

  Display({required this.memory});

  @override
  createState() => DisplayState();
}